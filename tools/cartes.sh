#!/bin/bash
# Le gabarit des bannières de dépôt, 1280x320, rendues à 3x.
#
# ban <clé> <accent> <glyphe> <titre> <ligne 1> <ligne 2> <pastilles> <cartouche>
#
# Le cartouche dit la catégorie du dépôt, précédée de BOT quand le dépôt
# en est un. Le titre porte son accent dans <em>.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/png$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

ban () {
cat > "$D/html$SUF/o-$1.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:320px;overflow:hidden;background:#131313}
.w{width:1280px;height:320px;position:relative;overflow:hidden;
   background:radial-gradient(60% 135% at 11% 0%, ${2}1E 0%, transparent 60%),
              linear-gradient(120deg,#1A1A1A 0%,#131313 58%,#0C0C0C 100%)}
.grid{position:absolute;inset:0;opacity:.34;
  background-image:linear-gradient(#FFFFFF0C 1px,transparent 1px),linear-gradient(90deg,#FFFFFF0C 1px,transparent 1px);
  background-size:48px 48px;-webkit-mask-image:radial-gradient(72% 100% at 8% 50%,#000 0%,transparent 74%)}
.cat{position:absolute;top:26px;right:30px;font-family:'JetBrains Mono',monospace;font-size:12px;
  letter-spacing:2.2px;color:${2}E0;border:1px solid ${2}48;background:${2}12;border-radius:5px;padding:7px 13px}
.in{position:absolute;inset:0;display:flex;align-items:center;gap:50px;padding:0 66px}
.gl{width:144px;height:144px;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    filter:drop-shadow(0 0 28px ${2}60)}
.tx{display:flex;flex-direction:column;gap:12px}
.org{font-family:'JetBrains Mono',monospace;font-size:12px;letter-spacing:3px;color:#7A7A7A}
h1{font-family:Syne,sans-serif;font-weight:800;font-size:50px;line-height:1;letter-spacing:-0.5px;color:#FAFAFA}
h1 em{font-style:normal;color:$2}
p{font-family:'Space Grotesk',sans-serif;font-size:18.5px;line-height:1.45;color:#9A9A9A;max-width:800px}
.pl{display:flex;gap:8px;margin-top:4px}
.pl span{font-family:'Space Grotesk',sans-serif;font-size:12px;font-weight:500;letter-spacing:.7px;
  color:${2}D0;border:1px solid ${2}3A;background:${2}0E;border-radius:6px;padding:6px 11px}
.ln{position:absolute;left:0;right:0;bottom:0;height:3px;background:linear-gradient(90deg,$2 0%,#FFFFFF55 46%,transparent 92%)}
</style></head><body>
<div class="w"><div class="grid"></div><div class="cat">$8</div>
<div class="in"><div class="gl">$3</div>
<div class="tx"><div class="org">MICROCOASTER™</div><h1>$4</h1><p>$5<br>$6</p><div class="pl">$7</div></div></div>
<div class="ln"></div></div></body></html>
HTML
# ECHELLE vaut 2 pour la première série de bannières, 3 pour celles qui ont
# été refaites ensuite. Les deux coexistent dans les dépôts, et le rendu
# doit les reproduire telles qu'elles y sont publiées.
E="${ECHELLE:-2}"; VT=10000; [ "$E" = 3 ] && VT=12000
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=$VT --force-device-scale-factor=$E \
  --screenshot="$B/png$SUF/o-$1.png" --window-size=1280,320 "file:///$B/html$SUF/o-$1.html" >/dev/null 2>&1
echo "  o-$1.png"
}
P () { for x in "$@"; do printf '<span>%s</span>' "$x"; done; }

P () { for x in "$@"; do printf '<span>%s</span>' "$x"; done; }
