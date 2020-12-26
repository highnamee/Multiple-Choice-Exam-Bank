from Models.Models import Question
from Utils.accountUtils import accountState, accountUtils
from flask import Flask, render_template, redirect, url_for, request, session
from datetime import date

import sys
sys.path.append('Models/')
from Models import *
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
        checkLecturer = checkLogin.checkLecturerLogin(username, password)
        if checkStudent:
            session["accountState"] = checkStudent
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

@app.route('/logout')
def logout():
    session["accountState"] = None
    return redirect(url_for('index'))

@app.route('/lec')
def index_lec():
    return render_template('index_lec.html', session=session)

@app.route('/stud')
def index_stud():
    newUtils = studentUtils()
    examList = newUtils.getExamOfStudent(session["accountState"]["ID"])
    today = date.today()
    incomingExam = list(filter(lambda x: x[2] >= today, examList))
    passedExam = list(filter(lambda x: x[2] <= today, examList))
    return render_template('index_stud.html', username = session["accountState"]["username"], incomingExam = incomingExam, passedExam = passedExam)

@app.route('/stud/takeExam/<string:SubjectCode>/<string:ExamDate>/',methods=['GET'])
def take_exam(SubjectCode, ExamDate):
    # for display exam with question and answer
    newUtils = studentUtils()
    question = newUtils.viewPerformedExam(SubjectCode, ExamDate, '2001')
    subName = ""
    if question:
        subName = question.QuestionList[0].Subject_Name
    return render_template('take_exam.html', exam = question.getDisplayInfo(), SubjectName = subName)

if __name__ == '__main__':
    app.run(debug=True)
