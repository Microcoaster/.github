#!/bin/bash
# Le graphe des branches de l'organisation : main, develop, et les trois
# familles qui en partent. Aucune ligne n'arrive sur main ni sur develop
# sans passer par une review.
# revient. Les correctifs urgents partent de main, tout le reste de develop.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$D/langue.sh"
mkdir -p "$D/html$SUF" "$D/flow$SUF"
CH="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
B="$(cd "$D" && pwd -W 2>/dev/null || pwd)"

cat > "$D/html$SUF/f-org-branches.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:400px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:400px;background:#0D1117;position:relative}
svg{position:absolute;inset:0}
.lbl{font-family:'JetBrains Mono',monospace;font-size:13px;letter-spacing:.3px}
.rol{font-family:'Space Grotesk',sans-serif;font-size:13.5px;fill:#8E9BAA}
</style></head><body><div class="w">
<svg viewBox="0 0 1280 400">
  <!-- voies principales -->
  <g fill="none" stroke-width="2.6" stroke-linecap="round">
    <path d="M200 112H900" stroke="#E4E8ED"/>
    <path d="M200 180H900" stroke="#8FA3B8"/>
  </g>

  <!-- correctif urgent : part de main, revient sur main -->
  <g fill="none" stroke="#F1C40F" stroke-width="2.6" stroke-linecap="round">
    <path d="M380 112C392 112 392 44 404 44"/>
    <path d="M404 44H536"/>
    <path d="M536 44C548 44 548 112 560 112"/>
  </g>

  <!-- fonctionnalité : part de develop, revient sur develop -->
  <g fill="none" stroke="#5CE08A" stroke-width="2.6" stroke-linecap="round">
    <path d="M280 180C292 180 292 248 304 248"/>
    <path d="M304 248H496"/>
    <path d="M496 248C508 248 508 180 520 180"/>
  </g>

  <!-- correction : même trajet, autre motif -->
  <g fill="none" stroke="#E2725F" stroke-width="2.6" stroke-linecap="round">
    <path d="M600 180C612 180 612 316 624 316"/>
    <path d="M624 316H776"/>
    <path d="M776 316C788 316 788 180 800 180"/>
  </g>

  <!-- commits -->
  <g stroke="#0D1117" stroke-width="3">
    <g fill="#E4E8ED"><circle cx="240" cy="112" r="6.5"/><circle cx="310" cy="112" r="6.5"/><circle cx="560" cy="112" r="6.5"/><circle cx="700" cy="112" r="6.5"/><circle cx="850" cy="112" r="6.5"/></g>
    <g fill="#8FA3B8"><circle cx="240" cy="180" r="6.5"/><circle cx="370" cy="180" r="6.5"/><circle cx="520" cy="180" r="6.5"/><circle cx="670" cy="180" r="6.5"/><circle cx="800" cy="180" r="6.5"/><circle cx="870" cy="180" r="6.5"/></g>
    <g fill="#F1C40F"><circle cx="440" cy="44" r="6.5"/><circle cx="500" cy="44" r="6.5"/></g>
    <g fill="#5CE08A"><circle cx="340" cy="248" r="6.5"/><circle cx="400" cy="248" r="6.5"/><circle cx="460" cy="248" r="6.5"/></g>
    <g fill="#E2725F"><circle cx="665" cy="316" r="6.5"/><circle cx="735" cy="316" r="6.5"/></g>
  </g>

  <!-- noms de voie, alignés à droite sur le départ des lignes -->
  <g class="lbl" text-anchor="end">
    <text x="190" y="49" fill="#F1C40F">hotfix/*</text>
    <text x="190" y="117" fill="#E4E8ED">main</text>
    <text x="190" y="185" fill="#8FA3B8">develop</text>
    <text x="190" y="253" fill="#5CE08A">feature/*</text>
    <text x="190" y="321" fill="#E2725F">bugfix/*</text>
  </g>

  <!-- rôle de chaque voie -->
  <g class="rol">
    <text x="935" y="49">$(t 'Correctif urgent, greffé sur la production' 'Urgent fix, grafted onto production')</text>
    <text x="935" y="117">$(t 'Code de production stable' 'Stable production code')</text>
    <text x="935" y="185">$(t 'Intégration des développements' 'Where development is integrated')</text>
    <text x="935" y="253">$(t 'Nouvelles fonctionnalités' 'New features')</text>
    <text x="935" y="321">$(t 'Corrections' 'Fixes')</text>
  </g>

  <text class="rol" x="640" y="372" text-anchor="middle" fill="#5E6B7B">
    Aucune de ces lignes n’arrive sur main ni sur develop sans passer par une review.
  </text>
</svg>
</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=11000 --force-device-scale-factor=2 \
  --screenshot="$B/flow$SUF/org-branches.png" --window-size=1280,400 "file:///$B/html$SUF/f-org-branches.html" >/dev/null 2>&1
echo "  org-branches.png"
