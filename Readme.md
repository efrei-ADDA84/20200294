Rapport TP1

Liens et commande :

Commande d'exécution : docker run -e OPENWEATHER_API_KEY=votre api key -e LATTITUDE=latitude -e LONGITUDE=longitude zeork7/test-lab1

Etapes réalisées :
Création d'un environnement virtuel afin de télécharger les librairies nécessaires
Crétaion d'une clé API sur le site d'openweather
Ecriture du fichier main.py permettant de se connecter à l'api en récupérant les informations souhaitées. Ici la température, une brève description, le pays, la ville, la température max, la température min.
Configuration des variables d'environnement, ici la clé api ainsi que la longitude et la lattitude
Création du dockerfile : utiliser lors de la création de l'image pour charger le contenue et configurer avec le requiremment puis lancement du fichier main.py.
Création de l'image docker avec dockerbuild
Pour exécuter le code passer en paramètre d'environnement la clé api, ainsi que la latitude et la longitude du lieu souhité
Push de l'image docker avec docker push sur docker hub


Rapport TP2 :

Liens et commande :

Image du wrapper get weather sur dockerhub à cette adresse :

(https://hub.docker.com/repository/docker/zeork7/test-lab1/general)

Commande pour executer le docker file :

docker run --network host --env API_KEY=**** zeork7/test-lab1:latest puis dans un autre terminal : curl "http://localhost:5000/?lat=5.902785&lon=102.754175"

Technologie
Dans ce TP, nous avons utilisé python et la bibliothèque Flask pour créer une API qui à partir d'une longitude et latitude renvoie les données météo associées grâce à l'API Openweather. L'objectif était ensuite de s'initier à la création d'un workflow github action qui permet d'executer des tâches à chaque comit sur le projet.

Etapes
J'ai dans un premier temps codé l'API avec la bibliothèque Flask
J'ai ensuite créée le build.yaml pour configurer le workflow
Dès que le workflow était fonctionnel et après avoir testé l'API à travers l'image docker.


Rapport TP3 :

Lors de ce TP nous devions push une image docker dans un container registry sur microsoft azure

Technologie
Dans ce TP, nous avons utilisé python et la bibliothèque Flask pour créer une API qui à partir d'une longitude et latitude renvoie les données météo associées grâce à l'API Openweather. L'objectif était ensuite de s'initier à la création d'un workflow github action qui permet de push et déployer notre image dans un container azure registry.

Etapes
J'ai ajouté au fichier build.yaml pour configurer le workflow afin qu'on puisse déployé l'image dans le conteneur
Dès que le workflow était fonctionnel et après avoir testé l'API à travers l'image docker, j'ai testé sur azure si la connexion avec l'API pouvait se faire.