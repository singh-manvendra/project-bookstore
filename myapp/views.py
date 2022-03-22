from asyncio.log import logger
import email
from unicodedata import name
from django.forms import PasswordInput
from django.shortcuts import render
from .models import *


def index(request):
    return render(request,'index.html')
# Create your views here.
def categories(request):
    return render(request,'categories.html')

def about(request):
    return render(request,'about.html')

def product(request):
    return render(request,'product.html')

def signin(request):
    if request.method=="POST":
        try:
            user=User.objects.get(
                email=request.POST['email'],
                password=request.POST['password'],
            )
            request.session['fnamw']=user.fname
            request.session['email']=user.email
            return render(request,'index.html')
        except:
            msg="Email& Password is in Incorrect"
            return render(request,'signin.html',{'msg':msg})


    else:
        return render(request,'signin.html')

def signup(request):
    if request.method=="POST":
        try:
            User.objects.get(email=request.POST['email'])
            msg="Email Already Registered..."
            return render(request,'signup.html',{'msg':msg})
        except:
            if request.POST['password']==request.POST['cpassword']:
                User.objects.create(
                    fname=request.POST['fname'],
                    lname=request.POST['lname'],
                    email=request.POST['email'],
                    mobile=request.POST['mobile'],
                    password=request.POST['password'],
                    cpassword=request.POST['cpassword'],
                )
                msg="User sign up successfully..."
                return render(request,'signin.html',{'msg':msg})
            else:
                msg="Password & Confirm Password Does Not Matched"       
                return render(request,'signup.html',{'msg':msg})
    else:
        return render(request,'signup.html')

def signout(request):
    try:
        del request.session['fname']
        del request.session['email']
        return render(request,'signin.html')
    except:
        return render(request,'signin.html')

def contact(request):
    return render(request,'contact.html')

def dashboard(request):
    return render(request,'dashboard.html')


def myads(request):
    return render(request,'myads.html')

def offers_msgs(request):
    return render(request,'offers_msgs.html')

def payments(request):
    return render(request,'payments.html')

def post_ads(request):
    return render(request,'post_ads.html')

def product_details(request):
    return render(request,'product_details.html')

def profile_settings(request):
    return render(request,'profile_settings.html')