from Utils.accountUtils import accountUtils
from flask import Flask, render_template, redirect, url_for, request

import sys
sys.path.append('Utils/')
from accountUtils import *

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/mcq')
def mcq():
    return render_template('mcq.html')

@app.route('/exam')
def exam():
    return render_template('exam.html')

@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == "POST":
        req = request.form
        username = req.get("username")
        password = req.get("password")
        error = None
        checkLogin = accountUtils()

        if checkLogin.checkStudentLogin(username, password):
            print("Logged in successfully")
            # redirect to student page
        elif checkLogin.checkLecturerLogin(username, password):
            print("Logged in successfully")
            # redirect to lecturer page
        else:
            error = 'Invalid credentials'
    return render_template('login.html', error=error)

if __name__ == '__main__':
    app.run(debug=True)
