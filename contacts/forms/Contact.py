from django import forms

from ..models import MobileInfo, Relationship, DateInfo

class UserInfo(forms.Form):
    firstname = forms.CharField(label="firstname", max_length=50, required=True)
    lastname = forms.CharField(label="lastname", max_length=50, required=True)
    surname = forms.CharField(label="surname", max_length=50, required=False)
    prefix = forms.CharField(label="prefix", max_length=10, required=False)
    suffix = forms.CharField(label="suffix", max_length=10, required=False)

class ContactDetails(UserInfo):
    phonechoice = forms.ChoiceField(label="phonechoice", choices=MobileInfo.phone_choices, required=True)
    phonenumber = forms.CharField(label="phonenumber", required=True)
    user_info = UserInfo

class CompanyDetails(ContactDetails):
    companyname = forms.CharField(label="companyname", required=False)
    designation = forms.CharField(label="designation", required=False)
    contact_details = ContactDetails

class Anniversary(CompanyDetails):
    anniversarydate = forms.DateField(label="anniversarydate", required=False)
    anniversarychoice = forms.ChoiceField(label="anniversarychoice", choices=DateInfo.date_choices, required=False)
    company_details = CompanyDetails

class Details(Anniversary):
    relationships = forms.ChoiceField(label="relationships", choices=Relationship.relations, required=False)
    description = forms.CharField(label="description", required=False, max_length=100)
    anniversary = Anniversary