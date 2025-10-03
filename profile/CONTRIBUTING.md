# 📖 Guide de contribution - MicroCoaster

Guide complet pour contribuer aux projets MicroCoaster sur GitHub.

---

## Introduction

### Prérequis
- Connaissance de base de Git.
- Éditeur de code comme VS Code.
- Compte GitHub.

---

## 📑 Sommaire

1. [Gestion des issues](#gestion-des-issues)
2. [Création de branches et codage](#création-de-branches-et-codage)
3. [Pull Requests](#pull-requests)
4. [Revue de code](#revue-de-code)
5. [Gestion du CHANGELOG](#gestion-du-changelog)
6. [Résolution de conflits](#résolution-de-conflits)

---

## Gestion des issues

Commençons par les issues. Les issues permettent de signaler des bugs, de proposer des améliorations ou de nouvelles fonctionnalités. C'est ici que nous décidons quoi coder et réaliser dans les différents projets. Vous pouvez également consulter les tâches à faire sur [https://github.com/orgs/Microcoaster/projects/1](https://github.com/orgs/Microcoaster/projects/1), qui regroupe toutes les tâches de tous les dépôts.

Vous pouvez créer une nouvelle issue. Voici les règles à respecter et le template.

### Quand créer une issue ?

Créez **immédiatement** une issue pour :
- ✅ Bug détecté
- ✅ Idée d'amélioration
- ✅ Question technique
- ✅ Proposition de fonctionnalité
- ✅ Documentation manquante

### Comment créer une bonne issue ?

Utilisez le template suivant pour structurer votre issue de manière claire et complète. Remplissez chaque section avec des détails factuels. Ajoutez des labels (ex. `bug`, `enhancement`) et un type (ex. "Bug" ou "Feature Request") via l'interface GitHub. Ajoutez ensuite l'issue au projet pour suivre les ajouts en cours.

**Template :**

```markdown
## Titre clair et descriptif
(ex. : "Bug : Portail ne s'ouvre pas après départ du train")

## Description
Décrivez le problème ou la proposition en détail. Soyez précis sur ce qui se passe et pourquoi c'est important.

## Type de changement
- [ ] Bug
- [ ] Nouvelle fonctionnalité
- [ ] Amélioration
- [ ] Documentation
- [ ] Question

## Étapes pour reproduire (pour les bugs)
1. Étape 1
2. Étape 2
3. ...

## Comportement attendu
Expliquez ce qui devrait se passer.

## Environnement
- Version du projet :
- Navigateur/Système :
- Modules concernés (ex. ESP32) :

## Solution proposée (optionnel)
Idées pour résoudre le problème.

## Screenshots ou logs (optionnel)
Ajoutez des captures d'écran ou extraits de logs si pertinent.
```

[Placeholder pour vidéo : Comment créer une issue à partir de la page de l'organisation, juste l'upload de l'issue]

---

## Création de branches et codage

Comment réaliser ce qui est demandé dans une issue ? Nous allons voir comment coder en utilisant les branches.

Repérez une issue à traiter, puis mettez-vous au travail. Pour cela, allez sur l'issue et créez une nouvelle branche. Voici les conventions à respecter pour le nom des branches.

### Nommage des branches

**Format** : `type/description-courte`

#### Types de branches

| Type | Utilisation | Exemple (nom de branche) |
|------|-------------|-------------------------|
| `feat` | Nouvelle fonctionnalité | `feat/ajout-controles-timeline` |
| `fix` | Correction de bug | `fix/resoudre-validation-connexion` |
| `docs` | Documentation | `docs/mettre-a-jour-docs-api` |
| `style` | Formatage / mise en forme | `style/formater-fichiers-css` |
| `refactor` | Refactorisation | `refactor/simplifier-websocket` |
| `test` | Ajout de tests | `test/ajouter-tests-modele-utilisateur` |
| `chore` | Tâches de maintenance | `chore/mettre-a-jour-dependances` |
| `perf` | Amélioration des performances | `perf/optimiser-requetes-db` |

Une fois le nom choisi, deux options s'offrent à vous : soit vous utilisez [GitHub Desktop](https://desktop.github.com/download/) et les commandes se font automatiquement dans VS Code, soit vous n'avez pas cet outil et vous devrez exécuter les commandes manuellement.

[Placeholder pour vidéo : Où on me voit choisir une issue et mettre le nom et ouvrir avec GitHub Desktop]

Maintenant, vous pouvez modifier le code dans votre branche et effectuer des commits en respectant les conventions de commits détaillées ci-dessous.

### Conventions de commits

#### Format

```
type: description courte

[corps optionnel]

[footer optionnel]
```

#### Types de commits

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

---

## Pull Requests

Une fois le codage terminé et les commits effectués sur votre branche, poussez-la et créez une pull request pour proposer vos modifications.

[Placeholder pour vidéo : Où on me voit pousser la branche puis ouvrir la pull request sur GitHub]

### Étapes pour créer une Pull Request

1. **Pousser votre branche**
```bash
git push origin feat/ajout-controles-timeline  # Remplacez par le nom de votre branche
```

2. **Sur GitHub :**
   - Allez sur le dépôt où vous travaillez (ex. https://github.com/Microcoaster/MicroCoasterWebApp).
   - Cliquez sur "Compare & pull request".
   - Sélectionnez `develop` comme branche de destination (les branches `develop` et `main` sont protégées contre les push directs).

3. **Remplir le template :**

```markdown
## Description
Décrivez les changements en détail (ex. : Ajout de contrôles pour la timeline avec boutons pause et lecture).

## Type de changement
Choisissez un type principal :
- [ ] feat (Nouvelle fonctionnalité)
- [ ] fix (Correction de bug)
- [ ] docs (Documentation)
- [ ] refactor (Refactorisation)
- [ ] test (Tests)
- [ ] chore (Maintenance)
- [ ] perf (Performance)
- [ ] style (Style)

## Checklist
- [ ] Code testé localement
- [ ] Documentation mise à jour si nécessaire
- [ ] CHANGELOG mis à jour (ajoutez une entrée pour cette PR)
- [ ] Pull depuis develop effectué avant la PR

## Issue liée
Closes #123 (ou liste des issues liées)

## Screenshots
[Ajoutez des captures d'écran si pertinent]
```

### Processus de revue

Après la création de la pull request, une personne va reviewer le code (une review obligatoire pour le merge). En cas de demande de modifications, ajustez le code, commitez à nouveau et demandez une nouvelle review. Une fois la pull request acceptée, elle est fusionnée sur `develop` et votre branche est supprimée.

[Placeholder pour vidéo : Où on voit la demande de modification sur la PR, transition on me voit changer le code et re-pousser, puis re-transition où le pull request est validé]

### Branches protégées

- `main` et `develop` sont protégées : pas de push direct. Créez toujours une PR vers `develop` pour les changements standards.
- Pour une nouvelle version (release), créez une PR de `develop` vers `main`.

### Créer une release de develop vers main

1. Assurez-vous que `develop` est à jour et testé.
2. Créez une PR depuis `develop` vers `main` sur GitHub.
3. Dans la PR, décrivez les changements majeurs.
4. Mergez après revue.
5. Taggez la release (voir FAQ).

[Placeholder pour vidéo : Où on me voit créer une PR de develop vers main, la merger après revue, puis tagger la release]

---

## Revue de code

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

## Gestion du CHANGELOG

Pour chaque pull request, ajoutez les détails des modifications apportées dans la section ## [Unreleased], juste avant la dernière version. Par exemple, consultez [keepachangelog.com](https://keepachangelog.com/fr) pour le format recommandé.

Exemple de format :

## [Unreleased]

### Added
- Nouvelle fonctionnalité de timeline

### Fixed
- Correction du bug de synchronisation

### Changed
- Amélioration des performances de la base de données

---

## Conclusion

Merci de suivre ce guide pour que nous codions bien ensemble ! Si vous avez des doutes, n'hésitez pas à demander dans une issue ou directement à yamakajump.

---

## Résolution de conflits

### Mettre à jour sa branche

```bash
# Se placer sur sa branche
git switch feature/ma-fonctionnalite

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
git switch bonne-branche

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
git switch develop
git pull origin develop

# Récupérer votre travail si besoin
git stash pop
```

### Comment voir les différences avant de committer ?

```bash
# Voir les modifications non stagées
git diff

# Voir les modifications stagées
git diff --staged
```

### Comment tagger une release (ex. v0.0.0) ?

```bash
git tag v0.0.0
git push origin v0.0.0
```