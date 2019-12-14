from django.core.exceptions import ObjectDoesNotExist

from .models import MobileInfo, DateInfo, Relationship, User as ContactUser, Company, Description

def get_user_contacts(user):
    if user is not None:
        try:
            all_users = ContactUser.objects.filter(user=user)
            print(all_users)
            return all_users
        except ObjectDoesNotExist:
            return []
    return []

def save_details(form, owner):
    try:
        user = ContactUser()
        user.first_name = form.cleaned_data['firstname']
        user.last_name = form.cleaned_data['lastname']
        user.prefix = form.cleaned_data['prefix']
        user.suffix = form.cleaned_data['suffix']
        user.sur_name = form.cleaned_data['surname']
        user.user = owner
        user.save()

        contact = MobileInfo()
        contact.phone_type = form.cleaned_data['phonechoice']
        contact.contact = form.cleaned_data['phonenumber']
        contact.user = user
        contact.save()

        company = Company()
        company.company_name = form.cleaned_data['companyname']
        company.designation = form.cleaned_data['designation']
        company.user = user
        company.save()

        anniversary = DateInfo()
        anniversary.user = user
        anniversary.date = form.cleaned_data['anniversarydate'] or None
        anniversary.occasion = form.cleaned_data['anniversarychoice']
        anniversary.save()

        relationship = Relationship()
        relationship.user = user
        relationship.relation = form.cleaned_data['relationships']
        relationship.save()

        description = Description()
        description.user = user
        description.description = form.cleaned_data['description']
        description.save()

        return True
    except Exception:
        return False