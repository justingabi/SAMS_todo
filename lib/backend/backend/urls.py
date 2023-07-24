"""
URL configuration for backend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from api.views import PersonalNotesView, ObtainTokenView, LogInView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('token/', ObtainTokenView.get_token, name='get_token'),
    path('login/', LogInView.login, name='login'),
    path('notes/get/<str:accountID>', PersonalNotesView.fetch_personal_notes, name='fetch_personal_notes'),
    path('notes/create/', PersonalNotesView.create_personal_note, name='create_personal_note'),
    path('notes/update/<int:noteNum>', PersonalNotesView.update_personal_note, name='update_personal_note'),
    path('notes/delete/<int:noteNum>', PersonalNotesView.delete_personal_note, name='delete_personal_note'),
]
