from flask import Flask, request, render_template, session, redirect
from flask_sqlalchemy import SQLAlchemy
import compare
import random

app = Flask(__name__)

def chooseCountry(country):
    number1, number2, number3, number4 = 0, 0, 0, 0
    while True:
        number1 = random.randint(0, len(country)-1)
        number2 = random.randint(0, len(country)-1)
        number3 = random.randint(0, len(country)-1)
        number4 = random.randint(0, len(country)-1)
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


country = [["Russia", "countries/russia.jpg", "Europe / Asia"],
           ["Germany", "countries/germany.png", "Europe"],
           ["Canada", "countries/canada.png", "North America"],
           ["Poland", "countries/poland.png", "Europe"],
           ["United States", "countries/usa.png", "North America"],
           ["Turkey", "countries/turkey.png", "Europe / Asia"],
           ["Ukraine", "countries/ukraine.png", "Europe"],
           ["Brazil", "countries/brazil.png", "South America"],
           ["Mexico", "countries/mexico.png", "North America"],
           ["Austria", "countries/austria.png", "Europe"],
           ["China", "countries/china.png", "Asia"],
           ["Australia", "countries/australia.png", "Oceania"],
           ["Finland", "countries/finland.png", "Europe"],
           ["France", "countries/france.png", "Europe"],
           ["India", "countries/india.png", "Asia"],
           ["Italy", "countries/italy.png", "Europe"],
           ["Japan", "countries/japan.png", "Asia"],
           ["Norway", "countries/norway.png", "Europe"],
           ["South Africa", "countries/south africa.png", "Africa"],
           ["Spain", "countries/spain.png", "Europe"],
           ["United Kingdom", "countries/uk.png", "Europe"]]


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/draw', methods=['GET', 'POST'])
def draw():
    if request.method == "POST":
        region = request.form.get('region')
        if region == "Europe":
            while True:
                number = random.randint(0, len(country)-1)
                if "Europe" in country[number][2]:
                    break
        else:
            number = random.randint(0, len(country)-1)
    else: 
        return redirect('/')
    draw_country = country[number]
    session['draw_country'] = draw_country
    return render_template('draw.html', country=draw_country[0])

@app.route('/drawdefine', methods=['GET', 'POST'])
def drawdefine():
    if request.method != "POST":
        return redirect('/')
    region = request.form.get('type')
    if region != "Drawdefine":
        return redirect('/')
    return render_template('drawdefine.html')

@app.route('/detect', methods=['GET', 'POST'])
def detect():
    if request.method != "POST":
        return redirect('/')
    region = request.form.get('type')
    if region != "Detect":
        return redirect('/')
    
    number1, number2, number3, number4, mainCountry = chooseCountry(country)
    return render_template('detect.html',
                           number1=country[number1][0], 
                           number2=country[number2][0], 
                           number3=country[number3][0], 
                           number4=country[number4][0], 
                           mainCountry=country[mainCountry][1],
                           mainName=country[mainCountry][0])

@app.route('/compare', methods=['GET', 'POST'])
def result():
    if request.method == "POST" and session.get('draw_country', None):
        url = request.form.get('url')
        draw_country = session.get('draw_country', None)
        hash1, hash2, compared = compare.compare(url, draw_country[1])
        return render_template('compare.html',
                               hash1=hash1,
                               hash2=hash2,
                               compared=compared,
                               country=draw_country[0],
                               path=draw_country[1],
                               region=draw_country[2],
                               original=url)
    else:
        return redirect('/')


if __name__ == '__main__':
    app.secret_key = 'ThOD4fSYjEDhma9YgIq33NIcgSJhqxDA4hHTPqlDzXY'
    app.run()
