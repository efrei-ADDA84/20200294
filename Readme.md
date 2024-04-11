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