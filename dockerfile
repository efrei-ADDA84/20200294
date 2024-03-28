# Utilisez l'image de Python officielle comme image de base
FROM python:3.9-alpine

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le code de l'application dans le conteneur
COPY src/ .

# Installez les dépendances Python
RUN pip install --no-cache-dir requests

# Commande par défaut à exécuter lorsque le conteneur démarre
CMD ["python", "main.py"]
