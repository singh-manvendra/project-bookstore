from distutils.command.upload import upload
from email import message
import email
from email.mime import image
from tkinter import CASCADE
from unicodedata import category
from django.db import models


# Create your models here.
class User(models.Model):
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    mobile=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    cpassword=models.CharField(max_length=100)

    def __str__(self):
        return self.fname+" - "+self.email

