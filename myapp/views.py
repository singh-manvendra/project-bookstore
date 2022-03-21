from asyncio.log import logger
import email
from unicodedata import name
from django.forms import PasswordInput
from django.shortcuts import render
from .models import *


def index(request):
    return render(request,'index.html')
# Create your views here.
