if [ "$( psql -U postgres -XtAc "SELECT 1 FROM pg_database WHERE datname='jupyterhub_users'" )" = '1' ]
then
    echo "Database already exists"
else
    echo "Database does not exist"
fi




pg_dump -U postgres superset_meta > superset_meta.sql

pg_dump -U postgres jupyterhub_users > jupyterhub_users.sql

psql -U postgres -c 'create database jupyterhub_users with owner jupyterhub;'

psql -U postgres jupyterhub_users < jupyterhub_users.sql