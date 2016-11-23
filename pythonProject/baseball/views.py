from django.shortcuts import render
import datetime
import subprocess
import pymysql

# Create your views here.

def MainHomePage(request):
    return render(request, 'baseball/index.html', {})

def CalculateRequest(request):
    requestQuery = request.GET.get('match', 'n/a')
    resultDetail = "detail"
    processResultTest = ""
    #print requestQuery
    #return HttpResponse(requestQuery)
    #queryTest = ParseEachOptions(requestQuery)

    processOrderDate = str(datetime.datetime.now()).split(".")
    print processOrderDate[0]

    ExecuteRscriptWithParameter(requestQuery, processOrderDate[0])

    processResultTest = GetResultFromMysql(processOrderDate[0])

    print processResultTest[0][15]
    print len(processResultTest[0])



    modelResultArray = processResultTest[0][3:]
    print modelResultArray
    dataLength = int(len(modelResultArray) / 2)
    print dataLength
    modelResultTemplet = [[0 for col in range(2)] for row in range(dataLength)]
    for index in range(dataLength) :
        modelResultTemplet[index][0] = modelResultArray[index]
        modelResultTemplet[index][1] = modelResultArray[index + dataLength]
    modelResultTemplet.sort()
    print modelResultTemplet

    for test in modelResultTemplet:
        print test
#'modelResultData': "test"
    return render(request, 'baseball/indexResult.html', {'targetYear' : requestQuery,
                                                         'processOrder' : str(processResultTest[0][1]) + " " + str(processResultTest[0][0]),
                                                         'modelResultData': modelResultTemplet},)

def GetResultFromMysql(processOrderDate):
    dbConnection = pymysql.connect(host='lamb.kangnam.ac.kr', user='stories2', password='toortoor%^%', db='stories2', charset='utf8')
    dbCursor = dbConnection.cursor()
    sqlQuery = "select * from baseballModelLog where orderUniqueKey = '" + processOrderDate + "';"
    dbCursor.execute(sqlQuery)
    dbResultRows = dbCursor.fetchall()
    print dbResultRows
    dbConnection.close()
    return dbResultRows

def ExecuteRscriptWithParameter(parameters, processOrderDate):
    returnCode = subprocess.call(["C:\\Program Files\\R\\R-3.3.2\\bin\\Rscript.exe",
                                  "C:\\Users\\stories2\\Desktop\\pythonProject\\pythonProject\\baseball\\dbUpdateTest.R", "ok", processOrderDate, parameters])
    print returnCode
    #try:
    #    subprocess.check_output("C:\\Program Files\\R\\R-3.3.2\\bin\\Rscript pythonProject\\dbUpdateTest.R ok " + processOrderDate + " HelloWorld", shell=True, stderr=subprocess.STDOUT)
    #except subprocess.CalledProcessError as e:
    #    raise RuntimeError("command '{}' return with error (code {}): {}".format(e.cmd, e.returncode, e.output))
    #returnCode = check_output("Rscript pythonProject\\dbUpdateTest.R ok " + processOrderDate + " HelloWorld", shell=True)
    # Popen(["Rscript", "dbUpdateTest.R", "ok", processOrderDate, "HelloWorld"], cwd="C:\\Users\\stories2\\Desktop\\pythonProject\\pythonProject\\baseball\\", stdout=PIPE, stderr=PIPE)
    #print returnCode
    #print err
    # call(["Rscript", "baseball/dbUpdateTest.R", "ok", processOrderDate, "HelloWorld"], shell=True)
    #print returnCode

def ParseEachOptions(strOrder):
    targetStrSplitBySpace = strOrder.split(" ")
    queryDictionary = {}
    queryDictionary["Team1"] = targetStrSplitBySpace[0]
    queryDictionary["Team2"] = targetStrSplitBySpace[2]
    for indexNumber in range(3, len(targetStrSplitBySpace)):
        optionChecker = targetStrSplitBySpace[indexNumber].split("--")
        options = optionChecker[1].split("=")
        queryDictionary[options[0]] = options[1]
    return queryDictionary