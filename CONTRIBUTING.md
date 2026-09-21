# Contribuer chez MicroCoaster

Ce guide vaut pour tous les dépôts de l'organisation, firmwares comme applications. Il tient en une idée : rien n'arrive sur `main` sans être passé sous un autre regard.

## Avant d'écrire du code

**Ouvrez une issue.** Même pour une correction d'une ligne. Une issue coûte trente secondes et répond à trois questions qui reviennent toujours six mois plus tard : qu'est-ce qu'on voulait faire, pourquoi, et qui en a décidé ainsi.

Étiquetez-la `bug`, `fonctionnalité` ou `documentation`. Si la réponse n'est pas évidente, c'est souvent que l'issue mélange deux sujets.

## Une branche par sujet

Partez de `develop`, jamais de `main`, sauf pour un correctif urgent sur la production.

```bash
git switch develop
git pull
git switch -c feature/pilotage-fumee
```

`feature/` pour une fonctionnalité nouvelle. `bugfix/` pour une correction sans urgence. `hotfix/` pour un correctif urgent, seul cas où l'on part de `main`.

La suite du nom décrit le sujet en kebab-case. `feature/pilotage-fumee`, pas `feature/tristan-2` ni `feature/fix`.

## Des commits qui se relisent

Le format est `type: description`, à l'infinitif ou au présent, en français.

```
feat: ajout du contrôle de la machine à fumée
fix: correction de la reconnexion après coupure WiFi
docs: schéma de brochage du Launch Track
refactor: extraction de la logique de rampe
test: couverture du gestionnaire de tickets
chore: mise à jour des dépendances
```

Un commit fait une chose. S'il faut écrire « et » dans le message, il y a probablement deux commits.

## La pull request

Elle revient sur `develop`, décrit ce qui change et pourquoi, et renvoie vers l'issue avec `Closes #12`.

Avant de l'ouvrir :

- Le projet compile ou démarre.
- Les tests passent en local.
- Aucun secret, aucun identifiant, aucun `.env` dans le diff.
- Les fichiers générés et les dépendances ne sont pas versionnés.

La review n'est pas une formalité. Attendez-vous à des questions, et posez-en.

## Non négociable

- Pas de push direct sur `main` ni sur `develop`.
- Review obligatoire avant fusion.
- Historique propre : préférez reprendre votre branche plutôt que d'empiler des commits « fix du fix ».
- Aucun secret dans le dépôt. Un identifiant poussé par erreur est un identifiant à révoquer, pas à effacer du dernier commit.

## Documentation

Chaque dépôt porte son README, et la règle y est la même partout : ce qui a un ordre devient une séquence, ce qui n'en a pas devient une grille, un brochage devient un schéma de carte. Les figures vivent dans `docs/schemas/`, les bandeaux de section dans `docs/sections/`.

Chaque image porte un texte alternatif qui énumère son contenu. Une image ne se cherche pas dans la page et ne se lit pas à voix haute : le texte alternatif est ce qui compense.

Le dépôt [Template](https://github.com/Microcoaster/Template) contient le plan type d'un module, ses bandeaux en gris neutre et les consignes de rédaction.

## Problèmes courants

**Ma branche est en retard sur `develop`.**

```bash
git switch develop && git pull
git switch feature/ma-branche
git rebase develop
```

**J'ai commité sur `develop` par erreur.**

```bash
git switch -c feature/mon-sujet
git switch develop
git reset --hard origin/develop
```

La première commande sauve le travail sur une nouvelle branche avant que la seconde ne remette `develop` en place.

**J'ai poussé un secret.** Prévenez avant de corriger. Le réflexe est de réécrire l'historique, mais le seul geste qui compte est de révoquer la valeur exposée : elle a déjà été distribuée.

---

<sub>MicroCoaster · microcoaster.com</sub>
