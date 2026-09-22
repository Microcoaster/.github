#!/bin/bash
# Les figures du README de Template, le gabarit de nouveau module.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1

A="#8A93A0"

# --------------------------------------------- la bannière, rendue à 3x
ECHELLE=3 \
ban template "$A" \
'<svg viewBox="0 0 144 144" fill="none">
  <rect x="16" y="16" width="112" height="112" rx="16" stroke="#8A93A0" stroke-width="7" stroke-dasharray="20 14"/>
  <path d="M72 50v44M50 72h44" stroke="#FAFAFA" stroke-width="9" stroke-linecap="round"/>
</svg>' \
"$(t 'Nouveau <em>module</em>' 'New <em>module</em>')" \
"$(t 'Point de départ d’un module MicroCoaster : arborescence, portail captif,' 'The starting point for a MicroCoaster module: tree, captive portal,')" \
"$(t 'liaison WebSocket et plan de documentation déjà en place.' 'WebSocket link and documentation plan, all already in place.')" \
"$(P 'ESP32' 'PLATFORMIO' 'LITTLEFS' "$(t 'GABARIT' 'TEMPLATE')")" \
"$(t 'GABARIT' 'TEMPLATE')"

# ------------------------------------------------ les bandeaux de section
rep template "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Sécurité' 'Safety')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Réglages' 'Settings')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"
