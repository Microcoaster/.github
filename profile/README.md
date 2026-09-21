<div align="center">

<img src="img/banniere.png" alt="MicroCoaster, kits de montagnes russes miniatures modulaires et connectés" width="100%">

</div>

**MicroCoaster** conçoit et commercialise des kits de montagnes russes miniatures modulaires, à l'échelle **1:78**, destinés aux passionnés, aux collectionneurs et aux ingénieurs. Chaque circuit se compose de modules autonomes qui se connectent au réseau et se pilotent depuis une application web.

Fondée par **Thomas Schirnhofer** en Autriche · [microcoaster.com](https://microcoaster.com)

Cette organisation héberge tout le logiciel : l'application de pilotage, les firmwares ESP32 des modules, et les outils communautaires.

---

## L'application

<img src="img/webapp.png" alt="MicroCoaster WebApp, application web de pilotage" width="100%">

Disponible sur **[app.microcoaster.com](https://app.microcoaster.com)**. Elle découvre les modules connectés, affiche leur télémétrie en temps réel, et permet de composer des timelines pour orchestrer un circuit entier : départ de station, aiguillage, effets lumineux, fumée et audio déclenchés dans l'ordre voulu.

**Node.js · Express · MySQL · Socket.io pour les pages web · WebSocket natif pour les ESP32**

---

## Les modules

Tous partagent la même base : un ESP32 sous PlatformIO, un portail captif pour l'appairage au réseau, puis une liaison WebSocket permanente avec le serveur.

<img src="img/wifimanager.png" alt="WiFi Manager, firmware de base commun aux modules" width="100%">

<img src="img/switchtrack.png" alt="Switch Track, module d'aiguillage" width="100%">

<img src="img/audio.png" alt="Module Audio, lecteur embarqué" width="100%">

<img src="img/smoke.png" alt="Smoke Machine, module de fumée" width="100%">

<img src="img/led.png" alt="Banc LED, version d'essai du Switch Track" width="100%">

---

## Autour du produit

<img src="img/bot.png" alt="Bot Discord de support et de garanties" width="100%">

<img src="img/guess.png" alt="Guess The Coaster, jeu Discord communautaire" width="100%">

---

## Travailler ici

### Branches

| Branche | Rôle |
|:--|:--|
| `main` | Code de production stable |
| `develop` | Intégration des développements |
| `feature/*` | Nouvelles fonctionnalités |
| `bugfix/*` | Corrections |
| `hotfix/*` | Correctifs urgents |

### Le cycle

Une **issue** décrit le travail. Une **branche** part de `develop`. Les commits restent réguliers et lisibles. Une **pull request** revient vers `develop`, passe en **review**, puis fusionne.

Un bug repéré ou une idée qui passe : ouvrez une issue tout de suite. C'est ce qui évite de l'oublier, ce qui permet d'en discuter, et ce qui garde une trace de la décision.

### Conventions

- **Commits** : `type: description`, par exemple `feat: ajout contrôle fumée`
- **Branches** : préfixe puis description en kebab-case
- **Issues** : étiquettes `bug`, `fonctionnalité`, `documentation`
- **Pull requests** : description claire et renvoi vers l'issue

### Non négociable

Pas de push direct sur `main` ni sur `develop`. Review obligatoire avant fusion. Tests locaux avant d'ouvrir une pull request. Historique propre et linéaire.

Le [**guide de contribution**](./CONTRIBUTING.md) détaille les commandes Git, les exemples de conventions et la résolution des problèmes courants.

---

<div align="center">

[![Site](https://img.shields.io/badge/microcoaster.com-FFFFFF?style=for-the-badge&logo=firefoxbrowser&logoColor=black&labelColor=1A1A1A)](https://microcoaster.com)
[![Application](https://img.shields.io/badge/app.microcoaster.com-E8E8E8?style=for-the-badge&logo=react&logoColor=black&labelColor=1A1A1A)](https://app.microcoaster.com)
[![Documentation](https://img.shields.io/badge/docs-C0C0C0?style=for-the-badge&logo=readthedocs&logoColor=black&labelColor=1A1A1A)](https://docs.microcoaster.com)
[![Forum](https://img.shields.io/badge/forum-A8A8A8?style=for-the-badge&logo=discourse&logoColor=black&labelColor=1A1A1A)](https://forum.microcoaster.com)

[![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=1A1A1A)](https://microcoaster.com/discord)
[![YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white&labelColor=1A1A1A)](https://www.youtube.com/@microcoaster)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white&labelColor=1A1A1A)](https://instagram.com/microcoaster)

<br>

<sub>MicroCoaster™ · Des heures infinies de fun</sub>

</div>
