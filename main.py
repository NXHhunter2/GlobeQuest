from datetime import datetime
from flask import Flask, flash, request, render_template, session, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import func, desc
from flask_login import UserMixin, login_user, LoginManager, login_required, logout_user, current_user
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, EmailField
from wtforms.validators import DataRequired, Email, Length
from flask_migrate import Migrate
import compare
import random
import psycopg2

app = Flask(__name__)
app.secret_key = "ThOD4fSYjEDhma9YgIq33NIcgSJhqxDA4hHTPqlDzXY"
app.config['TEMPLATES_AUTO_RELOAD'] = True
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:020Kruzer020@localhost/GlobeQuest'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

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
    username = StringField("Username", validators=[DataRequired(), Length(min = 4, max = 20)], render_kw={"autocomplete": "off"})
    email = EmailField("Email", validators=[DataRequired(), Email()], render_kw={"autocomplete": "off"})
    password = PasswordField("Password", validators=[DataRequired()], render_kw={"autocomplete": "off"})
    submit = SubmitField("Submit")

@app.route('/login', methods = ['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = Users.query.filter_by(user_name = form.username.data).first()
        if user:
            if user.user_password == form.password.data:
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
            user = Users(user_name=form.username.data, user_password=form.password.data, user_email=form.email.data)
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
    user_email = db.Column(db.String, unique = True, nullable = False)

    score = db.relationship('Scores', back_populates='user', cascade="all, delete-orphan")
    login_history = db.relationship('LoginHistory', back_populates='user', cascade='all, delete-orphan')

    def __init__(self, user_name, user_password, user_email):
        self.user_name = user_name
        self.user_password = user_password
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
    drawing_gamemode_scores = db.session.query (
        Users.user_name,
        func.max(Scores.score).label('max_score'),
        func.count(Scores.score)
    )   .join(Scores, Users.user_id == Scores.user_id)\
        .filter(Scores.gamemode_id == 1)\
        .group_by(Users.user_name)\
        .order_by(desc('max_score')).all()
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
    score = Scores(user_id=current_user.user_id, gamemode_id=2, score=data['streak'])
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

if __name__ == '__main__':
    app.run()
    app.secret_key = 'ThOD4fSYjEDhma9YgIq33NIcgSJhqxDA4hHTPqlDzXY'