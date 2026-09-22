#!/bin/bash
# Le pied de page de la page de profil.
# passe en bas et le logo revient au centre. La page se ferme au lieu de
# s'arrêter.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/profil$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"
LOGO="file:///C:/Users/trist/Documents/Github/Microcoaster/images/logo.png"

cat > "$D/html$SUF/p-orgfooter.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:250px;overflow:hidden;background:#131313}
.w{width:1280px;height:250px;position:relative;overflow:hidden;
   background:radial-gradient(70% 150% at 50% 100%, #FFFFFF10 0%, transparent 62%),
              linear-gradient(180deg,#0F0F0F 0%,#141414 58%,#0B0B0B 100%)}
.grid{position:absolute;inset:0;opacity:.30;
  background-image:linear-gradient(#FFFFFF0C 1px,transparent 1px),linear-gradient(90deg,#FFFFFF0C 1px,transparent 1px);
  background-size:48px 48px;-webkit-mask-image:radial-gradient(80% 120% at 50% 100%,#000 0%,transparent 76%)}

/* Filet supérieur : la bannière du haut porte le sien en bas, celui-ci
   ferme la page par le mouvement inverse. */
.top{position:absolute;left:0;right:0;top:0;height:3px;
  background:linear-gradient(90deg,transparent 0%,#FFFFFF2E 14%,#F5F5F5 50%,#FFFFFF2E 86%,transparent 100%)}

.in{position:absolute;inset:0;display:flex;flex-direction:column;align-items:center;
    justify-content:center;gap:16px}
.brand{display:flex;align-items:center;gap:20px}
.logo{width:62px;height:62px;border-radius:15px;overflow:hidden;flex-shrink:0;
  box-shadow:0 8px 26px rgba(0,0,0,.55),0 0 0 1px rgba(255,255,255,.10)}
.logo img{width:100%;height:100%;object-fit:cover}
.wm{display:flex;flex-direction:column;gap:5px}
h2{font-family:Syne,sans-serif;font-weight:800;font-size:34px;line-height:1;letter-spacing:-.5px;
   color:#FAFAFA}
h2 sup{font-size:13px;vertical-align:baseline;position:relative;top:-14px;color:#8A8A8A;font-weight:700;margin-left:2px}
.tag{font-family:'Space Grotesk',sans-serif;font-size:16px;color:#9A9A9A;letter-spacing:.2px}

.meta{display:flex;align-items:center;gap:14px;margin-top:2px}
.meta a,.meta span{font-family:'JetBrains Mono',monospace;font-size:11.5px;letter-spacing:1.8px;
  color:#7A7A7A;text-decoration:none}
.meta i{width:3px;height:3px;border-radius:50%;background:#3C3C3C;display:block}
</style></head><body>
<div class="w"><div class="grid"></div><div class="top"></div>
<div class="in">
  <div class="brand">
    <div class="logo"><img src="$LOGO" alt=""></div>
    <div class="wm">
      <h2>MicroCoaster<sup>™</sup></h2>
      <div class="tag">$(t 'Des heures infinies de fun' 'Endless hours of fun')</div>
    </div>
  </div>
  <div class="meta">
    <span>MICROCOASTER.COM</span><i></i>
    <span>$(t 'ÉCHELLE 1:78' 'SCALE 1:78')</span><i></i>
    <span>$(t 'CONÇU EN AUTRICHE' 'DESIGNED IN AUSTRIA')</span>
  </div>
</div></div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=12000 --force-device-scale-factor=3 \
  --screenshot="$B/profil$SUF/orgfooter.png" --window-size=1280,250 "file:///$B/html$SUF/p-orgfooter.html" >/dev/null 2>&1
echo "  orgfooter.png"
