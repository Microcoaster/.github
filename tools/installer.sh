#!/bin/bash
# Repose les figures rendues dans le dépôt de chaque module.
#
# LANGUE=fr (défaut) pose dans docs/ du module, LANGUE=en dans docs/en/.
# Les dépôts sont cherchés à côté de celui-ci : c'est ainsi que les clones
# sont rangés, un dossier par dépôt de l'organisation.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
source "$D/langue.sh"
ORG="$(cd "$D/../.." && pwd)"
n=0; absents=""

# pose <dépôt> <fichier rendu> <chemin sous docs/>
pose () {
  local repo="$ORG/$1" src="$2" dst="$3" dest
  [ -d "$repo" ] || { case "$absents" in *"$1"*) ;; *) absents="$absents $1";; esac; return; }
  dest="$repo/docs"; [ "$LG" = en ] && dest="$repo/docs/en"
  [ -f "$src" ] || { echo "  manquant : $src"; return; }
  mkdir -p "$(dirname "$dest/$dst")"
  cp "$src" "$dest/$dst"; n=$((n+1))
}

# sections <dépôt> <clé> <nombre>
sections () {
  local i
  for i in $(seq 1 "$3"); do i=$(printf %02d "$i"); pose "$1" "sec$SUF/r-$2-$i.png" "sections/s$i.png"; done
}

# ------------------------------------------------------------- Switch Track
pose Switch-Track "png$SUF/o-switchtrack.png" banniere.png
sections Switch-Track switchtrack 5
pose Switch-Track "flow$SUF/st-principe.png" schemas/principe.png
pose Switch-Track "pin$SUF/switchtrack.png" schemas/brochage.png
pose Switch-Track "grid$SUF/st-cmd.png"     schemas/commandes.png

# ---------------------------------------------------------------- Banc LED
pose ESP-32-led "png$SUF/o-led.png" banniere.png
sections ESP-32-led led 5
pose ESP-32-led "pin$SUF/led.png"      schemas/brochage.png
pose ESP-32-led "grid$SUF/led-cmd.png" schemas/commandes.png

# ------------------------------------------------------------ Module Audio
pose Module-Audio "png$SUF/o-audio.png" banniere.png
sections Module-Audio audio 5
pose Module-Audio "flow$SUF/au-principe.png" schemas/principe.png
pose Module-Audio "pin$SUF/audio.png"        schemas/brochage.png

# --------------------------------------------------------- GuessTheCoaster
pose GuessTheCoaster "png$SUF/o-guess.png" banniere.png
sections GuessTheCoaster guess 5
pose GuessTheCoaster "flow$SUF/guess-modes.png" schemas/modes.png
pose GuessTheCoaster "grid$SUF/gc-diff.png"     schemas/difficultes.png
pose GuessTheCoaster "grid$SUF/gc-cmd.png"      schemas/commandes.png
pose GuessTheCoaster "grid$SUF/gc-db.png"       schemas/donnees.png

# ------------------------------------------------------------ Launch Track
pose Launch-Track "png$SUF/o-launch.png" banniere.png
sections Launch-Track launch 6
pose Launch-Track "flow$SUF/launch-etats.png" schemas/etats.png
pose Launch-Track "pin$SUF/launch.png"        schemas/brochage.png
pose Launch-Track "grid$SUF/launch-cfg.png"   schemas/reglages.png

# --------------------------------------------------------------- Lift Hill
pose Lift-Hill "png$SUF/o-lift.png" banniere.png
sections Lift-Hill lift 6
pose Lift-Hill "flow$SUF/lift-etats.png" schemas/etats.png
pose Lift-Hill "pin$SUF/lift.png"        schemas/brochage.png
pose Lift-Hill "grid$SUF/lift-cfg.png"   schemas/reglages.png

# ----------------------------------------------------------- Smoke Machine
pose Smoke-Machine "png$SUF/o-smoke.png" banniere.png
sections Smoke-Machine smoke 6
pose Smoke-Machine "flow$SUF/smoke-etats.png" schemas/etats.png
pose Smoke-Machine "pin$SUF/smoke.png"        schemas/cablage.png

# ------------------------------------------------------------ WiFi Manager
pose MicroCoaster_WifiManager "png$SUF/o-wifimanager.png" banniere.png
sections MicroCoaster_WifiManager wifimanager 5
pose MicroCoaster_WifiManager "flow$SUF/wm-principe.png" schemas/principe.png
pose MicroCoaster_WifiManager "grid$SUF/wm-btn.png"      schemas/bouton.png
pose MicroCoaster_WifiManager "grid$SUF/wm-cfg.png"      schemas/reglages.png

# ----------------------------------------------------------------- WebApp
pose MicroCoasterWebApp "png$SUF/o-webapp.png" banniere.png
sections MicroCoasterWebApp webapp 5
pose MicroCoasterWebApp "flow$SUF/webapp-arch.png" schemas/architecture.png
pose MicroCoasterWebApp "tree$SUF/webapp.png"      schemas/arborescence.png

# ---------------------------------------------------------------- Template
pose Template "png$SUF/o-template.png" banniere.png
sections Template template 6

# Les pastilles de langue ne dépendent pas de la langue : les deux pages
# d'un dépôt pointent sur les mêmes fichiers.
if [ "$LG" != en ]; then
  for r in Switch-Track ESP-32-led Module-Audio GuessTheCoaster Launch-Track \
           Lift-Hill Smoke-Machine MicroCoaster_WifiManager MicroCoasterWebApp Template; do
    for k in fr-on fr-off en-on en-off; do pose "$r" "langues/$k.png" "langues/$k.png"; done
  done
fi

echo "  $n images posées"
[ -n "$absents" ] && echo "  dépôts non clonés ici, ignorés :$absents"
