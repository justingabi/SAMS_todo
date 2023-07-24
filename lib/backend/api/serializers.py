
from api.models import Account, Personal_Note, Data_Log
from django.contrib.auth import get_user_model
from rest_framework import serializers

class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'


class PersonalNoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Personal_Note
        fields = ['noteNum', 'title', 'content', 'account']



class DataLogSerializer(serializers.ModelSerializer):
    class Meta:
        model = Data_Log
        fields = ['logNum', 'event', 'date', 'account']