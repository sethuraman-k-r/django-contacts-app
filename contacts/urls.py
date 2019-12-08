from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('add/', views.add_new_contact, name='add_contact'),
    path('logout/', views.logout, name='logout')
]