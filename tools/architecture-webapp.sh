#!/bin/bash
# L'architecture de la WebApp : les navigateurs d'un côté, les modules
# ESP32 de l'autre, et le serveur au milieu, seul à connaître l'état
# complet du circuit. Les deux liaisons n'ont ni le même protocole ni les
# mêmes garanties, et la figure le dit.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/flow$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

cat > "$D/html$SUF/f-webapp-arch.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400;500&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:330px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:330px;background:#0D1117;position:relative}

.col{position:absolute;top:48px;width:300px;height:212px;
     background:#131A24;border:1px solid #1F2833;border-radius:13px;
     padding:18px 20px;display:flex;flex-direction:column;gap:11px}
.core{left:490px;width:300px;
      background:linear-gradient(160deg,#18202B 0%,#121922 100%);border-color:#33455C;
      align-items:center;justify-content:center;text-align:center;gap:13px;overflow:hidden}
.core::before{content:"";position:absolute;inset:0;opacity:.55;
  background-image:linear-gradient(#5B8DEF0D 1px,transparent 1px),linear-gradient(90deg,#5B8DEF0D 1px,transparent 1px);
  background-size:24px 24px}
.core h3{position:relative;font-family:Syne,sans-serif;font-weight:800;font-size:21px;
  line-height:1.25;color:#EAF0F7}
.core p{position:relative;font-family:'Space Grotesk',sans-serif;font-size:13px;line-height:1.45;color:#8B97A6}
.core .st{position:relative;font-family:'JetBrains Mono',monospace;font-size:11px;letter-spacing:1.4px;color:#5B8DEF}

h4{font-family:'JetBrains Mono',monospace;font-size:11px;letter-spacing:1.8px;color:#5E6B7B;
   text-transform:uppercase;margin-bottom:2px}
.it{display:flex;align-items:flex-start;gap:10px}
.dot{width:6px;height:6px;border-radius:50%;background:#5B8DEF;flex-shrink:0;margin-top:6px}
.it span{font-family:'Space Grotesk',sans-serif;font-size:13.5px;line-height:1.4;color:#96A3B2}

.lnk{position:absolute;width:128px;text-align:center}
.lnk b{display:block;font-family:'JetBrains Mono',monospace;font-size:11.5px;letter-spacing:.8px;
       font-weight:500;color:#5B8DEF;margin-bottom:5px}
.lnk span{font-family:'Space Grotesk',sans-serif;font-size:11.5px;line-height:1.35;color:#6E7B8A;display:block}
svg{position:absolute;inset:0;pointer-events:none}
.ft{position:absolute;left:0;right:0;bottom:26px;text-align:center;
    font-family:'Space Grotesk',sans-serif;font-size:13px;color:#5E6B7B}
</style></head><body><div class="w">

<div class="col" style="left:56px">
  <h4>$(t 'Navigateurs' 'Browsers')</h4>
  <div class="it"><i class="dot"></i><span>$(t 'Découverte des modules connectés' 'Discovery of the connected modules')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Télémétrie en temps réel' 'Realtime telemetry')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Composition de séquences' 'Building sequences')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Comptes et notifications' 'Accounts and notifications')</span></div>
</div>

<div class="col core">
  <div class="st">$(t 'AUTORITÉ DU CIRCUIT' 'AUTHORITY OF THE LAYOUT')</div>
  <h3>MicroCoaster<br>WebApp</h3>
  <p>$(t 'Node.js, Express et MySQL.<br>Le seul à connaître l’état complet du circuit.' 'Node.js, Express and MySQL.<br>The only one that knows the full state of the layout.')</p>
</div>

<div class="col" style="right:56px">
  <h4>$(t 'Modules ESP32' 'ESP32 modules')</h4>
  <div class="it"><i class="dot"></i><span>$(t 'Switch Track, aiguillage' 'Switch Track, the points')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Launch Track et Lift Hill' 'Launch Track and Lift Hill')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Module Audio et Smoke Machine' 'Audio module and Smoke Machine')</span></div>
  <div class="it"><i class="dot"></i><span>$(t 'Simulateurs, pour travailler sans matériel' 'Simulators, to work without hardware')</span></div>
</div>

<div class="lnk" style="left:359px;top:56px">
  <b>SOCKET.IO</b>
  <span>$(t 'Reconnexion, repli sur long polling, salles par utilisateur' 'Reconnection, long-polling fallback, one room per user')</span>
</div>
<div class="lnk" style="left:793px;top:56px">
  <b>$(t 'WEBSOCKET NATIF' 'RAW WEBSOCKET')</b>
  <span>$(t 'Messages JSON courts, authentification à la connexion' 'Short JSON messages, authentication on connect')</span>
</div>

<svg viewBox="0 0 1280 330">
  <g stroke="#33455C" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M356 143h134M485 138l5 5-5 5"/>
    <path d="M356 163h134M361 158l-5 5 5 5"/>
    <path d="M790 143h134M919 138l5 5-5 5"/>
    <path d="M790 163h134M795 158l-5 5 5 5"/>
  </g>
</svg>

<div class="ft">$(t 'Un module n’engage jamais un mouvement de lui-même : il exécute un ordre venu du serveur.' 'A module never starts a movement of its own: it carries out an order that came from the server.')</div>
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=11000 --force-device-scale-factor=2 \
  --screenshot="$B/flow$SUF/webapp-arch.png" --window-size=1280,330 "file:///$B/html$SUF/f-webapp-arch.html" >/dev/null 2>&1
echo "  webapp-arch.png"
