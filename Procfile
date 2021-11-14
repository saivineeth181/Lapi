web: gunicorn api.wsgi
release: python manage.py makemigrations --noinput
release: python manage.py collectstatic --noinput
<<<<<<< HEAD
release: python manage.py migrate --noinpute
=======
release: python manage.py migrate --noinput
>>>>>>> 43a652f2ea30f37600e587d5a34eda5591ba84ed
release: python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'saivineeth181@example.com', 'adminpass')"
