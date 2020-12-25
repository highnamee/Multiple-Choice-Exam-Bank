from Utils.accountUtils import accountState, accountUtils
from flask import Flask, render_template, redirect, url_for, request, session

import sys
sys.path.append('Utils/')
from accountUtils import *

app = Flask(__name__)
app.secret_key = "Database 201"

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
    error = None
    if request.method == "POST":
        req = request.form
        username = req.get("username")
        password = req.get("password")
        checkLogin = accountUtils()

        checkStudent = checkLogin.checkStudentLogin(username, password)
        checkLecturer = checkLogin.checkLecturerLogin(username, password)
        if checkStudent:
            session["accountState"] = checkStudent
            print(session)
            print("Logged in successfully")
            return redirect(url_for('index_stud'))
        elif checkLecturer:
            session["accountState"] = checkLecturer
            print(session)
            print("Logged in successfully")
            return redirect(url_for('index_lec'))
        else:
            error = 'Invalid credentials'
    return render_template('login.html', error=error)

@app.route('/lec')
def index_lec():
    return render_template('index_lec.html', session=session)

@app.route('/stud')
def index_stud():
    return render_template('index_stud.html', session=session)

if __name__ == '__main__':
    app.run(debug=True)
