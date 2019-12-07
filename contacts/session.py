def isValidSession(request):
    session_keys = request.session.keys()
    if "username" in session_keys:
        return True
    return False

def delete_session(request):
    session_valid = isValidSession(request)
    if session_valid:
        del request.session['username']