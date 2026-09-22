#!/bin/bash
# Les machines à états des modules. Un bloc monospace se lit mal quand il
# décrit un cycle : on ne voit ni le sens de parcours, ni le retour au
# départ, ni ce qui sort du cycle nominal. La figure les montre.
#
# Les trois sont rendues ensemble : elles partagent leurs styles et leurs
# tracés de liaison, calculés en coordonnées absolues.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/flow$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

shot () {
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=12000 \
  --force-device-scale-factor=2 \
  --screenshot="$B/flow$SUF/$1.png" --window-size=1280,$2 "file:///$B/html$SUF/f-$1.html" >/dev/null 2>&1
echo "  $1.png"
}

# Styles communs aux machines à états. $1 = accent, $2 = hauteur.
sm_css () { cat <<CSS
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:${2}px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:${2}px;background:#0D1117;position:relative;padding:26px 56px}
.row{display:flex;gap:28px;align-items:stretch}
.st{flex:1;background:#131A24;border:1px solid #1F2833;border-radius:11px;
    padding:15px 16px;display:flex;flex-direction:column;gap:8px;min-height:112px}
.nm{font-family:'JetBrains Mono',monospace;font-size:13px;letter-spacing:1.6px;color:$1}
.st p{font-family:'Space Grotesk',sans-serif;font-size:13px;line-height:1.42;color:#8B97A6}
.ov{position:absolute;inset:0;pointer-events:none}
.flt{display:flex;align-items:center;gap:16px;background:#1A1318;border:1px solid #3A2228;
     border-radius:11px;padding:15px 18px}
.flt .nm{color:#E2725F;flex-shrink:0}
.flt p{font-family:'Space Grotesk',sans-serif;font-size:13.5px;color:#93848A}
.lbl{font-family:'JetBrains Mono',monospace;font-size:11px;letter-spacing:1.2px;fill:#4A5563}
CSS
}

# --------------------------------------------------------- Launch Track
cat > "$D/html$SUF/f-launch-etats.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
$(sm_css "#FF4D4D" 372)
.row{margin-bottom:62px}
</style></head><body><div class="w">
<div class="row">
  <div class="st"><div class="nm">HOMING</div><p>$(t 'Le taquet cherche sa position de repos au démarrage.' 'The catch car hunts for its rest position at start-up.')</p></div>
  <div class="st"><div class="nm">IDLE</div><p>$(t 'Taquet au repos, zone de lancement libre.' 'Catch car at rest, launch zone clear.')</p></div>
  <div class="st"><div class="nm">LOADED</div><p>$(t 'Train présent et accroché, en attente d’autorisation.' 'Train present and latched, waiting for clearance.')</p></div>
  <div class="st"><div class="nm">LAUNCHING</div><p>$(t 'Rampe d’accélération sur' 'Acceleration ramp over') <span style="font-family:'JetBrains Mono'">RAMP_UP_MS</span>.</p></div>
  <div class="st"><div class="nm">RELEASED</div><p>$(t 'Train parti, la courroie décélère.' 'Train gone, the belt slows down.')</p></div>
  <div class="st"><div class="nm">RETURNING</div><p>$(t 'Le taquet revient lentement jusqu’au capteur de repos.' 'The catch car creeps back to the rest sensor.')</p></div>
</div>
<div class="flt"><div class="nm">FAULT</div>
  <p>$(t 'Patinage détecté au codeur, taquet introuvable, ou délai de lancement dépassé. Accessible depuis n’importe quel état.' 'Slip detected at the encoder, catch car not found, or launch timeout exceeded. Reachable from any state.')</p></div>
<svg class="ov" viewBox="0 0 1280 372">
  <g stroke="#2F3A47" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M251 96h20M266 91l5 5-5 5"/><path d="M450 96h20M465 91l5 5-5 5"/>
    <path d="M649 96h20M664 91l5 5-5 5"/><path d="M848 96h20M863 91l5 5-5 5"/>
    <path d="M1047 96h20M1062 91l5 5-5 5"/>
    <path d="M1138 152v22H341v-16M336 163l5-6 5 6"/>
  </g>
  <text class="lbl" x="700" y="192" text-anchor="middle">$(t 'CYCLE COMPLET' 'FULL CYCLE')</text>
</svg>
</div></body></html>
HTML
shot launch-etats 372

# ------------------------------------------------------------ Lift Hill
cat > "$D/html$SUF/f-lift-etats.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
$(sm_css "#4DD4FF" 320)
.row{margin-bottom:56px}
</style></head><body><div class="w">
<div class="row">
  <div class="st"><div class="nm">ENGAGED</div><p>$(t 'Train détecté en pied de montée, la chaîne peut l’accrocher.' 'Train detected at the foot of the hill, the chain can take it.')</p></div>
  <div class="st"><div class="nm">LIFTING</div><p>$(t 'Montée en cours, vitesse asservie sur les impulsions du capteur Hall.' 'Climbing, speed slaved to the Hall sensor pulses.')</p></div>
  <div class="st"><div class="nm">CREST</div><p>$(t 'Crête atteinte, décélération puis relâche de la chaîne.' 'Crest reached, slow down, then release the chain.')</p></div>
</div>
<div class="flt"><div class="nm">FAULT</div>
  <p>$(t 'Le capteur Hall se tait plus de' 'The Hall sensor stays silent for longer than') <span style="font-family:'JetBrains Mono'">STALL_TIMEOUT_MS</span>$(t ' : la chaîne force sans avancer, le moteur coupe.' ': the chain is straining without moving, and the motor cuts out.')</p></div>
<svg class="ov" viewBox="0 0 1280 320">
  <g stroke="#2F3A47" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M451 96h20M466 91l5 5-5 5"/><path d="M809 96h20M824 91l5 5-5 5"/>
    <path d="M1085 152v20H251v-14M246 161l5-6 5 6"/>
  </g>
  <text class="lbl" x="668" y="190" text-anchor="middle">$(t 'TRAIN SUIVANT' 'NEXT TRAIN')</text>
</svg>
</div></body></html>
HTML
shot lift-etats 320

# --------------------------------------------------------- Smoke Machine
cat > "$D/html$SUF/f-smoke-etats.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
$(sm_css "#C9CDD2" 260)
.row{margin-bottom:26px}
.st{min-height:104px}
</style></head><body><div class="w">
<div class="row">
  <div class="st"><div class="nm">READY</div><p>$(t 'Au repos, résistance hors tension, prêt à recevoir un ordre.' 'At rest, heater unpowered, ready for an order.')</p></div>
  <div class="st"><div class="nm">SMOKING</div><p>$(t 'Fumée en cours pour la durée demandée, puis retour immédiat au repos.' 'Smoking for the requested duration, then straight back to rest.')</p></div>
</div>
<div class="flt" style="background:#131A24;border-color:#1F2833">
  <div class="nm" style="color:#C9CDD2">$(t 'BORNE' 'LIMIT')</div>
  <p><span style="font-family:'JetBrains Mono'">HEATER_MAX_ON_MS</span> $(t 'coupe à 15 secondes quoi qu’il arrive. Une résistance laissée sous tension sur un ordre perdu chauffe sans limite.' 'cuts out at 15 seconds whatever happens. A heater left powered by a lost order heats without limit.')</p></div>
<svg class="ov" viewBox="0 0 1280 260">
  <g stroke="#2F3A47" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
    <path d="M598 84h84M677 79l5 5-5 5"/>
    <path d="M598 108h84M603 103l-5 5 5 5"/>
  </g>
  <text class="lbl" x="640" y="70" text-anchor="middle">SMOKE</text>
  <text class="lbl" x="640" y="134" text-anchor="middle">$(t 'DURÉE ÉCOULÉE' 'TIME ELAPSED')</text>
</svg>
</div></body></html>
HTML
shot smoke-etats 260
