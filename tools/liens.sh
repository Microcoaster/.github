#!/bin/bash
# Tuiles de liens. Ce qui était une carte « étiquette + valeur » large
# d'un tiers de page pour dire une adresse tient dans un carré : la
# marque se reconnaît avant d'être lue, et le lien porte le reste.
#
# Le gabarit est celui de skillicons.dev, relevé sur ses propres SVG :
# 256 de côté, coin arrondi à 60, fond de marque et logo blanc. C'est ce
# qui aligne ce bloc sur les rangées de stack du profil GitHub.
#
# Quatre façons de remplir une tuile :
#   pack   <slug>            la tuile skillicons telle quelle
#   marque <slug> <fond>     un logo Simple Icons, en blanc sur la marque
#   logo   <clé>             le logo MicroCoaster, pour le site lui-même
#   maison <clé> <glyphe>    une autre destination MicroCoaster
#
# Les destinations maison ne sont pas quatre dessins sans rapport : elles
# reprennent le cadre carré du logo, qui est sa signature, et n'en
# changent que le contenu. Le site garde la boucle, l'application des
# curseurs, la documentation un livre, le forum une bulle. Vues côte à
# côte, elles se lisent comme une famille.
#
# Les sources vivent dans tools/icones/, sk/ pour celles du pack.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; mkdir -p "$D/html" "$D/liens"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
I="$D/icones"

T=288   # rendu à 288, affiché à 72 : quatre fois, pour rester net

rendu () { # <clé> <corps html>
cat > "$D/html/l-$1.html" <<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
*{margin:0;padding:0}
html,body{width:${T}px;height:${T}px;overflow:hidden;background:transparent;line-height:0}
.t{width:${T}px;height:${T}px;border-radius:67px;position:relative;overflow:hidden;display:flex;align-items:center;justify-content:center}
</style></head><body>$2</body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=8000 \
  --default-background-color=00000000 \
  --screenshot="$B/liens/$1.png" --window-size=$T,$T "file:///$B/html/l-$1.html" >/dev/null 2>&1
echo "  $1.png"
}

# Un fichier du pack contient deux balises svg imbriquées, sur deux lignes
# différentes. Seule la première doit être redimensionnée : toucher la
# seconde replie la tuile à 75 pour cent, calée en haut à gauche, ce qui
# ne se voit qu'une fois la rangée montée.
pack () {
  rendu "$1" "$(sed -e '0,/<svg[^>]*>/s//<svg viewBox="0 0 256 256" width="'"$T"'" height="'"$T"'">/' "$I/sk/$1.svg")"
}

marque () {
  local corps
  corps=$(sed -e 's|<svg[^>]*>||' -e 's|</svg>||' -e 's|<title>[^<]*</title>||' "$I/$1.svg")
  rendu "$1" "<div class=\"t\" style=\"background:$2\"><svg viewBox=\"0 0 24 24\" width=\"196\" height=\"196\" fill=\"#FFFFFF\">$corps</svg></div>"
}

FOND='#242938'

# Le filtre qui détoure le logo, et la balise qui le pose.
#
# Le fichier est blanc sur un fond #1D1D1D opaque : il faut le détourer
# pour que la tuile transparaisse dessous. « mix-blend-mode: lighten »
# semblait fait pour ça, mais la capture se fait sur un canevas
# transparent : le mélange n'a pas de fond sur lequel s'appliquer et le
# carré sombre reste visible. Un filtre SVG travaille lui sur les pixels.
# feColorMatrix force le blanc et reprend le canal rouge comme alpha,
# feComponentTransfer écrase ensuite les valeurs basses, sans quoi le
# fond subsisterait à onze pour cent d'opacité.
DETOUR='<svg width="0" height="0" style="position:absolute"><filter id="detour" color-interpolation-filters="sRGB">
  <feColorMatrix type="matrix" values="0 0 0 0 1  0 0 0 0 1  0 0 0 0 1  1 0 0 0 0"/>
  <feComponentTransfer><feFuncA type="linear" slope="5" intercept="-0.9"/></feComponentTransfer>
</filter></svg>'

# Le logo, seul. Son encre occupe 62,5 pour cent du fichier : pour la
# poser à 185 sur une tuile de 288, l image se règle à 296, la taille
# qu elle garde sur les tuiles à pastille.
logo () {
  rendu "$1" "<div class=\"t\" style=\"background:$FOND\">$DETOUR
<img src=\"file:///$B/icones/microcoaster.png\" style=\"width:296px;height:296px;filter:url(#detour);position:absolute;left:-4px;top:-8px\"></div>"
}

# maison <clé> <glyphe> : le même logo, avec une pastille en bas à droite.
#
# Dessiner quatre cadres différents revenait à inventer quatre logos : la
# rangée perdait la marque. Ici le logo ne bouge pas, une seule chose
# change, et elle dit laquelle des destinations c'est. Le logo recule à
# 296 pour laisser la place, la pastille est un disque blanc cerné de la
# couleur de la tuile, et son glyphe est évidé dans ce même ton.
#
# Le glyphe s'écrit dans un repère de 24 centré sur la pastille : il est
# translaté de 178 et mis à l échelle 3, soit un champ utile de 72 px sur
# une pastille de 108.
maison () {
  rendu "$1" "<div class=\"t\" style=\"background:$FOND\">$DETOUR
<img src=\"file:///$B/icones/microcoaster.png\" style=\"width:296px;height:296px;filter:url(#detour);position:absolute;left:-4px;top:-8px\">
<svg viewBox=\"0 0 288 288\" width=\"288\" height=\"288\" style=\"position:absolute;left:0;top:0\">
  <circle cx=\"214\" cy=\"214\" r=\"66\" fill=\"$FOND\"/>
  <circle cx=\"214\" cy=\"214\" r=\"54\" fill=\"#FFFFFF\"/>
  <g transform=\"translate(178 178) scale(3)\" fill=\"none\" stroke=\"$FOND\" stroke-width=\"1.35\" stroke-linecap=\"round\" stroke-linejoin=\"round\">$2</g>
</svg></div>"
}

# adresse <clé> <texte> : la pastille en clair qui suit la rangée, pour
# que l'adresse reste copiable à l'œil et pas seulement cliquable.
adresse () {
cat > "$D/html/l-$1.html" <<HTML
<!doctype html><html lang="fr"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:760px;height:96px;overflow:hidden;background:transparent}
.w{width:760px;height:96px;display:flex;align-items:center;justify-content:center}
.p{height:72px;display:flex;align-items:center;gap:16px;padding:0 30px;
   border-radius:36px;background:#131A24;border:1px solid #23303D}
.p span{font-family:'JetBrains Mono',monospace;font-size:26px;letter-spacing:.2px;color:#D7E0EA}
</style></head><body><div class="w"><div class="p">
<svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#E4E8ED" stroke-width="1.7">
  <circle cx="12" cy="12" r="8.6"/><ellipse cx="12" cy="12" rx="3.7" ry="8.6"/>
  <path d="M3.9 9.2h16.2M3.9 14.8h16.2"/></svg>
<span>$2</span>
</div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
  --force-device-scale-factor=2 --default-background-color=00000000 \
  --screenshot="$B/liens/$1.png" --window-size=760,96 "file:///$B/html/l-$1.html" >/dev/null 2>&1
echo "  $1.png  à afficher sur 380 px"
}
