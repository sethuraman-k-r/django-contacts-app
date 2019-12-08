from .models import User
from django.core.exceptions import ObjectDoesNotExist

def get_user_contacts(user):
    if user is not None:
        try:
            return User.objects.get(user=user)
        except ObjectDoesNotExist:
            return []
    return []