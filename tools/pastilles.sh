#!/bin/bash
# Les deux pastilles de langue, en haut de chaque page.
#
# GitHub retire le JavaScript et le CSS des README : rien ne peut basculer
# la page sur place. Ce sont donc deux liens vers deux fichiers, dessinés
# pour se lire comme un sélecteur. La langue courante est allumée dans
# l'accent du dépôt, celui de sa bannière, l'autre éteinte, reprenant
# exactement le cartouche gris des cartes de projet, celui qui porte « PRIVÉ ».
#
# Les quatre images servent les deux pages : le français monte fr-on et
# en-off, l'anglais monte en-on et fr-off. Elles ne dépendent donc pas de
# LANGUE. Chaque dépôt a son jeu dans langues/<dépôt>/, que les installeurs
# reposent dans docs/langues/. langues/ seul prend le gris neutre de la
# page d'organisation, qui parle de l'organisation et pas d'un produit.
#
# Leur fond est opaque : GitHub rend les README sur blanc comme sur noir,
# et un sélecteur qui disparaît sur l'un des deux ne sert à rien.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/langues"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

W=300; H=96

# pastille <sortie sous langues/> <libellé> <allumee|eteinte> <accent>
# La pastille allumée se teinte comme le numéro des bandeaux de section :
# contour à 30 % de l'accent, fond à 11 %.
pastille () {
local pt ct bd fd ac="$4" h="lg-${1//\//-}"
if [ "$3" = allumee ]; then
  pt='<i></i>'; ct='#F0F4F8'
  bd="color-mix(in srgb,$ac 30%,#0D1117)"; fd="color-mix(in srgb,$ac 11%,#0D1117)"
else
  pt='';        ct='#7C8894'; bd='#2A333D'; fd='#0C1117'
fi
cat > "$D/html/$h.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:${W}px;height:${H}px;overflow:hidden;background:transparent}
.w{width:${W}px;height:${H}px;display:flex;align-items:center;justify-content:center}
.p{display:flex;align-items:center;gap:11px;height:54px;padding:0 26px;
   border-radius:9px;border:1.5px solid $bd;background:$fd}
.p b{font-family:'JetBrains Mono',monospace;font-weight:500;font-size:19px;
     letter-spacing:3.2px;color:$ct;white-space:nowrap}
/* Le point n'est là que sur la langue affichée : il dit « vous êtes ici »
   sans avoir à l'écrire, et laisse l'autre pastille lisible comme un lien. */
.p i{width:8px;height:8px;border-radius:2px;background:$ac;
     transform:rotate(45deg);flex-shrink:0}
</style></head><body><div class="w"><div class="p">$pt<b>$2</b></div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=3 --default-background-color=00000000 \
  --screenshot="$B/langues/$1.png" --window-size=$W,$H "file:///$B/html/$h.html" >/dev/null 2>&1
}

# jeu <dépôt, vide pour la page d'organisation> <accent>
jeu () {
  local d="${1:+$1/}"; mkdir -p "$D/langues/$d"
  pastille "${d}fr-on"  "FRANÇAIS" allumee "$2"
  pastille "${d}fr-off" "FRANÇAIS" eteinte "$2"
  pastille "${d}en-on"  "ENGLISH"  allumee "$2"
  pastille "${d}en-off" "ENGLISH"  eteinte "$2"
  echo "  langues/$d  $2"
}

# L'accent de chaque dépôt, le même que sa bannière et ses bandeaux.
jeu ""                        "#E4E8ED"
jeu Switch-Track              "#FFAE42"
jeu ESP-32-led                "#2FD48A"
jeu Module-Audio              "#A78BFA"
jeu GuessTheCoaster           "#5CE08A"
jeu Launch-Track              "#FF4D4D"
jeu Lift-Hill                 "#4DD4FF"
jeu Smoke-Machine             "#C9CDD2"
jeu MicroCoaster_WifiManager  "#22D3EE"
jeu MicroCoasterWebApp        "#5B8DEF"
jeu Template                  "#8A93A0"
jeu Microcoaster-bot-org      "#5865F2"
jeu MicroCoaster_Docs         "#60A5FA"
jeu MicroCoaster_Forum        "#F59E0B"
