from django.db import models
from django.contrib.auth.models import User

import os

# Create your models here.
class User(models.Model):
    prefix = models.CharField(max_length=10, null=True)
    suffix = models.CharField(max_length=30, null=True)
    first_name = models.CharField(max_length=30, null=False, blank=True)
    last_name = models.CharField(max_length=30, null=True)
    sur_name = models.CharField(max_length=30, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.first_name + ' ' + self.last_name

class Company(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    company_name = models.CharField(max_length=40, null=False)
    designation = models.CharField(max_length=30, null=True)

class MobileInfo(models.Model):
    phone_choices = (
        ('M', 'Mobile'),
        ('W', 'Work'),
        ('H', 'Home'),
        ('O', 'Office')
    )

    common_choices = (
        ('W', 'Work'),
        ('H', 'Home')
    )

    phone = models.CharField(max_length=10, choices=phone_choices)
    email = models.CharField(max_length=10, choices=common_choices)
    address = models.CharField(max_length=10, choices=common_choices)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

class DateInfo(models.Model):
    date_choices = (
        ('Birthday', 'Birthday'),
        ('Anniversary', 'Anniversary')
    )

    date = models.DateField()
    occasion = models.CharField(max_length=15, choices=date_choices)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

class Relationship(models.Model):
    relations = (
        ('Assistant', 'Assistant'),
        ('Brother', 'Brother'),
        ('Son', 'Son'),
        ('Daughter', 'Daughter'),
        ('Father', 'Father'),
        ('Mother', 'Mother'),
        ('Friend', 'Friend'),
        ('Manager', 'Manager'),
        ('Partner', 'Partner'),
        ('Sister', 'Sister'),
        ('Spouse', 'Spouse'),
        ('Relative', 'Relative')
    )

    relation = models.CharField(max_length=15, choices=relations)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)

class Description(models.Model):
    description = models.TextField(max_length=100, null=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    picture = models.FilePathField(os.getcwd())
