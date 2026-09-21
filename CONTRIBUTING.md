<div align="center">

<img src="profile/img/banniere.png" alt="MicroCoaster" width="100%">

</div>

# Contribuer chez MicroCoaster

Ce guide vaut pour tous les dépôts de l'organisation, firmwares comme applications. Il tient en une idée : **rien n'arrive sur `main` sans être passé sous un autre regard.**

<img src="img/sections/c01.png" alt="01 Avant d'écrire" width="100%">

**Ouvrez une issue.** Même pour une correction d'une ligne. Une issue coûte trente secondes et répond à trois questions qui reviennent toujours six mois plus tard : qu'est-ce qu'on voulait faire, pourquoi, et qui en a décidé ainsi.

Étiquetez-la `bug`, `fonctionnalité` ou `documentation`. Si la réponse n'est pas évidente, c'est souvent que l'issue mélange deux sujets.

<img src="img/sections/c02.png" alt="02 Une branche par sujet" width="100%">

<img src="img/blocs/01.png" alt="Terminal bash : partir de develop" width="100%">

```bash
git switch develop
git pull
git switch -c feature/pilotage-fumee
```

<img src="img/schemas/branches-prefixes.png" alt="Préfixe feature, depuis develop : une fonctionnalité nouvelle. Préfixe bugfix, depuis develop : une correction sans urgence. Préfixe hotfix, depuis main : un correctif urgent, le seul cas où l'on ne part pas de develop." width="100%">

La suite du nom décrit le sujet en kebab-case. `feature/pilotage-fumee`, pas `feature/tristan-2` ni `feature/fix`.

<img src="img/sections/c03.png" alt="03 Des commits qui se relisent" width="100%">

Le format est `type: description`, en français, à l'infinitif ou au présent.

<img src="img/blocs/02.png" alt="Messages de commit : format attendu" width="100%">

```
feat: ajout du contrôle de la machine à fumée
fix: correction de la reconnexion après coupure WiFi
docs: schéma de brochage du Launch Track
```

<img src="img/schemas/commits.png" alt="feat : une fonctionnalité nouvelle. fix : une correction de comportement. docs : de la documentation, des schémas, un README. refactor : du code déplacé ou réécrit, sans changement de comportement. test : de la couverture ajoutée. chore : de l'outillage, des dépendances, de la configuration." width="100%">

Un commit fait une chose. S'il faut écrire « et » dans le message, il y a probablement deux commits.

<img src="img/sections/c04.png" alt="04 La pull request" width="100%">

Elle revient sur `develop`, décrit ce qui change et pourquoi, et renvoie vers l'issue avec `Closes #12`.

<img src="img/schemas/avant-la-pr.png" alt="Le projet démarre : il compile, ou il se lance, sur une copie propre du dépôt. Les tests passent en local, avant d'ouvrir la pull request et pas après. Rien de secret dans le diff : aucun identifiant, aucun jeton, aucun fichier .env. Rien de généré : les dépendances et les sorties de build ne sont pas versionnées." width="100%">

La review n'est pas une formalité. Attendez-vous à des questions, et posez-en.

<img src="img/sections/c05.png" alt="05 Non négociable" width="100%">

<img src="img/schemas/non-negociable.png" alt="Pas de push direct, ni sur main ni sur develop, sans exception. Review obligatoire avant toute fusion, ce n'est pas une formalité. Historique propre : reprenez votre branche plutôt que d'empiler des commits fix du fix. Aucun secret dans le dépôt : un identifiant poussé par erreur est un identifiant à révoquer, pas à effacer du dernier commit." width="100%">

<img src="img/sections/c06.png" alt="06 Documentation" width="100%">

Chaque dépôt porte son README, et la règle y est la même partout : ce qui a un ordre devient une séquence, ce qui n'en a pas devient une grille, un brochage devient un schéma de carte, une hiérarchie de fichiers devient une arborescence. **Aucun tableau Markdown ne subsiste dans l'organisation.**

Chaque image porte un texte alternatif qui énumère son contenu. Une image ne se cherche pas dans la page et ne se lit pas à voix haute : le texte alternatif est ce qui compense, et c'est le prix à payer pour avoir remplacé les tableaux.

<img src="img/schemas/arborescence.png" alt="Arborescence du dépôt .github. CONTRIBUTING.md : le guide de contribution, repris par GitHub comme guide par défaut de tous les dépôts de l'organisation. LICENCE : la licence commune. profile : la page d'accueil publique, avec son README affiché sur github.com/Microcoaster et son dossier img qui contient bannières, bandeaux, schémas et cartes de lien. tools : les générateurs des figures, sections.sh pour les bandeaux, pinout.sh pour les brochages, seq.sh pour les séquences, grid.sh pour les grilles et tree.sh pour les arborescences." width="100%">

Les figures vivent dans `docs/schemas/` du dépôt concerné, les bandeaux de section dans `docs/sections/`. Les générateurs sont dans [`tools/`](tools/), avec leur mode d'emploi. Le dépôt [Template](https://github.com/Microcoaster/Template) contient le plan type d'un module.

<img src="img/sections/c07.png" alt="07 Problèmes courants" width="100%">

<img src="img/schemas/problemes.png" alt="Ma branche est en retard : git switch develop puis git pull, et git rebase develop depuis votre branche. J'ai commité sur develop : git switch -c feature/mon-sujet sauve le travail, puis git reset --hard origin/develop remet develop en place. J'ai poussé un secret : prévenez avant de corriger, le seul geste qui compte est de révoquer la valeur exposée, elle a déjà été distribuée." width="100%">

Pour le premier cas, dans l'ordre :

<img src="img/blocs/03.png" alt="Terminal bash : rattraper une branche en retard" width="100%">

```bash
git switch develop && git pull
git switch feature/ma-branche
git rebase develop
```

Pour le second, la première commande sauve le travail sur une nouvelle branche **avant** que la seconde ne remette `develop` en place. Dans l'autre ordre, le travail est perdu.

<img src="img/blocs/04.png" alt="Terminal bash : sauver un travail commité sur develop" width="100%">

```bash
git switch -c feature/mon-sujet
git switch develop
git reset --hard origin/develop
```

---

<div align="center">

<img src="profile/img/cloture.png" alt="MicroCoaster, des heures infinies de fun. microcoaster.com, échelle 1:78, conçu en Autriche." width="100%">

</div>
