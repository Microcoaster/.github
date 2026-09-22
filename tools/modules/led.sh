#!/bin/bash
# Les figures du README de ESP-32-led, le banc d'essai à LED.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
source "$D/pinout.sh"   >/dev/null 2>&1

A="#2FD48A"

# ----------------------------------------------------------- la bannière
ban led "$A" \
'<svg viewBox="0 0 144 144" fill="none"><circle cx="44" cy="72" r="22" fill="#2FD48A"/><circle cx="100" cy="72" r="18.5" fill="none" stroke="#FAFAFA" stroke-width="7"/><path d="M44 30V14M100 30V14M44 114v16M100 114v16" stroke="#6A6A6A" stroke-width="6" stroke-linecap="round"/></svg>' \
"$(t 'Banc <em>LED</em>' 'LED <em>bench</em>')" \
"$(t "Version d'essai du Switch Track, sans actionneur : deux LED" 'A test rig for the Switch Track, with no actuator: two LEDs')" \
"$(t 'simulent les positions pour valider WiFi et WebSocket.' 'stand in for the positions, to prove out WiFi and WebSocket.')" \
"$(P 'ESP32' "$(t 'BANC DE TEST' 'TEST BENCH')" 'WEBSOCKET')" "$(t 'TEST' 'TEST')"

# ------------------------------------------------ les bandeaux de section
rep led "$A" \
"$(t 'Pourquoi un banc' 'Why a bench')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Commandes' 'Commands')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------ le brochage
pinout led "$A" "ESP32<br>BANC LED" \
"$(t 'POSITION GAUCHE' 'LEFT POSITION')" \
"$(t 'POSITION DROITE' 'RIGHT POSITION')" \
"2|$(t 'LED gauche' 'Left LED')|$(t 'Ce que ferait le vérin à gauche' 'What the actuator would do to the left')" \
-- \
"4|$(t 'LED droite' 'Right LED')|$(t 'Ce que ferait le vérin à droite' 'What the actuator would do to the right')"

# ---------------------------------------------------------- les commandes
grid led-cmd "$A" 3 \
"switch_left|$(t 'Allume la LED gauche, comme si le vérin avait dévié la voie.' 'Lights the left LED, as if the actuator had thrown the track over.')" \
"switch_right|$(t 'Allume la LED droite, comme si le vérin avait rendu la voie directe.' 'Lights the right LED, as if the actuator had handed the track back.')" \
"get_position|$(t 'Retourne la position simulée sans toucher aux LED.' 'Returns the simulated position without touching the LEDs.')"
