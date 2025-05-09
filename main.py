from datetime import datetime
from flask import Flask, flash, request, render_template, session, redirect, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import func, desc
from flask_login import UserMixin, login_user, LoginManager, login_required, logout_user, current_user
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, EmailField
from wtforms.validators import DataRequired, Email, Length
from flask_migrate import Migrate
import compare, geometry
import random
from dotenv import load_dotenv
import hashlib
import os

app = Flask(__name__)
app.secret_key = "ThOD4fSYjEDhma9YgIq33NIcgSJhqxDA4hHTPqlDzXY"
app.config['TEMPLATES_AUTO_RELOAD'] = True
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:020Kruzer020@localhost/GlobeQuest'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

load_dotenv()
MAPILLARY_TOKEN = os.getenv("MAPILLARY_TOKEN")

db = SQLAlchemy(app)
migrate = Migrate(app, db)

#Flask_Login stuff
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'

@login_manager.user_loader
def load_user(user_id):
    return Users.query.get(int(user_id))

class LoginForm(FlaskForm):
    username = StringField("Username", validators=[DataRequired()], render_kw={"autocomplete": "off"})
    password = PasswordField("Password", validators=[DataRequired()], render_kw={"autocomplete": "off"})
    submit = SubmitField("Submit")

class RegisterForm(FlaskForm):
    username = StringField("Username", validators=[DataRequired(), Length(min = 8, max = 20)], render_kw={"autocomplete": "off"})
    email = EmailField("Email", validators=[DataRequired(), Email()], render_kw={"autocomplete": "off"})
    password = PasswordField("Password", validators=[DataRequired(), Length(min = 8)], render_kw={"autocomplete": "off"})
    submit = SubmitField("Submit")

@app.route('/login', methods = ['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = Users.query.filter_by(user_name = form.username.data).first()
        if user:
            salt = bytes.fromhex(user.user_salt)

            input_password_hash = hashlib.pbkdf2_hmac(
                'sha256',
                form.password.data.encode('utf-8'),
                salt,
                100000
            ).hex()

            if user.user_password == input_password_hash:
                current_login = LoginHistory(user_id=user.user_id, login_time=datetime.now(), ip_address=request.remote_addr)
                db.session.add(current_login)
                db.session.commit()
                
                login_user(user)
                flash("Logged in successfully.")
                return redirect('/')
            else:
                flash("Invalid username or password.")
        else:
            flash("Invalid username or password.")
    return render_template('login.html', form = form, show_logout = False)

@app.route('/register', methods = ['GET', 'POST'])
def register():
    form = RegisterForm()
    if form.validate_on_submit():
        user_email_check = Users.query.filter_by(user_email = form.email.data).first()
        user_username_check = Users.query.filter_by(user_name = form.username.data).first()
        if (user_email_check, user_username_check) == (None, None):
            salt = os.urandom(16)

            password = form.password.data.encode('utf-8')
            password_hash = hashlib.pbkdf2_hmac('sha256', password, salt, 100000)
            
            user = Users(user_name=form.username.data, user_password=password_hash.hex(), user_salt=salt.hex(), user_email=form.email.data)
            db.session.add(user)
            db.session.commit()

            flash("Registration successful.")
            return redirect('/login')
        elif user_email_check is not None and user_username_check is None:
            flash("The email you entered is already in use.")
        elif user_username_check is not None and user_email_check is None:
            flash("The username you entered is already in use.")
        else:
            flash("The email and username you entered are already in use.")
    else:
        if 'email' in form.errors:
            for error in form.errors['email']:
                if form.email.data:
                    flash(error)

    return render_template('register.html', form = form, show_logout = False)

@app.route('/logout', methods = ['GET', 'POST'])
@login_required
def logout():
    logout_user()
    flash("Logged out successfully.")
    return redirect('/login')

class Users(db.Model, UserMixin):
    __tablename__ = 'users'

    user_id = db.Column(db.BigInteger, primary_key = True)
    user_name = db.Column(db.String, unique = True, nullable = False)
    user_password = db.Column(db.String, nullable = False)
    user_salt = db.Column(db.String, nullable = True)
    user_email = db.Column(db.String, unique = True, nullable = False)

    score = db.relationship('Scores', back_populates='user', cascade="all, delete-orphan")
    login_history = db.relationship('LoginHistory', back_populates='user', cascade='all, delete-orphan')

    def __init__(self, user_name, user_password, user_salt, user_email):
        self.user_name = user_name
        self.user_password = user_password
        self.user_salt = user_salt
        self.user_email = user_email

    def __repr__(self):
        return f'<User {self.user_name}, Email {self.user_email}>'
    
    def get_id(self):
        return str(self.user_id)
    
class Scores(db.Model):
    __tablename__ = 'scores'

    score_id = db.Column(db.BigInteger, primary_key = True)
    user_id = db.Column(db.BigInteger, db.ForeignKey('users.user_id'), nullable = False)
    gamemode_id = db.Column(db.BigInteger, db.ForeignKey('game_modes.gamemode_id'), nullable = False)
    score = db.Column(db.Float, nullable = False)
    country_id = db.Column(db.Integer, db.ForeignKey('countries.country_id'), nullable=True)

    user = db.relationship('Users', back_populates='score')
    country = db.relationship('Countries', back_populates='score')
    game_mode = db.relationship('GameModes', back_populates='score')

    def __init__(self, user_id, gamemode_id, score, country_id=None):
        self.user_id = user_id
        self.gamemode_id = gamemode_id
        self.score = score
        self.country_id = country_id

class Countries(db.Model):
    __tablename__ = 'countries'

    country_id = db.Column(db.Integer, primary_key=True, autoincrement=True, unique=True)
    country_name = db.Column(db.String, unique=True, nullable=False)
    continent = db.Column(db.String, nullable=False)

    score = db.relationship('Scores', back_populates='country')

class GameModes(db.Model):
    __tablename__ = 'game_modes'

    gamemode_id = db.Column(db.BigInteger, primary_key=True, unique=True)
    gamemode_name = db.Column(db.String, unique=True, nullable=False)

    score = db.relationship('Scores', back_populates='game_mode')

class LoginHistory(db.Model):
    __tablename__ = 'login_history'

    login_id = db.Column(db.BigInteger, primary_key=True, autoincrement=True, unique=True)
    user_id = db.Column(db.BigInteger, db.ForeignKey('users.user_id'), nullable=False)
    login_time = db.Column(db.DateTime, nullable=False)
    ip_address = db.Column(db.String, nullable=True)

    user = db.relationship('Users', back_populates='login_history')

    def __init__(self, user_id, login_time, ip_address=None):
        self.user_id = user_id
        self.login_time = login_time
        self.ip_address = ip_address

class FlagNames(db.Model):
    __tablename__ = 'flag_names'

    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True)
    country_id = db.Column(db.BigInteger, nullable=False)
    code2l = db.Column(db.String(2), nullable=False, default='')
    language = db.Column(db.String(5), nullable=False, default='')
    name = db.Column(db.String(255), nullable=True)
    name_official = db.Column(db.String(255), nullable=True)

class Coordinates(db.Model):
    __tablename__ = 'coordinates'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    image_id = db.Column(db.String, unique=True, nullable=False)
    image_url = db.Column(db.String, nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)

    def __init__(self, image_id, image_url, latitude, longitude):
        self.image_id = image_id
        self.image_url = image_url
        self.latitude = latitude
        self.longitude = longitude

def chooseCountry():
    number1, number2, number3, number4 = 0, 0, 0, 0
    while True:
        number1 = Countries.query.order_by(func.random()).first()
        number2 = Countries.query.order_by(func.random()).first()
        number3 = Countries.query.order_by(func.random()).first()
        number4 = Countries.query.order_by(func.random()).first()
        if (number1!=number2 and number1!=number3 and number1!=number4) and (number2!=number3 and number2!=number4) and (number3!=number4):
            break
    mainId = random.randint(1, 4)
    if mainId == 1:
        mainCountry = number1
    elif mainId == 2:
        mainCountry = number2
    elif mainId == 3:
        mainCountry = number3
    else:
        mainCountry = number4
    
    return number1, number2, number3, number4, mainCountry

PAGE_HELP_MAPPING = {
    '/': '/help_main',
    '/drawdefine': '/help_drawdefine',
    '/draw': '/help_draw',
    '/detect': '/help_detect',
    '/compare': '/help_compare',
}
@app.context_processor
def inject_user():
    try:
        return {'logged_in_username': current_user.user_name}
    except AttributeError:
       return {'logged_in_username': None}

@app.route('/help_redirect', methods=['POST'])
def help_redirect():
    current_page = request.form.get('current_page')
    # Determine the redirect URL based on the current page
    redirect_url = PAGE_HELP_MAPPING.get(current_page, '/')
    return redirect(redirect_url)

@app.route('/help_main')
def help_main():
    return render_template('manuals/help_main.html')

@app.route('/help_drawdefine')
def help_drawdefine():
    return render_template('manuals/help_drawdefine.html')

@app.route('/help_draw')
def help_draw():
    return render_template('manuals/help_draw.html')

@app.route('/help_detect')
def help_detect():
    return render_template('manuals/help_detect.html')

@app.route('/help_compare')
def help_compare():
    return render_template('manuals/help_compare.html')

@app.route('/')
def index():
    return render_template('index.html', show_logout = True)

@app.route('/drawdefine', methods=['GET', 'POST'])
@login_required
def drawdefine():
    if request.method != "POST":
        return redirect('/')
    region = request.form.get('type')
    if region != "Drawdefine":
        return redirect('/')
    
    max_scores = db.session.query(
        Scores.user_id,
        func.max(Scores.score).label("max_score")
    ).filter(Scores.gamemode_id == 1).group_by(Scores.user_id).subquery()

    games_played_subq = db.session.query(
        Scores.user_id,
        func.count(Scores.score).label("games_played")
    ).filter(Scores.gamemode_id == 1).group_by(Scores.user_id).subquery()

    drawing_gamemode_scores = db.session.query(
        Users.user_name,
        Scores.score,
        games_played_subq.columns.games_played,
        Countries.country_name
    ).join(Scores, Users.user_id == Scores.user_id)\
    .join(max_scores, (Scores.user_id == max_scores.columns.user_id) & (Scores.score == max_scores.columns.max_score))\
    .join(games_played_subq, Scores.user_id == games_played_subq.columns.user_id)\
    .outerjoin(Countries, Scores.country_id == Countries.country_id)\
    .filter(Scores.gamemode_id == 1)\
    .order_by(desc(Scores.score))\
    .all()

    return render_template('drawdefine.html', drawing_gamemode_scores = drawing_gamemode_scores, show_logout = True)

@app.route('/draw', methods=['GET', 'POST'])
@login_required
def draw():
    if request.method == "POST":
        region = request.form.get('region')
        if region == "Europe":
            queried_countries = Countries.query.filter(Countries.continent.like('%Europe%')).order_by(func.random()).first()
        else:
            queried_countries = Countries.query.order_by(func.random()).first()
    else:
        return redirect('/')
    draw_country = queried_countries
    session['draw_country'] = {
        'country_id': draw_country.country_id,
        'country_name': draw_country.country_name,
        'continent': draw_country.continent,
    }
    return render_template('draw.html', country=draw_country.country_name, show_logout = True)

@app.route('/compare', methods=['GET', 'POST'])
@login_required
def result():
    if request.method == "POST" and session.get('draw_country', None):
        url = request.form.get('url')
        draw_country = session.get('draw_country', None)
        country_url = f"countries/{draw_country['country_name'].lower().replace(' ', '_')}.png"
        hash1, hash2, compared = compare.compare(url, country_url)
        # gamemode_id = 1 –––> 'Drawing' gamemode
        # gamemode_id = 2 –––> 'Detecting' gamemode
        score = Scores(user_id=current_user.user_id, gamemode_id=1, score=compared, country_id=draw_country['country_id'])
        db.session.add(score)
        db.session.commit()
        return render_template('compare.html',
                               hash1=hash1,
                               hash2=hash2,
                               compared=compared,
                               country=draw_country['country_name'],
                               path=country_url,
                               region=draw_country['continent'],
                               original=url,
                               show_logout = True)
    else:
        return redirect('/', show_logout = True)

@app.route('/detectdefine', methods=['GET', 'POST'])
@login_required
def detectdefine():
    detecting_gamemode_scores = db.session.query (
        Users.user_name,
        func.max(Scores.score).label('max_score'),
        func.count(Scores.score)
    )   .join(Scores, Users.user_id == Scores.user_id)\
        .filter(Scores.gamemode_id == 2)\
        .group_by(Users.user_name)\
        .order_by(desc('max_score')).all()
    return render_template('detectdefine.html', detecting_gamemode_scores = detecting_gamemode_scores, show_logout = True)

@app.route('/detect', methods=['GET', 'POST'])
@login_required
def detect():
    if request.method != "POST":
        return redirect('/')
    region = request.form.get('type')
    if region != "Detect":
        return redirect('/')
    
    session['in_detect_page'] = True

    if 'streak_count' not in session:
        session['streak_count'] = 0

    number1, number2, number3, number4, mainCountry = chooseCountry()
    return render_template('detect.html',
                           number1=number1.country_name,
                           number2=number2.country_name,
                           number3=number3.country_name,
                           number4=number4.country_name,
                           mainCountry=f"countries/{mainCountry.country_name.lower().replace(' ', '_')}.png",
                           mainName=mainCountry.country_name,
                           streak_count=session['streak_count'], show_logout = True)

@app.route('/update_streak', methods=['POST'])
def update_streak():
    if request.method != "POST":
        return redirect('/')
    
    data = request.get_json()

    if data.get('correct') == 1:
        session['streak_count'] += 1
    else:
        prev_streak_count = session['streak_count']
        session['streak_count'] = 0

    session.modified = True

    if data.get('correct') == 1:
        return {'streak_count': session['streak_count']}
    else:
        return {'streak_count': prev_streak_count}

@app.route('/save_streak', methods=['POST'])
def save_streak():
    if request.method != "POST":
        return redirect('/')
    
    data = request.get_json()

    if data['gamemode'] == 2:
        score = Scores(user_id=current_user.user_id, gamemode_id=2, score=data['streak'])
        db.session.add(score)
        db.session.commit()

    elif data['gamemode'] == 3:
        score = Scores(user_id=current_user.user_id, gamemode_id=3, score=data['streak'])
        db.session.add(score)
        db.session.commit()

    return {'status': 'success'}

@app.before_request
def handle_before_request():
    if 'in_detect_page' in session and session['in_detect_page']:
        if not request.path.startswith('/static/') and request.path not in ['/detect', '/update_streak']:
            session['streak_count'] = 0
            session['in_detect_page'] = False
            session.modified = True
    elif 'in_flag_page' in session and session['in_flag_page']:
        if not request.path.startswith('/static/') and request.path not in ['/flags', '/update_streak']:
            session['streak_count'] = 0
            session['in_flag_page'] = False
            session.modified = True


@app.route('/usermanual', methods=['GET', 'POST'])
def usermanual():
    if request.method == "POST":
        return render_template('manuals/full_help.html')
    else:
        return redirect('/')

@app.route('/help', methods=['GET', 'POST'])
def help():
    if request.method == "POST":
        return render_template('help.html')
    else:
        return redirect('/')

@app.route('/flagdefine', methods=['GET', 'POST'])
@login_required
def flagdefine():
    flag_guessing_gamemode_scores = db.session.query (
        Users.user_name,
        func.max(Scores.score).label('max_score'),
        func.count(Scores.score)
    )   .join(Scores, Users.user_id == Scores.user_id)\
        .filter(Scores.gamemode_id == 3)\
        .group_by(Users.user_name)\
        .order_by(desc('max_score')).all()
    return render_template('flagdefine.html', flag_guessing_gamemode_scores = flag_guessing_gamemode_scores, show_logout = True)

@app.route('/flags', methods=['GET', 'POST'])
@login_required
def guess_flags():
    if request.method != "POST":
        return redirect('/')
    else:
        main_country = db.session.query(FlagNames).filter_by(language='en').order_by(func.random()).first()

        session['in_flag_page'] = True

        if 'streak_count' not in session:
            session['streak_count'] = 0

        return render_template('flags.html',
                               name=main_country.name,
                               flag_img=f'https://raw.githubusercontent.com/cristiroma/countries/9f88008d1917f66b13bdc8e03af8a891b5398665/data/flags/SVG/{main_country.code2l}.svg',
                               streak_count=session['streak_count'],
                               show_logout=True)
    
@app.route('/coordinates', methods=['GET', 'POST'])
def coordinates():
    return render_template('coordinates.html')

@app.route('/check_guess', methods=['POST'])
def check_guess():
    data = request.get_json()

    guess_lat = data['lat']
    guess_lng = data['lng']

    true_lat = data['true_lat']
    true_lng = data['true_lng']

    distance_km = geometry.haversine(guess_lat, guess_lng, true_lat, true_lng)

    return jsonify({
        'distance_km': distance_km,
        'true_lat': true_lat,
        'true_lng': true_lng
    })

@app.route("/get_random_image")
def get_random_image():
    image_data = db.session.query(Coordinates).order_by(func.random()).first()

    return jsonify({
        "image_id": image_data.image_id,
        "image_url": image_data.image_url,
        "latitude": image_data.latitude,
        "longitude": image_data.longitude
    })

@app.route("/save_coordinates_score", methods=['POST'])
def save_coordinates_score():
    data = request.get_json()

    distance_km = data['distance_km']

    if distance_km < 5:
        score = 5000
    else:
        score = max(0, int(5000 - distance_km * 0.9))

    score_to_write = Scores(user_id=current_user.user_id, gamemode_id=4, score=score)
    db.session.add(score_to_write)
    db.session.commit()

    return jsonify({'score': score})

@app.route('/coordinatesdefine', methods=['GET', 'POST'])
@login_required
def coordinatesdefine():
    coordinates_guessing_gamemode_scores = db.session.query (
        Users.user_name,
        func.max(Scores.score).label('max_score'),
        func.count(Scores.score)
    )   .join(Scores, Users.user_id == Scores.user_id)\
        .filter(Scores.gamemode_id == 4)\
        .group_by(Users.user_name)\
        .order_by(desc('max_score')).all()
    return render_template('coordinatesdefine.html', coordinates_guessing_gamemode_scores = coordinates_guessing_gamemode_scores, show_logout = True)

if __name__ == '__main__':
    app.run()
    app.secret_key = 'ThOD4fSYjEDhma9YgIq33NIcgSJhqxDA4hHTPqlDzXY'