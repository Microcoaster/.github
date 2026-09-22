<div align="center">

<img src="img/banniere.png" alt="MicroCoaster, kits de montagnes russes miniatures modulaires et connectés" width="100%">

</div>

**MicroCoaster** conçoit et commercialise des kits de montagnes russes miniatures modulaires, à l'échelle **1:78**, destinés aux passionnés, aux collectionneurs et aux ingénieurs. Chaque circuit se compose de modules autonomes qui se connectent au réseau et se pilotent depuis une application web.

Fondée par **Thomas Schirnhofer** en Autriche · [microcoaster.com](https://microcoaster.com)

Cette organisation héberge tout le logiciel : l'application de pilotage, les firmwares ESP32 des modules, et les outils communautaires.

<img src="img/sections/s01.png" alt="01 L'application" width="100%">

<a href="https://github.com/Microcoaster/MicroCoasterWebApp"><img src="img/webapp.png" alt="MicroCoaster WebApp, application web de pilotage" width="100%"></a>

Disponible sur **[app.microcoaster.com](https://app.microcoaster.com)**. Elle découvre les modules connectés, affiche leur télémétrie en temps réel, et permet de composer des timelines pour orchestrer un circuit entier : départ de station, aiguillage, effets lumineux, fumée et audio déclenchés dans l'ordre voulu.

C'est aussi elle qui décide. Un module ne se met jamais en mouvement de lui-même : il exécute un ordre venu du serveur, seul à connaître l'état complet du circuit. Cette asymétrie est la règle de conception qui tient tout le reste.

**Node.js · Express · MySQL · Socket.io pour les pages web · WebSocket natif pour les ESP32**

<img src="img/sections/s02.png" alt="02 Les modules" width="100%">

Tous partagent la même base : un ESP32 sous PlatformIO, un portail captif pour l'appairage au réseau, puis une liaison WebSocket permanente avec le serveur.

<a href="https://github.com/Microcoaster/MicroCoaster_WifiManager"><img src="img/wifimanager.png" alt="WiFi Manager, firmware de base commun aux modules" width="100%"></a>

<a href="https://github.com/Microcoaster/Switch-Track"><img src="img/switchtrack.png" alt="Switch Track, module d'aiguillage" width="100%"></a>

<a href="https://github.com/Microcoaster/Launch-Track"><img src="img/launch.png" alt="Launch Track, zone de lancement" width="100%"></a>

<a href="https://github.com/Microcoaster/Lift-Hill"><img src="img/lift.png" alt="Lift Hill, montée du train" width="100%"></a>

<a href="https://github.com/Microcoaster/Module-Audio"><img src="img/audio.png" alt="Module Audio, lecteur embarqué" width="100%"></a>

<a href="https://github.com/Microcoaster/Smoke-Machine"><img src="img/smoke.png" alt="Smoke Machine, module de fumée" width="100%"></a>

<a href="https://github.com/Microcoaster/ESP-32-led"><img src="img/led.png" alt="Banc LED, version d'essai du Switch Track" width="100%"></a>

Deux manières de donner au train l'énergie dont il vivra le circuit : le hisser en haut d'une montée, ou l'accélérer sur quelques dizaines de centimètres. Le **Lift Hill** fait la première, le **Launch Track** la seconde.

<img src="img/sections/s03.png" alt="03 Autour du produit" width="100%">

<a href="https://github.com/Microcoaster/Microcoaster-bot"><img src="img/bot.png" alt="Bot Discord de support et de garanties" width="100%"></a>

<a href="https://github.com/Microcoaster/GuessTheCoaster"><img src="img/guess.png" alt="Guess The Coaster, jeu Discord communautaire" width="100%"></a>

<a href="https://github.com/Microcoaster/MicroCoaster_Docs"><img src="img/docs.png" alt="MicroCoaster Docs, page d'attente de la documentation produit" width="100%"></a>

<a href="https://github.com/Microcoaster/MicroCoaster_Forum"><img src="img/forum.png" alt="MicroCoaster Forum, page d'attente du forum communautaire" width="100%"></a>

La documentation et le forum n'existent pas encore. Ces deux dépôts tiennent leurs domaines en attendant, avec un compte à rebours et une bascule de langue. Un serveur Express qui sert du statique, sans étape de build : une page d'attente qui demande une chaîne de compilation est une page d'attente qu'on n'ose plus toucher.

<img src="img/sections/s04.png" alt="04 Travailler ici" width="100%">

<img src="img/schemas/cycle.png" alt="Une issue, puis une branche, des commits, une review, la fusion" width="100%">

<img src="img/schemas/branches.png" alt="Graphe des branches. main porte le code de production stable. develop intègre les développements. feature et bugfix partent de develop et y reviennent, pour les nouvelles fonctionnalités et les corrections. hotfix part de main et y revient, pour un correctif urgent greffé sur la production. Aucune de ces lignes n'arrive sur main ni sur develop sans passer par une review." width="100%">

Un bug repéré ou une idée qui passe : ouvrez une issue tout de suite. C'est ce qui évite de l'oublier, ce qui permet d'en discuter, et ce qui garde une trace de la décision.

**Conventions.** Commits au format `type: description`, par exemple `feat: ajout contrôle fumée`. Branches préfixées puis décrites en kebab-case. Issues étiquetées `bug`, `fonctionnalité` ou `documentation`. Pull requests avec une description claire et un renvoi vers l'issue.

**Non négociable.** Pas de push direct sur `main` ni sur `develop`. Review obligatoire avant fusion. Tests locaux avant d'ouvrir une pull request. Historique propre et linéaire.

Le [**guide de contribution**](https://github.com/Microcoaster/.github/blob/main/CONTRIBUTING.md) détaille les commandes Git, les exemples de conventions et la résolution des problèmes courants. Posé à la racine du dépôt `.github`, il sert de guide par défaut à tous les dépôts de l'organisation.

<img src="img/sections/s05.png" alt="05 Nous suivre" width="100%">

<p align="center">
  <a href="https://microcoaster.com"><img src="img/liens/site.png" alt="Le site : microcoaster.com" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://discord.gg/NXqd4eYYQf"><img src="img/liens/discord.png" alt="La communauté sur Discord" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://www.youtube.com/@microcoaster"><img src="img/liens/youtube.png" alt="La chaîne YouTube @microcoaster" width="72" /></a>
  &nbsp;&nbsp;
  <a href="https://instagram.com/microcoaster"><img src="img/liens/instagram.png" alt="Les photos sur Instagram @microcoaster" width="72" /></a>
</p>

<p align="center">
  <a href="https://microcoaster.com"><img src="img/liens/adresse.png" alt="microcoaster.com" width="380" /></a>
</p>

<img src="img/cloture.png" alt="MicroCoaster, des heures infinies de fun. microcoaster.com, échelle 1:78, conçu en Autriche." width="100%">
