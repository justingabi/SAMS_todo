from django.db import models
from django.contrib.auth.models import  AbstractBaseUser, BaseUserManager, PermissionsMixin 
from rest_framework_simplejwt.tokens import RefreshToken

class Account(models.Model):
    userId = models.CharField(primary_key=True, max_length=100)
    email = models.EmailField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    firstname = models.CharField(max_length=100)
    lastname = models.CharField(max_length=100)

    def __str__(self):
        return self.userId

class Personal_Note(models.Model):
    noteNum = models.AutoField(primary_key = True)
    title = models.CharField(max_length = 20)
    content = models.CharField(max_length = 3000)
    account = models.ForeignKey(Account, on_delete = models.CASCADE)

class Data_Log(models.Model):
    #Log Attributes
    logNum = models.AutoField(primary_key = True) #Auto incrementing field
    event = models.CharField(max_length = 500)
    date = models.DateTimeField()
    account = models.ForeignKey(Account, on_delete=models.CASCADE)