#!/bin/bash
# Le câblage de la machine à fumée. Ce n'est pas un brochage au sens des
# autres modules : la carte ne fournit aucune puissance, elle commande un
# MOSFET qui commute le courant réel. La figure le montre en trois blocs.
# l'ensemble, et un schéma la montre mieux qu'un tableau de broches.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/pin$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

cat > "$D/html$SUF/p-smoke.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:306px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:306px;background:#0D1117;position:relative}
.b{position:absolute;top:40px;width:323px;height:130px;
   background:linear-gradient(160deg,#18202B 0%,#121922 100%);
   border:1px solid #2A3644;border-radius:13px;
   display:flex;flex-direction:column;align-items:center;justify-content:center;gap:7px;
   padding:0 20px;text-align:center;overflow:hidden}
.b::before{content:"";position:absolute;inset:0;opacity:.5;
  background-image:linear-gradient(#C9CDD20A 1px,transparent 1px),linear-gradient(90deg,#C9CDD20A 1px,transparent 1px);
  background-size:22px 22px}
.b h4{position:relative;font-family:'JetBrains Mono',monospace;font-weight:500;font-size:17px;
  letter-spacing:2px;color:#DDE4EC;text-transform:uppercase;line-height:1.5}
.b p{position:relative;font-family:'Space Grotesk',sans-serif;font-size:13px;line-height:1.4;color:#8593A3}
.lk{position:absolute;width:100px;text-align:center;font-family:'JetBrains Mono',monospace;
    font-size:11px;letter-spacing:.8px;color:#C9CDD2}
.sub{color:#5E6B7B;font-size:10px;letter-spacing:1.2px}
svg{position:absolute;inset:0;pointer-events:none}
.gnd{font-family:'JetBrains Mono',monospace;font-size:11px;letter-spacing:1.6px;fill:#5E6B7B}
</style></head><body><div class="w">

<div class="b" style="left:56px"><h4>ESP32<br>DevKit</h4><p>$(t 'Décide de la durée, ne fournit aucune puissance' 'Decides the duration, supplies no power at all')</p></div>
<div class="b" style="left:479px"><h4>MOSFET<br>$(t 'canal N' 'N-channel')</h4><p>$(t 'Commute le courant réel de la machine' 'Switches the machine&#39;s actual current')</p></div>
<div class="b" style="left:901px"><h4>$(t 'Machine<br>à fumée' 'Smoke<br>machine')</h4><p>$(t 'Résistance chauffante et ventilateur intégrés' 'Heating element and fan, both built in')</p></div>

<div class="lk" style="left:379px;top:72px">GPIO 18<br><span class="sub">$(t 'GRILLE' 'GATE')</span></div>
<div class="lk" style="left:801px;top:72px">DRAIN<br><span class="sub">$(t 'BORNE NÉGATIVE' 'NEGATIVE TERMINAL')</span></div>

<svg viewBox="0 0 1280 306">
  <g stroke="#3A4654" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M379 120h100M474 115l5 5-5 5"/>
    <path d="M801 120h100M896 115l5 5-5 5"/>
    <path d="M217 170v62h824v-62"/>
    <path d="M640 232v-62"/>
  </g>
  <g fill="#3A4654"><circle cx="217" cy="232" r="3.5"/><circle cx="640" cy="232" r="3.5"/><circle cx="1041" cy="232" r="3.5"/></g>
  <text class="gnd" x="640" y="264" text-anchor="middle">$(t 'MASSE COMMUNE · SANS ELLE LA GRILLE N’A PAS DE RÉFÉRENCE' 'COMMON GROUND · WITHOUT IT THE GATE HAS NO REFERENCE')</text>
</svg>
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=11000 --force-device-scale-factor=2 \
  --screenshot="$B/pin$SUF/smoke.png" --window-size=1280,306 "file:///$B/html$SUF/p-smoke.html" >/dev/null 2>&1
echo "  smoke.png"
