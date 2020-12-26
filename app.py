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
    incomingExam = list(filter(lambda x: not newUtils.checkTakenExam(session["accountState"]["ID"], x[0], x[2], '2001'), examList))
    passedExam = list(filter(lambda x: newUtils.checkTakenExam(session["accountState"]["ID"], x[0], x[2], '2001'), examList))
    return render_template('index_stud.html', username = session["accountState"]["username"], incomingExam = incomingExam, passedExam = passedExam)

@app.route('/stud/takeExam/<string:SubjectCode>/<string:ExamDate>/',methods=['GET'])
def take_exam(SubjectCode, ExamDate):
    # for display exam with question and answer
    newUtils = studentUtils()
    question = newUtils.viewPerformedExam(SubjectCode, ExamDate, '2001')
    subName = ""
    if question:
        subName = question.QuestionList[0].Subject_Name
    return render_template('take_exam.html', exam = question.getDisplayInfo(), SubjectName = subName, SubCode = SubjectCode, Date = ExamDate)

@app.route('/submitting/<string:SubjectCode>/<string:ExamDate>/' ,methods=['POST'])
def submit_exam(SubjectCode, ExamDate):
    if request.method == "POST":
        req = request.form
        newUtils = studentUtils()
        numOfQuestion = newUtils.viewPerformedExam(SubjectCode, ExamDate, '2001').getNumQuestion()

        newUtils.addStudentTask(session["accountState"]["ID"], SubjectCode, ExamDate, '2001', 1)
        for index in range(1,numOfQuestion+1):
            choose = [req.get(str(index)+'A'), req.get(str(index)+'B'), req.get(str(index)+'C'), req.get(str(index)+'D'), req.get(str(index)+'E')]
            chooseStr = ''
            for item in choose:
                chooseStr = chooseStr + (item if item else '')
            newUtils.addOneAnswer(session["accountState"]["ID"], SubjectCode, ExamDate, '2001', 1, index, chooseStr)
            
    return redirect(url_for('index_stud'))

@app.route('/stud/viewExam/<string:SubjectCode>/<string:ExamDate>/',methods=['GET'])
def view_exam(SubjectCode, ExamDate):
    newUtils = studentUtils()
    answer = newUtils.viewStudentAnswer(session["accountState"]["ID"], SubjectCode, ExamDate, '2001')
    Mark = newUtils.viewMarkInExam(session["accountState"]["ID"], SubjectCode, ExamDate, '2001').Mark
    return render_template('view_exam.html', answer = answer.getDisplayInfo(), mark = Mark)

if __name__ == '__main__':
    app.run(debug=True)
