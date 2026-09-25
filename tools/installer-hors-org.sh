#!/bin/bash
# Repose les figures des trois dépôts qui ne sont pas clonés sous org/ :
# le bot de support et les deux pages d'attente.
#
# LANGUE=fr (défaut) pose dans docs/, LANGUE=en dans docs/en/.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; cd "$D"
source "$D/langue.sh"
G="$(cd "$D/../../.." && pwd)"
n=0; absents=""

pose () {
  local repo="$G/$1" src="$2" dst="$3" dest
  [ -d "$repo" ] || { case "$absents" in *"$1"*) ;; *) absents="$absents $1";; esac; return; }
  dest="$repo/docs"; [ "$LG" = en ] && dest="$repo/docs/en"
  [ -f "$src" ] || { echo "  manquant : $src"; return; }
  mkdir -p "$(dirname "$dest/$dst")"; cp "$src" "$dest/$dst"; n=$((n+1))
}
sections () { local i; for i in $(seq 1 "$3"); do i=$(printf %02d "$i"); pose "$1" "sec$SUF/r-$2-$i.png" "sections/s$i.png"; done; }

# ------------------------------------------------------ bot de support
pose Microcoaster-bot-org "png$SUF/o-bot.png" banniere.png
sections Microcoaster-bot-org bot 5
pose Microcoaster-bot-org "flow$SUF/bot-garantie.png" schemas/garantie.png
pose Microcoaster-bot-org "grid$SUF/bot-cmd.png"      schemas/commandes.png
pose Microcoaster-bot-org "grid$SUF/bot-env.png"      schemas/environnement.png
pose Microcoaster-bot-org "grid$SUF/bot-db.png"       schemas/donnees.png
pose Microcoaster-bot-org "flow$SUF/bot-setup.png"    schemas/mise-en-route.png
pose Microcoaster-bot-org "tree$SUF/bot.png"          schemas/arborescence.png

# ---------------------------------------------------------------- Docs
pose MicroCoaster_Docs "png$SUF/f-docs.png" banniere.png
sections MicroCoaster_Docs docs 4
pose MicroCoaster_Docs "grid$SUF/docs-contenu.png" schemas/contenu.png

# --------------------------------------------------------------- Forum
pose MicroCoaster_Forum "png$SUF/f-forum.png" banniere.png
sections MicroCoaster_Forum forum 5
pose MicroCoaster_Forum "grid$SUF/forum-contenu.png" schemas/contenu.png

if [ "$LG" != en ]; then
  for r in Microcoaster-bot-org MicroCoaster_Docs MicroCoaster_Forum; do
    for k in fr-on fr-off en-on en-off; do pose "$r" "langues/$r/$k.png" "langues/$k.png"; done
  done
fi

echo "  $n images posées"
[ -n "$absents" ] && echo "  dépôts non clonés ici, ignorés :$absents"
