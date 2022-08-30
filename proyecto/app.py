from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, sessions, url_for, session, send_file
from jinja2 import Environment
app = Flask(__name__)

db1 = SQL("sqlite:///Veterinaria.db")

@app.route('/')
def Index():
    return render_template('index.html')
# asociate (LOGIN)
@app.route('/asociate')
def asociate():
    return render_template('asociate.html')
    # usuario nuevo
@app.route('/nuevou')
def nuevou():
    return render_template('nuevous.html')
#CONTACTOS
@app.route('/contactos')
def contactos():
    return render_template('contacto.html')
#NOSOTROS
@app.route('/nosotros')
def nosotros():
    return render_template('nosotros.html')

if __name__ == '__main__':
    app.run(port=5000, debug=True)
