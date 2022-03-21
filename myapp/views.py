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
    return render(request,'signin.html')

def signup(request):
    return render(request,'signup.html')

def contact(request):
    return render(request,'contact.html')

def dashboard(request):
    return render(request,'dashboard.html')

def error(request):
    return render(request,'error.html')


def blog_details(request):
    return render(request,'blog_details.html')

def blog(request):
    return render(request,'blog.html')

def faq(request):
    return render(request,'faq.html')

def myads(request):
    return render(request,'myads.html')

def offers_msgs(request):
    return render(request,'offers_msgs.html')

def payments(request):
    return render(request,'payments.html')

def post_ads(request):
    return render(request,'post_ads.html')

def pricing(request):
    return render(request,'pricing.html')

def wishlist(request):
    return render(request,'wishlist.html')

def privacy_settings(request):
    return render(request,'privacy_settings.html')

def product_details(request):
    return render(request,'product_details.html')

def profile_settings(request):
    return render(request,'profile_settings.html')