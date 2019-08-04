from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


# Creating first Index page of the website
def index(request):
    return render(request,"QuizMania/index.html")
    #return HttpResponse("Hello")

def test(request,test_id):
    if test_id == 1:
        return render(request,'QuizMania/Docker.html')
    elif test_id == 2:
        return render(request,'QuizMania/Question-page1.html')
