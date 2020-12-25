from Utils.accountUtils import accountState, accountUtils
from flask import Flask, render_template, redirect, url_for, request, session
from datetime import date

import sys
sys.path.append('Utils/')
from accountUtils import *
from studentUtils import *

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
        checkLecture = checkLogin.checkLecturerLogin(username, password)
        if checkStudent:
            session["accountState"] = checkStudent
            print("Logged in successfully")
            return redirect(url_for('student'))
        if checkLecture:
            session["accountState"] = checkStudent
            print("Logged in successfully")
            # redirect to lecturer page
        else:
            error = 'Invalid credentials'
    return render_template('login.html', error=error)

@app.route('/student')
def student():
    newUtils = studentUtils()
    examList = newUtils.getExamOfStudent(session["accountState"]["ID"])
    print(examList)
    today = date.today()
    incomingExam = list(filter(lambda x: x[2] >= today, examList))
    passedExam = list(filter(lambda x: x[2] <= today, examList))
    print(incomingExam)
    print(passedExam)
    return render_template('student.html', incomingExam = incomingExam, passedExam = passedExam)

if __name__ == '__main__':
    app.run(debug=True)
