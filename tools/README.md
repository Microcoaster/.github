# Générateurs de figures

Les READMEs de l'organisation ne contiennent aucun tableau Markdown. Ce qui serait un tableau est dessiné, et ces quatre scripts produisent les images. Ils tournent sous Git Bash et n'ont besoin que d'une chose : Chrome, qui sert de moteur de rendu.

```bash
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"   # si le chemin diffère
```

## Ce que produit chaque script

**`sections.sh`** dessine les bandeaux de section numérotés, ceux qui remplacent les titres `##`.

```bash
source tools/sections.sh
rep switchtrack "#FFAE42" "Principe" "Matériel" "Protocole" "Mise en service" "Écosystème"
```

Sortie dans `sec/`, un fichier par bandeau. Copiez-les dans `docs/sections/` du module, renommés `s01.png` et suivants.

**`pinout.sh`** dessine un brochage : la carte au centre, les broches de part et d'autre. Par convention les sorties sont à gauche et les entrées à droite.

```bash
source tools/pinout.sh
pinout lift "#4DD4FF" "ESP32<br>LIFT HILL" \
  "SORTIES · CE QUE LE MODULE COMMANDE" "ENTRÉES · CE QUE LE MODULE MESURE" \
  "25|Moteur, PWM|Vitesse de la chaîne" \
  -- \
  "34|Capteur Hall|Une impulsion par tour"
```

Chaque entrée s'écrit `GPIO|Nom|Rôle`, et `--` sépare la colonne de gauche de celle de droite.

**`seq.sh`** dessine une séquence : des étapes reliées par une flèche, quand il y a un ordre entre elles. Quatre cartes au maximum, au-delà c'est illisible.

```bash
source tools/seq.sh
seqfig st-principe "#FFAE42" \
  "Ordre reçu|Le serveur envoie <code>switch_left</code>." \
  "Vérin actionné|Le sens est imposé au DRV8871."
```

**`grid.sh`** dessine une grille de fiches, quand il n'y a pas d'ordre : commandes, réglages, variables d'environnement, tables.

```bash
source tools/grid.sh
grid lift-cfg "#4DD4FF" 2 \
  "RAMP_MS|Douceur du départ et de l'arrivée en crête." \
  "LIFT_TIMEOUT_MS|Durée maximale d'une montée avant défaut."
```

Le troisième argument est le nombre de colonnes. Une entrée peut porter un badge : `"NOM|BADGE|description"`.

## Comment choisir

Ce qui a un ordre devient une séquence. Ce qui n'en a pas devient une grille. Un brochage devient un schéma de carte. Une machine à états devient un graphe, écrit à la main, en reprenant les styles de `seq.sh`.

## Deux règles à ne pas perdre de vue

**L'accent vient de la bannière du module.** Switch Track en `#FFAE42`, Launch Track en `#FF4D4D`, Lift Hill en `#4DD4FF`, Module Audio en `#A78BFA`, Smoke Machine en `#C9CDD2`, Banc LED en `#2FD48A`, WiFi Manager en `#22D3EE`, WebApp en `#5B8DEF`, Guess The Coaster en `#5CE08A`, bot Discord en `#5865F2`. Un dépôt garde la même couleur de haut en bas.

**Chaque figure porte un texte alternatif qui énumère son contenu.** Une image ne se cherche pas dans la page et ne se lit pas à voix haute. Le texte alternatif est ce qui rend l'information accessible et retrouvable, et c'est le prix à payer pour avoir remplacé les tableaux.

## Détail d'implémentation

`grid.sh` et `seq.sh` appellent Chrome deux fois. La hauteur d'une figure dépend du repli des textes, qui n'est pas devinable à l'avance : la première passe laisse la page écrire sa hauteur réelle dans son `<title>`, que `--dump-dom` renvoie, la seconde prend la capture à cette hauteur exacte. C'est ce qui évite les marges mortes en bas et les contenus coupés.

Le rendu se fait à `--force-device-scale-factor=2`, sur une largeur de 1280 pixels, avec `--virtual-time-budget` pour laisser les polices se charger. Sans ce dernier, Chrome capture avant l'arrivée des webfonts et la figure sort dans une police de repli.

---

<sub>MicroCoaster · microcoaster.com</sub>
