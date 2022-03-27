from django.urls import path
from . import views

urlpatterns = [
    path('',views.index,name='index'),
    path('categories/',views.categories,name='categories'),
    path('contact/',views.contact,name='contact'),
    
    path('about/',views.about,name='about'),
    path('signup/',views.signup,name='signup'),
    path('signin/',views.signin,name='signin'),
    path('index/',views.signout,name='signout'),
    path('myads/',views.myads,name='myads'),
    path('offers_msgs/',views.offers_msgs,name='offers_msgs'),
    path('payments/',views.payments,name='payments'),
    path('post_ads/',views.post_ads,name='post_ads'),
    path('postads/',views.postads,name='postads'),
    
    path('product_details/',views.product_details,name='product_details'),
    path('product/',views.product,name='product'),
    path('profile_settings/',views.profile_settings,name='profile_settings'),
    path('forgot_password/',views.forgot_password,name='forgot_password'),
    path('otp/',views.otp,name='otp'),
    
    path('new_password/',views.new_password,name='new_password'),
    
]