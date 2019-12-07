from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate
from django.template import loader

from urllib import parse

from .session import isValidSession, delete_session

# Create your views here.
def index(request):
    context = {
        'error' : None
    }
    session_valid = isValidSession(request)
    if session_valid:
        template = loader.get_template('contacts/contacts.html')
        return HttpResponse(template.render(context, request))
    else:
        if request.method == 'POST':
            form_query = request.body.decode('utf-8')
            form_dict = parse.parse_qs(form_query)
            form_keys = form_dict.keys()
            if "username" not in form_keys or "password" not in form_keys:
                context['message'] = 'Enter username and password'
                context['error'] = True
            else:
                username = form_dict['username'][0]
                password = form_dict['password'][0]
                user = authenticate(username=username, password=password)
                if user is not None:
                    request.session['username'] = username
                    context['username'] = username
                    return HttpResponseRedirect("/contacts")
                else:
                    context['message'] = 'Please check username and password'
                    context['error'] = True
        template = loader.get_template('contacts/login.html')
        return HttpResponse(template.render(context, request))

def logout(request):
    delete_session(request)
    return HttpResponseRedirect("/contacts")