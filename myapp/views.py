from asyncio.log import logger
import email
from unicodedata import name
from django.forms import PasswordInput
from django.shortcuts import render
from .models import *
from django.conf import settings
from django.core.mail import send_mail
import random


def index(request):
    if 'email' in request.session:
        del request.session['email']
        return render(request, 'index.html')
    else:
        return render(request, 'index.html')
# Create your views here.


def categories(request):
    return render(request, 'categories.html')


def about(request):
    return render(request, 'about.html')


def product(request):
    return render(request, 'product.html')


def signin(request):
    if request.method == "POST":
        try:
            user = User.objects.get(
                email=request.POST['email'],
                password=request.POST['password'],
            )
            request.session['fname'] = user.fname
            request.session['email'] = user.email
            return render(request, 'index.html')
        except:
            msg = "Email& Password is in Incorrect"
            return render(request, 'signin.html', {'msg': msg})

    else:
        return render(request, 'signin.html')


def signup(request):
    if request.method == "POST":
        try:
            User.objects.get(email=request.POST['email'])
            msg = "Email Already Registered..."
            return render(request, 'signup.html', {'msg': msg})
        except:
            if request.POST['password'] == request.POST['cpassword']:
                User.objects.create(
                    fname=request.POST['fname'],
                    lname=request.POST['lname'],
                    email=request.POST['email'],
                    mobile=request.POST['mobile'],
                    password=request.POST['password'],
                    cpassword=request.POST['cpassword'],
                )
                msg = "User sign up successfully..."
                return render(request, 'signin.html', {'msg': msg})
            else:
                msg = "Password & Confirm Password Does Not Matched"
                return render(request, 'signup.html', {'msg': msg})
    else:
        return render(request, 'signup.html')


def signout(request):
    
    try:
        del request.session['fname']
        del request.session['email']
        return render(request, 'signin.html')
    except:
        return render(request, 'index.html')


def contact(request):
    return render(request, 'contact.html')


def dashboard(request):
    if request.method == 'POST':
        try:
            user = User.objects.all()
            request.session['fname'] = user.fname
            request.session['email'] = user.email
            return render(request, 'dashboard.html', {'fname': user.fname})
        except:

            return render(request, 'dashboard.html')
    else:
        return render(request, 'dashboard.html')


def myads(request):
    return render(request, 'myads.html')


def offers_msgs(request):
    return render(request, 'offers_msgs.html')


def payments(request):
    return render(request, 'payments.html')


def post_ads(request):
    return render(request, 'post_ads.html')


def product_details(request):
    return render(request, 'product_details.html')


def profile_settings(request):
    return render(request, 'profile_settings.html')


def forgot_password(request):
    if request.method=="POST":
        email = request.POST['email']
        try:
            user = User.objects.get(email=email)
            otp=random.randint(1000,9999)
            subject = 'OTP For Forgot Password'
            message = 'Hello User, YOur OTP Is For Forgot Password Is '+str(otp)
            email_from = settings.EMAIL_HOST_USER
            recipient_list = [user.email,]
            send_mail( subject, message, email_from, recipient_list )
            return render(request,'otp.html', {'otp':otp,'email':email})

        except:
            msg = "Email Not Registered..."
            return render(request, 'forgot_password.html', {'msg': msg})

    else:
        return render(request, 'forgot_password.html')

def otp(request):
    otp=request.POST['otp']
    uotp=request.POST['uotp']
    email=request.POST['email']

    if otp==uotp:
        return render(request,'new_password.html',{'email':email})
    else:
        msg="Entered OTP is Invalid..."
        return render(request,'otp.html',{'otp':otp,'email':email,'msg':msg})


def new_password(request):
    email=request.POST['email']
    password=request.POST['password']
    cpassword=request.POST['cpassword']

    if password==cpassword:
        user=User.objects.get(email=email)
        user.password=password
        user.cpassword=cpassword    
        user.save()
        msg="Password Updated successfully..."
        return render(request,'signin.html',{'msg':msg})
    else:
        msg="Password And Confirm Password Does Not Matched..."
        return render(request,'new_password.html',{'msg':msg,'email':email})


