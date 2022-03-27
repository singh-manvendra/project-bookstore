from asyncio.log import logger
import email
from unicodedata import name
from django.forms import PasswordInput
from django.shortcuts import render, redirect
from .models import *
from django.conf import settings
from django.core.mail import send_mail
import random


def index(request):
    try:
        books = Book.objects.all()
        print('this is working ')
        return render(request, 'index.html', {'books': books})
    except Exception as e:
        print(e)
        print('this is not working')
        return render(request, 'index.html')

# Create your views here.


def categories(request):
    try:
        categories = Category.objects.all()
        return render(request, 'categories.html', {'categories': categories})
    except:
        return render(request, 'categories.html')


def cats(request, name):
    try:
        if (Category.objects.filter(name=name)):
            catbook = Book.objects.filter(category__name=name)

            return render(request, 'product.html', {'catbook': catbook})
        else:
            return render(request, 'product.html')
    except:
        return render(request, 'categories.html')


def about(request):
    return render(request, 'about.html')


def product(request):

    try:
        cats = Category.objects.all()
        books = None
        category = request.GET.get('category')
        if category:
            books = Book.objects.filter(category_id=category)
        else:
            books = Book.objects.all()
        print('this is working ')
        return render(request, 'product.html', {'books': books, 'cats': cats})
    except Exception as e:
        print(e)
        print('this is not working')
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
            request.session['user_img'] = user.user_img.url
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
        del request.session['user_img']
        return render(request, 'signin.html')
    except:
        return render(request, 'index.html')


def contact(request):
    return render(request, 'contact.html')


# def dashboard(request):
#     if request.method == 'POST':
#         try:

#             return render(request, 'dashboard.html')
#         except:

#             return render(request, 'dashboard.html')
#     else:
#         return render(request, 'dashboard.html')


def myads(request):
    try:
        user = User.objects.get(email=request.session['email'])
        books = Book.objects.filter(book_sellr=user)
        print('this is working ')
        return render(request, 'myads.html', {'books': books})
    except Exception as e:
        print(e)
        print('this is not working')
        return render(request, 'myads.html')


def offers_msgs(request):
    return render(request, 'offers_msgs.html')


def payments(request):
    return render(request, 'payments.html')


def postads(request):
    try:
        cats = Category.objects.all()
        return render(request, 'post_ads.html', {'cats': cats})
    except Exception as e:
        print(e)
        return render(request, 'post_ads.html')


def post_ads(request):
    try:
        cats = Category.objects.all()
        if request.method == "POST":

            try:
                user = User.objects.get(email=request.session['email'])
                category = Category.objects.get(name=request.POST['category'])
                Book.objects.create(
                    book_sellr=user,
                    category=category,
                    book_name=request.POST['book_name'], 
                    book_price=request.POST['book_price'],
                    book_description=request.POST['book_description'],
                    book_image=request.FILES['book_image'],
                    address=request.POST['address'],
                    country=request.POST['country'],
                    state=request.POST['state'],
                    city=request.POST['city']
                )
                msg = "BOOK ADDED SUCCESSFULLY"
                return render(request, 'post_ads.html', {'msg': msg, 'cats': cats})
            except Exception as e:
                print(e)
                msg = "Did Nothing"
                return render(request, 'post_ads.html', {'msg': msg, 'cats': cats})
        else:
            return render(request, 'post_ads.html', {'cats': cats})

    except:
        return render(request, 'post_ads.html', {'cats': cats})


def product_details(request):
    try:
        
        books = None
        product = request.GET.get('product')
        user = User.objects.all()
        if product:
            
            books = Book.objects.filter(id=product)
        else:
            books = Book.objects.all()
        print('this is working ')
        return render(request, 'product_details.html', {'books': books,'user':user})
    except Exception as e:
        print(e)
        print('this is not working')
        return render(request, 'product_details.html')

def profile_settings(request):
    if request.method == "POST":
        try:
            user = User.objects.get(email=request.session['email'])
            if user.password == request.POST['old_password']:
                if request.POST['password'] and request.POST['cpassword'] != "":
                    print('pass works!')
                    if request.POST['mobile'] != "":
                        print('pass and mo works!')
                        if request.FILES.get('user_img', False):
                            print('all works!')
                            user.password = request.POST['password']
                            user.cpassword = request.POST['cpassword']
                            user.mobile = request.POST['mobile']
                            user.user_img = request.FILES['user_img']
                            user.save()
                            msg = "Profile updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                        else:

                            user.password = request.POST['password']
                            user.cpassword = request.POST['cpassword']
                            user.mobile = request.POST['mobile']
                            user.save()
                            msg = "Password and mobile updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                    else:

                        if request.FILES.get('user_img', False):

                            user.password = request.POST['password']
                            user.cpassword = request.POST['cpassword']
                            user.user_img = request.FILES['user_img']
                            user.save()
                            msg = "Password and Profile Photo updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                        else:

                            user.password = request.POST['password']
                            user.cpassword = request.POST['cpassword']
                            user.save()
                            msg = "Password updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                else:
                    if request.POST['mobile'] != "":

                        if request.FILES.get('user_img', False):

                            user.mobile = request.POST['mobile']
                            user.user_img = request.FILES['user_img']
                            user.save()
                            msg = "Mobile and image updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                        else:
                            user.mobile = request.POST['mobile']
                            user.save()
                            msg = "Mobile updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                    else:
                        if request.FILES.get('user_img', False):
                            user.user_img = request.FILES['user_img']
                            user.save()
                            msg = "Profile Photo updated successfully!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})
                        else:
                            msg = "No new Data found!"
                            request.session['fname'] = user.fname
                            request.session['email'] = user.email
                            request.session['user_img'] = user.user_img.url
                            return render(request, 'profile_settings.html', {'msg': msg})

            else:
                msg = "Old Password Doesn't Match!"
                return render(request, 'profile_settings.html', {'msg': msg})
        except:
            request.session['fname'] = user.fname
            request.session['email'] = user.email
            request.session['user_img'] = user.user_img.url
            return render(request, 'profile_settings.html')
    else:
        return render(request, 'profile_settings.html')


def forgot_password(request):
    if request.method == "POST":
        email = request.POST['email']
        try:
            user = User.objects.get(email=email)
            otp = random.randint(1000, 9999)
            subject = 'OTP For Forgot Password'
            message = "Hello User, Your OTP for Forgot Password Is "+str(otp)
            email_from = settings.EMAIL_HOST_USER
            recipient_list = [user.email, ]
            send_mail(subject, message, email_from, recipient_list)
            return render(request, 'otp.html', {'otp': otp, 'email': email})

        except:
            msg = "Email Not Registered..."
            return render(request, 'forgot_password.html', {'msg': msg})

    else:
        return render(request, 'forgot_password.html')


def otp(request):
    otp = request.POST['otp']
    uotp = request.POST['uotp']
    email = request.POST['email']

    if otp == uotp:
        return render(request, 'new_password.html', {'email': email})
    else:
        msg = "Entered OTP is Invalid..."
        return render(request, 'otp.html', {'otp': otp, 'email': email, 'msg': msg})


def new_password(request):

    try:
        user = User.objects.get(email=request.POST['email'])

        password = request.POST['password']
        cpassword = request.POST['cpassword']

        if password == cpassword:

            user.password = password
            user.cpassword = cpassword
            user.save()
            msg = "Password Updated successfully..."
            return render(request, 'signin.html', {'msg': msg})
        else:
            msg = "Password And Confirm Password Does Not Matched..."
            return render(request, 'new_password.html', {'msg': msg, 'email': email})
    except:
        msg = "Invalid!"
        return render(request, 'new_password.html', {'msg': msg})
