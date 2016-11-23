from django.http import HttpResponse
from django.shortcuts import render_to_response, render

a = 0
b = 0
c = 0

def hello(request):
    return HttpResponse("Hello World!!")

def helloworldTest(request):
    returnMsg = request.GET.get('parameterSize', '-1')
    return HttpResponse(returnMsg)

def globalVarTest(request):
    result = "test"
    return HttpResponse(result)

def Add(request):
    paraSize = int(request.GET.get('parameterSize', '-1'))
    global a
    global b
    global c
    a = int(request.GET.get('parameter0', '0'))
    b = int(request.GET.get('parameter1', '0'))
    if paraSize != 2:
        return HttpResponse("fail")
    c = a + b
    return HttpResponse("a: " + str(a) + " b: " + str(b))

def Sum(request):
    paraSize = int(request.GET.get('parameterSize', '-1'))
    if paraSize != 0:
        return HttpResponse("fail")
    global c
    return HttpResponse(str(c))

def staticTester(request):
    global staticTest
    return HttpResponse(staticTest)

def RenderShortcut(request):
    return render(request, 'baseball/index.html', {})

