release: python manage.py makemigrations --no-input
release: python manage.py migrate --no-input
release: cd .\frontend\ && npm run build


web: gunicorn ReceiptApp.wsgi