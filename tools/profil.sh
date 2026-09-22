#!/bin/bash
# La page de profil de l'organisation : sa bannière, ses cinq bandeaux de
# section, le cycle de contribution, le graphe des branches et le pied de
# page. GitHub n'affiche que profile/README.md, donc la version anglaise
# n'est atteignable que par la pastille de langue.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
source "$D/sections.sh" >/dev/null 2>&1
mkdir -p "$D/png$SUF" "$D/profil$SUF"

A="#E4E8ED"

# ------------------------------------------------ les bandeaux de section
rep org "$A" \
"$(t "L'application" 'The application')" \
"$(t 'Les modules' 'The modules')" \
"$(t 'Autour du produit' 'Around the product')" \
"$(t 'Travailler ici' 'Working here')" \
"$(t 'Nous suivre' 'Following us')"

# ------------------------------------------------------------ la bannière
P1="$(t 'Kits de montagnes russes miniatures, modulaires et connectés.' 'Modular, connected miniature roller coaster kits.')"
P2="$(t 'Échelle 1:78, modules ESP32, pilotage depuis une application web.' 'Scale 1:78, ESP32 modules, driven from a web application.')"
PL="$(t 'MODULAIRE' 'MODULAR')"

cat > "$D/html$SUF/o-org.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:360px;overflow:hidden;background:#111}
.w{width:1280px;height:360px;position:relative;overflow:hidden;
 background:radial-gradient(64% 140% at 12% 0%,#2A2A2A 0%,#141414 56%,#0A0A0A 100%)}
.grid{position:absolute;inset:0;opacity:.38;
 background-image:linear-gradient(#FFFFFF0D 1px,transparent 1px),linear-gradient(90deg,#FFFFFF0D 1px,transparent 1px);
 background-size:52px 52px;-webkit-mask-image:radial-gradient(76% 110% at 10% 50%,#000 0%,transparent 76%)}
.in{position:absolute;inset:0;display:flex;align-items:center;gap:56px;padding:0 72px}
.lg{width:168px;height:168px;flex-shrink:0;object-fit:cover;border-radius:34px;
 border:1px solid rgba(255,255,255,.16);box-shadow:0 16px 44px rgba(0,0,0,.6)}
.tx{display:flex;flex-direction:column;gap:14px}
h1{font-family:Syne,sans-serif;font-weight:800;font-size:60px;line-height:1;letter-spacing:-1px;color:#FFF}
h1 sup{font-size:24px;vertical-align:super}
p{font-family:'Space Grotesk',sans-serif;font-size:20px;line-height:1.45;color:#A6A6A6;max-width:820px}
.pl{display:flex;gap:9px;margin-top:6px}
.pl span{font-family:'JetBrains Mono',monospace;font-size:12px;letter-spacing:2px;color:#CFCFCF;
 border:1px solid #333;background:#1A1A1A;border-radius:5px;padding:7px 13px}
.ln{position:absolute;left:0;right:0;bottom:0;height:4px;background:linear-gradient(90deg,#FFF 0%,#6E6E6E 44%,transparent 92%)}
</style></head><body>
<div class="w"><div class="grid"></div><div class="in">
<img class="lg" src="file:///C:/Users/trist/Documents/Github/Microcoaster/images/logo.png">
<div class="tx"><h1>MicroCoaster<sup>™</sup></h1>
<p>$P1<br>$P2</p>
<div class="pl"><span>ESP32</span><span>NODE.JS</span><span>WEBSOCKET</span><span>$PL</span></div></div>
</div><div class="ln"></div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=11000 --force-device-scale-factor=2 \
  --screenshot="$B/png$SUF/o-org.png" --window-size=1280,360 "file:///$B/html$SUF/o-org.html" >/dev/null 2>&1
echo "  o-org.png"
