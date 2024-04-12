# Utilisez l'image de Python officielle comme image de base
FROM python:3.9-alpine

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le code de l'application dans le conteneur
COPY src/ .

# Installez les dépendances
RUN pip install flask requests

# Exposez le port sur lequel votre application Flask fonctionne
EXPOSE 8081

ENV FLASK_APP=main.py

# Commande pour exécuter votre application
CMD ["python", "weather_api.py"]
