#!/bin/bash
# Repose les images de la page de profil de l'organisation, celle que
# GitHub affiche sur github.com/Microcoaster.
#
# LANGUE=fr (défaut) pose dans profile/img/, LANGUE=en dans profile/img/en/.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
source "$D/langue.sh"
DEST="../profile/img"; [ "$LG" = en ] && DEST="../profile/img/en"
mkdir -p "$DEST/sections" "$DEST/schemas"
n=0
pose () { [ -f "$1" ] || { echo "  manquant : $1"; return; }; mkdir -p "$(dirname "$DEST/$2")"; cp "$1" "$DEST/$2"; n=$((n+1)); }

pose "png$SUF/o-org.png" banniere.png
for i in 01 02 03 04 05; do pose "sec$SUF/r-org-$i.png" "sections/s$i.png"; done
pose "flow$SUF/org-cycle.png"    schemas/cycle.png
pose "flow$SUF/org-branches.png" schemas/branches.png
pose "profil$SUF/orgfooter.png"  cloture.png

# Les cartes des dépôts sont les bannières des modules, déjà rendues.
pose "png$SUF/o-webapp.png"      webapp.png
pose "png$SUF/o-wifimanager.png" wifimanager.png
pose "png$SUF/o-switchtrack.png" switchtrack.png
pose "png$SUF/o-launch.png"      launch.png
pose "png$SUF/o-lift.png"        lift.png
pose "png$SUF/o-audio.png"       audio.png
pose "png$SUF/o-smoke.png"       smoke.png
pose "png$SUF/o-led.png"         led.png
pose "png$SUF/o-bot.png"         bot.png
pose "png$SUF/o-guess.png"       guess.png
pose "png$SUF/f-docs.png"        docs.png
pose "png$SUF/f-forum.png"       forum.png

# Les tuiles de lien et les pastilles de langue ne portent aucun texte
# traduisible : les deux pages pointent sur les mêmes fichiers.
if [ "$LG" != en ]; then
  mkdir -p "../profile/img/langues"
  for k in fr-on fr-off en-on en-off; do
    [ -f "langues/$k.png" ] && { cp "langues/$k.png" "../profile/img/langues/$k.png"; n=$((n+1)); }
  done
fi

echo "  $n images posées dans ${DEST#../}"
