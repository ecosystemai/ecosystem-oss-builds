#let's add our custom security manager
from superset.security.security import CustomSecurityManager
CUSTOM_SECURITY_MANAGER = CustomSecurityManager
# let's set a default dashboard for all users
# DASHBOARD_TEMPLATE_ID = 4

# if DASHBOARD_TEMPLATE_ID is set, a copy of the
# dashboard will be created and then he/she will
# be redirected to it.
# Otherwise, he/she will be redirected to the welcome page.
# DEFAULT_WELCOME_DASHBOARD = '/superset/dashboard/births'

#DEFAULT_WELCOME_DASHBOARD = '/superset/welcome/'

#LOGIN_WITH_TOKEN = True
#TOKEN_API_URL = "http://host.docker.internal:5000/"

#GENERIC_CHART_AXES = True
#ENABLE_TEMPLATE_PROCESSING = True
#SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:password@ecosystem-postgres:5432/superset_meta'