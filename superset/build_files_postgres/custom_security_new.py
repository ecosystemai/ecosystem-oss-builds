from flask_appbuilder.security.views import AuthDBView
from flask_appbuilder import expose
from flask_login import login_user
from flask import request, redirect, session
import superset
from superset import app
from superset.security.manager import SupersetSecurityManager
import requests
import logging

#con la api mockeada esto se testea haciendo
#http://localhost:9000/login/?token=a
logger = logging.getLogger(__name__)

# def process_token_api(token_api_url, token):
#     try:
#         response = requests.get(token_api_url+"?token="+token)
#     except Exception:
#         return None
#     if response.status_code not in [400, 401, 404, 500]:
#         return response.json()


class CustomAuthDBView(AuthDBView):
    login_template = 'appbuilder/general/security/login_db.html'
    @expose('/login/', methods=['GET', 'POST'])
    def login(self):
        if superset.app.config.get('LOGIN_WITH_TOKEN') is False:
            return super(CustomAuthDBView, self).login()
        username = request.values.get('token')

        if username is None:
            return super(CustomAuthDBView, self).login()

        user = self.appbuilder.sm.find_user(
            username=username
        )

        if not user:
            return "Invalid Session: Username '{}' does not exist".format(username)

        # now, login the user
        login_user(user, remember=False)
        redirect_url = superset.app.config.get(
             'DEFAULT_WELCOME_DASHBOARD'
        )
        print("redirect_url: {}".format(redirect_url))
        # with standalone = True we remove the title and the
        # menu of Superset in our embedding.
        standalone = str(request.args.get('standalone'))

        # finally, it redirects the user to the welcome page.
        return redirect(
            redirect_url
            + '?standalone='
            + standalone
        )


class CustomSecurityManager(SupersetSecurityManager):
    authdbview = CustomAuthDBView
    def __init__(self, appbuilder):
        super(CustomSecurityManager, self).__init__(appbuilder)
        