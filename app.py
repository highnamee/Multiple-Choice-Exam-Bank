from Utils.accountUtils import accountUtils
from flask import Flask, render_template, redirect, url_for, request

import sys
sys.path.append('Utils/')
from accountUtils import *

app = Flask(__name__)


@app.route('/')
def index():
    return redirect(url_for('login'))

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
    app.run()
