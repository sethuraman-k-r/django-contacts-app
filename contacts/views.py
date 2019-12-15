from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.views.decorators.http import require_http_methods
# from django.utils.safestring import mark_safe
from django.template import loader

from urllib import parse

from .session import isValidSession, delete_session
from .service import get_user_contacts, save_details, delete_user_contact
from .models import MobileInfo, DateInfo, Relationship, User as ContactUser
from .forms.Contact import Details

# Create your views here.
def index(request):
    context = {
        'error': None,
        'session': False
    }
    session_valid = isValidSession(request)
    if session_valid:
        context['session'] = True
        context['username'] = request.session['username']
        user = User.objects.get(username=context['username'])
        context['contacts'] = get_user_contacts(user)
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
                    request.session.set_expiry(1800)
                    return HttpResponseRedirect("/contacts")
                else:
                    context['message'] = 'Please check username and password'
                    context['error'] = True
        template = loader.get_template('contacts/login.html')
        return HttpResponse(template.render(context, request))


@require_http_methods(["GET", "POST"])
def add_new_contact(request):
    context = {
        'error': None,
        'session': False
    }
    session_valid = isValidSession(request)
    if session_valid:
        context['session'] = True
        context['username'] = request.session['username']
        context['phone'] = MobileInfo.phone_choices
        context['anniversary'] = DateInfo.date_choices
        context['relationship'] = Relationship.relations
        user = User.objects.get(username=context['username'])
        # context['phone_choices'] = mark_safe(
        #     json.dumps([{choice[0]: choice[1]} for choice in MobileInfo.phone_choices]))
        if request.method == 'POST':
            form = Details(request.POST)
            if form.is_valid() and save_details(form, user):
                return HttpResponseRedirect("/contacts")
            return HttpResponseRedirect("/contacts/add")
        template = loader.get_template('contacts/add_contact.html')
        return HttpResponse(template.render(context, request))
    else:
        return HttpResponseRedirect("/contacts")

def delete_contact(request, user_id):
    context = {
        'error': None,
        'session': False
    }
    session_valid = isValidSession(request)
    if session_valid and user_id:
        context['session'] = True
        context['username'] = request.session['username']
        user = User.objects.get(username=context['username'])
        contact = ContactUser.objects.get(user_id=user_id, user=user)
        delete_user_contact(user, contact)
    return HttpResponseRedirect('/contacts')

def logout(request):
    delete_session(request)
    return HttpResponseRedirect("/contacts")
