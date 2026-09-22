#!/bin/bash
# Les figures du README de Switch-Track.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
source "$D/seq.sh"      >/dev/null 2>&1
source "$D/pinout.sh"   >/dev/null 2>&1

A="#FFAE42"

# --------------------------------------------- la bannière, rendue à 3x
ECHELLE=3 \
ban switchtrack "$A" \
'<svg viewBox="0 0 144 144" fill="none">
  <g stroke="#4F4F4F" stroke-width="6" stroke-linecap="round">
    <path d="M12 118v-18M38 118v-18M64 118v-18M90 118v-18M116 118v-18"/>
  </g>
  <path d="M4 100h136" stroke="#FAFAFA" stroke-width="11" stroke-linecap="round"/>
  <path d="M56 100 C92 100 116 70 134 20" stroke="#FAFAFA" stroke-width="11" stroke-linecap="round" fill="none"/>
  <path d="M34 100h62" stroke="#FFAE42" stroke-width="11" stroke-linecap="round"/>
  <path d="M56 100 C74 100 89 92.5 101.8 78.8" stroke="#FFAE42" stroke-width="11" stroke-linecap="round" fill="none"/>
</svg>' \
'Switch <em>Track</em>' \
"$(t 'Aiguillage motorisé : vérin électrique piloté par DRV8871,' 'A motorised switch: an electric actuator driven by a DRV8871,')" \
"$(t 'position signalée par LED et commandes reçues en WebSocket.' 'position shown by LEDs and commands received over WebSocket.')" \
"$(P 'ESP32' 'DRV8871' 'WEBSOCKET' 'v2.0.0')" "$(t 'MODULE' 'MODULE')"

# ------------------------------------------------ les bandeaux de section
rep switchtrack "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Protocole' 'Protocol')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------- le principe
seqfig st-principe "$A" \
"$(t 'Ordre reçu' 'Order received')|$(t 'Le serveur envoie <code>switch_left</code> ou <code>switch_right</code>. Le module ne décide rien.' 'The server sends <code>switch_left</code> or <code>switch_right</code>. The module decides nothing.')" \
"$(t 'Vérin actionné' 'Actuator driven')|$(t 'Le sens est imposé au DRV8871, qui inverse la polarité aux bornes du vérin.' 'The direction is handed to the DRV8871, which flips the polarity across the actuator.')" \
"$(t 'Position atteinte' 'Position reached')|$(t "La LED correspondante s'allume et la réponse part vers le serveur." 'The matching LED lights up and the reply goes back to the server.')" \
"$(t 'Sans ordre' 'With no order')|$(t 'Le vérin ne bouge pas. La position en place est conservée telle quelle.' 'The actuator does not move. The position already set is held as it is.')"

# ------------------------------------------------------------ le brochage
pinout switchtrack "$A" "ESP32<br>SWITCH TRACK" \
"$(t 'ACTIONNEUR · DRV8871' 'ACTUATOR · DRV8871')" \
"$(t 'SIGNALISATION · POSITION' 'SIGNALLING · POSITION')" \
"21|DRV8871, IN1|$(t 'Vérin en sens horaire' 'Actuator clockwise')" \
"22|DRV8871, IN2|$(t 'Vérin en sens anti-horaire' 'Actuator anticlockwise')" \
-- \
"2|$(t 'LED gauche' 'Left LED')|$(t 'Voie déviée active' 'Diverging route live')" \
"4|$(t 'LED droite' 'Right LED')|$(t 'Voie directe active' 'Straight route live')"

# ---------------------------------------------------------- les commandes
grid st-cmd "$A" 3 \
"switch_left|$(t 'Bascule la voie vers la gauche. Accepte aussi <code>left</code> et <code>switch_to_A</code>.' 'Throws the track to the left. Also accepts <code>left</code> and <code>switch_to_A</code>.')" \
"switch_right|$(t 'Bascule la voie vers la droite. Accepte aussi <code>right</code> et <code>switch_to_B</code>.' 'Throws the track to the right. Also accepts <code>right</code> and <code>switch_to_B</code>.')" \
"get_position|$(t 'Retourne la position courante sans actionner le vérin.' 'Returns the current position without driving the actuator.')"
