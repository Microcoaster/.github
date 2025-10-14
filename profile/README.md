# 🎢 MicroCoaster

Organisation officielle de développement logiciel pour MicroCoaster - Système de montagnes russes miniatures modulaires à l'échelle 1:78.

---

## 🏢 À propos de MicroCoaster

**MicroCoaster** conçoit et commercialise des systèmes de montagnes russes miniatures modulaires destinés aux passionnés, collectionneurs et ingénieurs. Fondée par **Thomas Schirnhofer** en Autriche, l'entreprise propose des kits modulaires permettant de créer des circuits personnalisables avec une physique réaliste et des matériaux premium.

- **Échelle** : 1:78
- **Site web** : [microcoaster.com](https://microcoaster.com)
- **Contact** : tom@microcoaster.com
- **Support** : tristan@microcoaster.com

---

## 🚀 Projet principal : MicroCoaster WebApp

Application web de contrôle pour modules ESP32 gérant les différents composants d'un système de montagnes russes, disponible sur **[app.microcoaster.com](https://app.microcoaster.com)**.

### Architecture
- **Backend** : Node.js, Express.js, MySQL
- **Communication temps réel** : Socket.io (pages web) + WebSocket natif (ESP32)
- **Matériel** : Microcontrôleurs ESP32

### Fonctionnalités
- Contrôle en temps réel de vos modules (stations, launch tracks, aiguillages, effets lumineux, fumée, audio)
- Création de timelines pour automatiser et orchestrer vos modules
- Télémétrie en temps réel

---

## 📋 Pratiques de développement

### Structure des branches
- `main` : code production stable
- `develop` : intégration des développements
- `feature/*` : nouvelles fonctionnalités
- `bugfix/*` : corrections de bugs
- `hotfix/*` : correctifs urgents

### Workflow
1. Créer une **issue** décrivant le travail
2. Créer une **branche** depuis `develop`
3. Développer avec commits réguliers et messages clairs
4. Ouvrir une **Pull Request** vers `develop`
5. **Review** obligatoire avant merge
6. Merge après validation

### Signalement et idées
**Bug détecté ou idée d'amélioration ?** Créez immédiatement une **issue** pour :
- Ne pas oublier le problème ou l'idée
- Permettre la discussion et la priorisation
- Tracer l'historique des décisions

### Conventions
- **Commits** : `type: description` (ex: `feat: ajout contrôle fumée`)
- **Branches** : préfixe + description en kebab-case
- **Issues** : utiliser les labels appropriés (`bug`, `fonctionnalité`, `documentation`)
- **Pull Requests** : description claire + référence à l'issue concernée

### Règles
- ❌ Pas de push direct sur `main` et `develop`
- ✅ Review obligatoire avant merge
- ✅ Tests locaux avant création de PR
- ✅ Historique propre et linéaire

---

## 📚 Documentation complète

**Besoin d'aide ?** Consultez notre [**Guide de contribution complet**](./CONTRIBUTING.md) pour :
- Commandes Git détaillées
- Exemples de conventions
- Tutoriels GitHub
- FAQ et résolution de problèmes

---

## 🔗 Liens utiles

- [Site officiel](https://microcoaster.com)
- [Application web](https://app.microcoaster.com)
- [YouTube](https://www.youtube.com/@microcoaster)
- [Discord communauté](https://microcoaster.com/discord)
- [Instagram](https://instagram.com/microcoaster)

---

**MicroCoaster** - Des heures infinies de fun 🎢
