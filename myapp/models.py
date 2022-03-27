from asyncio.windows_events import NULL
from distutils.command.upload import upload
from email import message
import email
from email.mime import image
from tkinter import CASCADE
from unicodedata import category
from django.db import models


# Create your models here.
class User(models.Model):
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    mobile = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    cpassword = models.CharField(max_length=100)
    user_img = models.ImageField(upload_to='images/', default="images/author-1.jpg", null=True, blank=True)

    def __str__(self):
        return self.fname+" - "+self.email





class Contact(models.Model):
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    subject = models.CharField(max_length=100)
    remarks = models.TextField()

    def __str__(self):
        return self.name
    
class Category(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name

class Book(models.Model):
    book_sellr = models.ForeignKey(User,on_delete=models.CASCADE)
    book_name = models.CharField(max_length=100)
    category = models.ForeignKey(Category,on_delete=models.CASCADE)
    
    book_price = models.IntegerField()
    book_description = models.TextField()
    book_image = models.ImageField(upload_to='images/', default="images/author-1.jpg", null=True, blank=True)
    address = models.TextField(default="ahemdabad")
    country = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    city = models.CharField(max_length=100)

    def __str__(self):
        return self.book_name
    
    