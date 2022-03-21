from django.urls import path
from . import views

urlpatterns = [
    path('',views.index,name='index'),
    path('categories/',views.categories,name='categories'),
    path('error/',views.error,name='error'),
    path('blog_details/',views.blog_details,name='blog_details'),
    path('blog/',views.blog,name='blog'),
    path('contact/',views.contact,name='contact'),
    path('dashboard/',views.dashboard,name='dashboard'),
    path('about/',views.about,name='about'),
    path('faq/',views.faq,name='faq'),
    path('signup/',views.signup,name='signup'),
    path('signin/',views.signin,name='signin'),
    path('myads/',views.myads,name='myads'),
    path('offers_msgs/',views.offers_msgs,name='offers_msgs'),
    path('payments/',views.payments,name='payments'),
    path('post_ads/',views.post_ads,name='post_ads'),
    path('pricing/',views.pricing,name='pricing'),
    path('categories/',views.categories,name='categories'),
    path('privacy_settings/',views.privacy_settings,name='privacy_settings'),
    path('wishlist/',views.wishlist,name='wishlist'),
    path('product_details/',views.product_details,name='product_details'),
    path('listing/',views.listing,name='listing'),
    path('profile_settings/',views.profile_settings,name='profile_settings'),
]