# 📖 Guide de contribution - MicroCoaster

Guide complet pour contribuer aux projets MicroCoaster sur GitHub.

---

## 📑 Sommaire

1. [Premiers pas](#premiers-pas)
2. [Utilisation de Git](#utilisation-de-git)
3. [Gestion des issues](#gestion-des-issues)
4. [Création de branches](#création-de-branches)
5. [Conventions de commits](#conventions-de-commits)
6. [Pull Requests](#pull-requests)
7. [Résolution de conflits](#résolution-de-conflits)
8. [FAQ](#faq)

---

## Premiers pas

### Installation de Git

```bash
# Vérifier l'installation
git --version

# Configuration initiale
git config --global user.name "Ton Nom"
git config --global user.email "ton@email.com"
```

### Cloner un repository

```bash
git clone https://github.com/MicroCoaster/nom-du-repo.git
cd nom-du-repo
```

---

## Utilisation de Git

### Commandes de base

```bash
# Voir l'état des fichiers
git status

# Voir l'historique
git log --oneline

# Voir les branches
git branch -a

# Changer de branche
git checkout nom-branche

# Mettre à jour depuis le dépôt distant
git pull origin develop
```

### Sauvegarder son travail

```bash
# Ajouter des fichiers modifiés
git add fichier.js
git add .  # Ajouter tous les fichiers

# Créer un commit
git commit -m "type: description"

# Envoyer vers GitHub
git push origin nom-branche
```

---

## Gestion des issues

### Quand créer une issue ?

Créez **immédiatement** une issue pour :
- ✅ Bug détecté
- ✅ Idée d'amélioration
- ✅ Question technique
- ✅ Proposition de fonctionnalité
- ✅ Documentation manquante

### Comment créer une bonne issue ?

**Pour un bug :**
```markdown
**Description**
Le portail ne s'ouvre pas après le départ du train.

**Étapes pour reproduire**
1. Lancer l'application
2. Envoyer un train
3. Observer le portail

**Comportement attendu**
Le portail devrait s'ouvrir automatiquement.

**Environnement**
- Version : v1.2.3
- Navigateur : Chrome 120
- Module : Station ESP32
```

**Pour une fonctionnalité :**
```markdown
**Fonctionnalité souhaitée**
Ajouter un mode nuit pour l'interface web.

**Justification**
Amélioration du confort visuel lors des sessions nocturnes.

**Solution proposée**
Toggle dans les paramètres utilisateur avec sauvegarde locale.
```

### Labels à utiliser

- `bug` : Problème à corriger
- `enhancement` : Amélioration ou nouvelle fonctionnalité
- `documentation` : Documentation manquante ou à améliorer
- `question` : Question technique
- `priority-high` : Priorité élevée

---

## Création de branches

### Nommage des branches

**Format** : `type/description-courte`

**Exemples valides :**
```bash
feature/timeline-editor
feature/rgb-light-control
bugfix/station-portal-sync
bugfix/websocket-reconnection
hotfix/critical-memory-leak
docs/contributing-guide
```

**Exemples invalides :**
```bash
❌ nouvelle-feature
❌ fix
❌ test_branch
❌ Tom-travail
```

### Créer et publier une branche

```bash
# Depuis develop
git checkout develop
git pull origin develop

# Créer la nouvelle branche
git checkout -b feature/ma-fonctionnalite

# Publier sur GitHub
git push -u origin feature/ma-fonctionnalite
```

---

## Conventions de commits

### Format

```
type: description courte

[corps optionnel]

[footer optionnel]
```

### Types de commits

| Type | Utilisation | Exemple |
|------|-------------|---------|
| `feat` | Nouvelle fonctionnalité | `feat: ajout contrôle machine à fumée` |
| `fix` | Correction de bug | `fix: correction synchronisation portail` |
| `docs` | Documentation | `docs: mise à jour README installation` |
| `style` | Formatage code | `style: indentation fichiers CSS` |
| `refactor` | Refactorisation | `refactor: simplification logique WebSocket` |
| `test` | Ajout de tests | `test: ajout tests unitaires station` |
| `chore` | Tâches maintenance | `chore: mise à jour dépendances` |
| `perf` | Amélioration performance | `perf: optimisation requêtes base de données` |

### Exemples détaillés

**Commit simple :**
```bash
git commit -m "feat: ajout bouton pause timeline"
```

**Commit avec description :**
```bash
git commit -m "fix: correction déconnexion ESP32

Le WebSocket natif se déconnectait après 5 minutes d'inactivité.
Ajout d'un système de ping/pong toutes les 30 secondes.

Fixes #42"
```

**Commit breaking change :**
```bash
git commit -m "feat!: nouvelle API WebSocket

BREAKING CHANGE: Le format des messages WebSocket a changé.
Les anciens modules ESP32 doivent être mis à jour."
```

### Messages à éviter

```bash
❌ git commit -m "fix"
❌ git commit -m "update"
❌ git commit -m "modifications"
❌ git commit -m "WIP"
❌ git commit -m "ça marche"
```

---

## Pull Requests

### Créer une Pull Request

1. **Pousser votre branche**
```bash
git push origin feature/ma-fonctionnalite
```

2. **Sur GitHub :**
   - Aller sur le repository
   - Cliquer "Compare & pull request"
   - Sélectionner `develop` comme branche de destination

3. **Remplir le template :**

```markdown
## Description
Ajout d'un éditeur de timeline permettant de créer des séquences automatisées.

## Type de changement
- [x] Nouvelle fonctionnalité
- [ ] Correction de bug
- [ ] Documentation

## Checklist
- [x] Code testé localement
- [x] Documentation mise à jour
- [x] Pas de conflit avec develop
- [x] Commits respectent les conventions

## Issue liée
Closes #123

## Screenshots
[capture d'écran si pertinent]
```

### Revue de code

**En tant que reviewer :**
- Tester le code localement
- Vérifier la logique et la lisibilité
- Suggérer des améliorations
- Approuver si tout est correct

**En tant qu'auteur :**
- Répondre aux commentaires
- Effectuer les modifications demandées
- Notifier quand c'est prêt pour re-review

---

## Résolution de conflits

### Mettre à jour sa branche

```bash
# Se placer sur sa branche
git checkout feature/ma-fonctionnalite

# Récupérer develop
git fetch origin
git merge origin/develop

# Si conflits, les résoudre manuellement
# Puis :
git add .
git commit -m "chore: merge develop"
git push origin feature/ma-fonctionnalite
```

### Résoudre un conflit

Les conflits apparaissent comme ceci dans le fichier :

```javascript
<<<<<<< HEAD
const port = 3000;
=======
const port = 8080;
>>>>>>> develop
```

**Étapes :**
1. Choisir la bonne version ou combiner
2. Supprimer les marqueurs `<<<<<<<`, `=======`, `>>>>>>>`
3. Sauvegarder le fichier
4. `git add fichier.js`
5. `git commit -m "chore: résolution conflit port"`

---

## FAQ

### Comment annuler mon dernier commit ?

```bash
# Annuler le commit mais garder les modifications
git reset --soft HEAD~1

# Annuler le commit ET les modifications
git reset --hard HEAD~1
```

### Comment modifier mon dernier commit ?

```bash
# Modifier le message
git commit --amend -m "nouveau message"

# Ajouter des fichiers oubliés
git add fichier-oublie.js
git commit --amend --no-edit
```

### J'ai commité sur la mauvaise branche

```bash
# Sauvegarder le commit
git log  # Noter le hash du commit

# Revenir en arrière
git reset --hard HEAD~1

# Aller sur la bonne branche
git checkout bonne-branche

# Appliquer le commit
git cherry-pick HASH_DU_COMMIT
```

### Comment supprimer une branche ?

```bash
# Localement
git branch -d feature/ma-branche

# Sur GitHub
git push origin --delete feature/ma-branche
```

### Je suis perdu, comment tout recommencer ?

```bash
# Sauvegarder votre travail actuel
git stash

# Revenir à l'état de develop
git checkout develop
git pull origin develop

# Récupérer votre travail si besoin
git stash pop
```

### Comment voir les différences avant de commiter ?

```bash
# Voir les modifications non stagées
git diff

# Voir les modifications stagées
git diff --staged
```

---