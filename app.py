from Utils.accountUtils import accountState, accountUtils
from flask import Flask, render_template, redirect, url_for, request, session
from datetime import date, datetime
from werkzeug.utils import secure_filename

import sys, os
sys.path.append('Models/') 
from Models import *
sys.path.append('Utils/')
from accountUtils import *
from studentUtils import *
from lecturerUtils import *
from lecturerInChargeUtils import *

app = Flask(__name__)
app.secret_key = "Database 201"
app.config['UPLOAD_FOLDER'] = 'static/desImg/'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/lec/mcq')
def mcq():
    newUtils = lecturerUtils()
    inchrSub = newUtils.viewInchrSubject(session["accountState"]["ID"])
    mgrSub = newUtils.viewMgrSubject(session["accountState"]["ID"])
    return render_template('mcq.html', user = session["accountState"], inchrSub = inchrSub, mgrSub = mgrSub)

@app.route('/lec/mcq?<subCode>?<subName>?<lecType>')
def subject(subCode, subName, lecType):
    subInfo = (subCode, subName, lecType)
    newUtils = lecturerInChargeUtils()
    quesList = newUtils.viewQuestionList(subCode)
    return render_template('mcq_subject.html', user = session["accountState"], subInfo = subInfo , quesList = quesList)

@app.route('/lec/mcq?<subCode>?<subName>?<lecType>?<quesID>')
def question(subCode, subName, lecType, quesID):
    subInfo = (subCode, subName, lecType)
    newUtils = lecturerInChargeUtils()
    isAuthor = newUtils.checkAuthor(quesID, session["accountState"]["ID"])
    quesInfo, lecInfo = newUtils.getQuestionInfo(quesID)
    choiceList = newUtils.getChoiceList(quesID)
    return render_template('question.html', user = session["accountState"], subInfo = subInfo, isAuthor = isAuthor, quesInfo = quesInfo, lecInfo = lecInfo, choiceList = choiceList)

@app.route('/lec/mcq?<subCode>?<subName>?<lecType>?del<quesID>')
def delQuestion(subCode, subName, lecType, quesID):
    newUtils = lecturerInChargeUtils()
    newUtils.deleteQuestion(quesID)
    return redirect(url_for('subject', subCode = subCode, subName = subName, lecType = lecType))

@app.route('/lec/mcq?<subCode>?<subName>?<lecType>?edit4<quesID>', methods=['GET', 'POST'])
def editQuestion4(subCode, subName, lecType, quesID):
    subInfo = (subCode, subName, lecType)
    newUtils = lecturerInChargeUtils()
    outcomeList = newUtils.getOutcomeList(subCode)
    quesInfo, lecInfo = newUtils.getQuestionInfo(quesID)
    choiceList = newUtils.getChoiceList(quesID)
    if request.method == "POST":
        req = request.form
        correctChIDs = ""
        timeCtrb = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        if req.get("correctCh1"): correctChIDs += req.get("correctCh1")
        if req.get("correctCh2"): correctChIDs += req.get("correctCh2")
        if req.get("correctCh3"): correctChIDs += req.get("correctCh3")
        if req.get("correctCh4"): correctChIDs += req.get("correctCh4")        

        qDes = request.files['qDes']
        qDesID = quesInfo[10]
        if qDes.filename != '':
            qDesName = secure_filename(qDes.filename)
            qDes.save(os.path.join(app.config['UPLOAD_FOLDER'], qDesName))
            qDesID = newUtils.setDesID(qDes.filename)

        chDes1 = request.files['chDes1']
        chDesID1 = choiceList[0][4]
        if chDes1.filename != '':
            chDesName1 = secure_filename(chDes1.filename)
            chDes1.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName1))
            chDesID1 = newUtils.setDesID(chDes1.filename)

        chDes2 = request.files['chDes2']
        chDesID2 = choiceList[1][4]
        if chDes2.filename != '':
            chDesName2 = secure_filename(chDes2.filename)
            chDes2.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName2))
            chDesID2 = newUtils.setDesID(chDes2.filename)

        chDes3 = request.files['chDes3']
        chDesID3 = choiceList[2][4]
        if chDes3.filename != '':
            chDesName3 = secure_filename(chDes3.filename)
            chDes3.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName3))
            chDesID3 = newUtils.setDesID(chDes3.filename)

        chDes4 = request.files['chDes4']
        chDesID4 = choiceList[3][4]
        if chDes4.filename != '':
            chDesName4 = secure_filename(chDes4.filename)
            chDes4.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName4))
            chDesID4 = newUtils.setDesID(chDes4.filename)
        
        newUtils.updateQuestion4Choices(quesID, req.get("content"), req.get("level"), correctChIDs, qDesID, session["accountState"]["ID"],\
            timeCtrb, req.get("outcome"), subCode, "A", req.get("choice1"), chDesID1, "B", req.get("choice2"), chDesID2, "C", req.get("choice3"), chDesID3,\
                "D", req.get("choice4"), chDesID4)
        return redirect(url_for('subject', subCode = subCode, subName = subName, lecType = lecType))
    return render_template('ques_eform4.html', user = session["accountState"], subInfo = subInfo, ocList = outcomeList, quesInfo = quesInfo, choiceList = choiceList)

@app.route('/lec/mcq?<subCode>?<subName>?<lecType>?newques4', methods=['GET', 'POST'])
def addQuestion4(subCode, subName, lecType):
    subInfo = (subCode, subName, lecType)
    newUtils = lecturerInChargeUtils()
    outcomeList = newUtils.getOutcomeList(subCode)
    if request.method == "POST":
        req = request.form
        correctChIDs = ""
        timeCtrb = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        if req.get("correctCh1"): correctChIDs += req.get("correctCh1")
        if req.get("correctCh2"): correctChIDs += req.get("correctCh2")
        if req.get("correctCh3"): correctChIDs += req.get("correctCh3")
        if req.get("correctCh4"): correctChIDs += req.get("correctCh4")        

        qDes = request.files['qDes']
        qDesID = None
        if qDes.filename != '':
            qDesName = secure_filename(qDes.filename)
            qDes.save(os.path.join(app.config['UPLOAD_FOLDER'], qDesName))
            qDesID = newUtils.setDesID(qDes.filename)

        chDes1 = request.files['chDes1']
        chDesID1 = None
        if chDes1.filename != '':
            chDesName1 = secure_filename(chDes1.filename)
            chDes1.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName1))
            chDesID1 = newUtils.setDesID(chDes1.filename)

        chDes2 = request.files['chDes2']
        chDesID2 = None
        if chDes2.filename != '':
            chDesName2 = secure_filename(chDes2.filename)
            chDes2.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName2))
            chDesID2 = newUtils.setDesID(chDes2.filename)

        chDes3 = request.files['chDes3']
        chDesID3 = None
        if chDes3.filename != '':
            chDesName3 = secure_filename(chDes3.filename)
            chDes3.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName3))
            chDesID3 = newUtils.setDesID(chDes3.filename)

        chDes4 = request.files['chDes4']
        chDesID4 = None
        if chDes4.filename != '':
            chDesName4 = secure_filename(chDes4.filename)
            chDes4.save(os.path.join(app.config['UPLOAD_FOLDER'], chDesName4))
            chDesID4 = newUtils.setDesID(chDes4.filename)
        
        newUtils.addQuestion4Choices(req.get("content"), req.get("level"), correctChIDs, qDesID, session["accountState"]["ID"],\
            timeCtrb, req.get("outcome"), subCode, "A", req.get("choice1"), chDesID1, "B", req.get("choice2"), chDesID2, "C", req.get("choice3"), chDesID3,\
                "D", req.get("choice4"), chDesID4)
        return redirect(url_for('subject', subCode = subCode, subName = subName, lecType = lecType))
    return render_template('question_form4.html', user = session["accountState"], subInfo = subInfo, ocList = outcomeList)

@app.route('/lec/exam')
def exam():
    newUtils = lecturerUtils()
    inchrSub = newUtils.viewInchrSubject(session["accountState"]["ID"])
    mgrSub = newUtils.viewMgrSubject(session["accountState"]["ID"])
    return render_template('exam.html', user = session["accountState"], inchrSub = inchrSub, mgrSub = mgrSub)

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

    return render_template('index_lec.html', user = session["accountState"])

@app.route('/stud')
def index_stud():
    newUtils = studentUtils()
    examList = newUtils.getExamOfStudent(session["accountState"]["ID"])

    # Get section data
    today = date.today()
    incomingExam = list(filter(lambda x: (not newUtils.checkTakenExam(session["accountState"]["ID"], x[0], x[2], '2001')) and x[2] >= today, examList))
    passedExam = list(filter(lambda x: newUtils.checkTakenExam(session["accountState"]["ID"], x[0], x[2], '2001'), examList))
    expiredExam = list(filter(lambda x: (not newUtils.checkTakenExam(session["accountState"]["ID"], x[0], x[2], '2001')) and x[2] < today, examList))

    # Get note for passed exam
    for index in range(len(passedExam)):
        note = newUtils.getStudentNote(session["accountState"]["ID"], passedExam[index][0], passedExam[index][2], '2001')
        mark = newUtils.viewMarkInExam(session["accountState"]["ID"], passedExam[index][0], passedExam[index][2], '2001')
        passedExam[index] = (passedExam[index][0], passedExam[index][1], passedExam[index][2], note, mark)
    print(passedExam)

    return render_template('index_stud.html', username = session["accountState"]["username"], incomingExam = incomingExam, passedExam = passedExam, expiredExam = expiredExam)


@app.route('/stud/takeExam/<string:SubjectCode>/<string:ExamDate>/',methods=['GET'])
def take_exam(SubjectCode, ExamDate):
    # for display exam with question and answer
    newUtils = studentUtils()
    question = newUtils.viewPerformedExam(SubjectCode, ExamDate, '2001')
    subName = ""
    if question:
        subName = question.QuestionList[0].Subject_Name
    return render_template('take_exam.html', exam = question.getDisplayInfo(), SubjectName = subName, SubCode = SubjectCode, Date = ExamDate, StudentID = session["accountState"]["ID"])


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
    Mark = newUtils.viewMarkInExam(session["accountState"]["ID"], SubjectCode, ExamDate, '2001')

    print(answer)
    return render_template('view_exam.html', answer = answer.getDisplayInfo(), mark = Mark, SubCode = SubjectCode, Date = ExamDate, StudentID = session["accountState"]["ID"])


@app.route('/processNote/<string:SubjectCode>/<string:ExamDate>/', methods=['GET', 'POST'])
def note_on_exam(SubjectCode, ExamDate):
    if request.method == 'POST':
        newUtils = studentUtils()
        if newUtils.noteOnExam(session["accountState"]["ID"],SubjectCode, ExamDate, '2001', 1, request.form.get('note')):
            print("Note on Exam successfully")
    return redirect(url_for('index_stud'))

if __name__ == '__main__':
    app.run(debug=True)

