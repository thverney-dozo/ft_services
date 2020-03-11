Le projet consistera a vous faire mettre en place une infrastructure de différents services, avec ses propres règles. Pour ce faire, vous devrez obligatoirement utiliser Kubernetes.
Vous devrez donc mettre en place un cluster regroupant plusieurs containers de services.
Chaque service devra tourner dans un container dédié.
Chaque container devra obligatoirement porter le même nom que le service concerné.
Pour des raisons de performances, les containers devront être build sous Alpine Linux.
Aussi, ils devront tous posséder un Dockerfile écrit par vos soins qui sera appelé dans
le setup.sh.
Vous devrez donc build vous mêmes les images que vous utiliserez et il est bien entendu
interdit d’en prendre des toutes faites.
Vous allez aussi devoir mettre en place :
• Le dashboard web de Kubernetes. Celui-ci est utile pour gérer votre cluster.
• L’objet Ingress Controller qui gère l’accès externe aux services dans un cluster.
C’est lui qui va rediriger vers votre Container Nginx.
• Un serveur Nginx ouvert sur les ports 80 et 443.
• Un serveur FTPS ouvert sur le port 21.
• Un wordpress ouvert sur le port 5050, fonctionnant avec une base de donnée
Mysql. Les deux devront être dans deux containers distincts. Le wordpress devra
comporter plusieurs utilisateurs et un administrateur.
• Phpmyadmin, tournant sur le port 5000 et relié a la base de donnée MySQL.
• Un grafana, accessible sur le port 3000, fonctionnant avec une base de donnée
influxDB. Celui-ci devra vous permettre de monitorer tous vos containers. Les
deux devront aussi être dans deux containers distincts. Vous devrez créer un dashboard par container.
• En cas de crash ou d’arrêt d’un des deux containers de base de données, vous
devrez vous assurer que celles-ci puissent persister et ne soient pas perdu. En cas
de suppression, les volumes où la data est sauvegardée doivent persister.
• Vous devrez vous assurer de pouvoir accéder a votre Nginx en connexion SSH.
• Chacun de vos containers devra pouvoir redémarrer automatiquement en cas de
4
crash ou d’arrêt.
