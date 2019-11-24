from django.http import HttpResponse
from django.shortcuts import render
from django.template import loader

# Create your views here.
def index(request):
    print(request.session.keys())
    template = loader.get_template('contacts/login.html')
    return HttpResponse(template.render({},request))