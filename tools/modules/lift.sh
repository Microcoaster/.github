#!/bin/bash
# Les figures du README de Lift-Hill.
#
# La machine à états ne vient pas d'ici : les trois sont rendues ensemble
# par etats.sh, qui partage leurs styles et leurs tracés de liaison.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
source "$D/pinout.sh"   >/dev/null 2>&1

A="#4DD4FF"

# --------------------------------------------- la bannière, rendue à 3x
ECHELLE=3 \
ban lift "$A" \
'<svg viewBox="0 0 144 144" fill="none">
  <path d="M8 132h128" stroke="#3A3A3A" stroke-width="7" stroke-linecap="round"/>
  <g stroke="#4F4F4F" stroke-width="7" stroke-linecap="round">
    <path d="M40 104v28M62 82v50M84 60v72M106 38v94"/>
  </g>
  <path d="M18 126 L126 18" stroke="#FAFAFA" stroke-width="11" stroke-linecap="round"/>
  <g stroke="#4DD4FF" stroke-width="7" stroke-linecap="round">
    <path d="M29 105l10 10M51 83l10 10M73 61l10 10M95 39l10 10"/>
  </g>
</svg>' \
'<em>Lift</em> Hill' \
"$(t 'Montée du train : entraînement par chaîne, contrôle de vitesse,' 'Hauling the train up: chain drive, speed control,')" \
"$(t "détection d'arrivée en crête et anti-retour." 'crest detection and an anti-rollback.')" \
"$(P 'ESP32' "$(t 'ENTRAÎNEMENT' 'DRIVE')" "$(t 'CAPTEURS' 'SENSORS')" 'WEBSOCKET')" "$(t 'MODULE' 'MODULE')"

# ------------------------------------------------ les bandeaux de section
rep lift "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Sécurité' 'Safety')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Réglages' 'Settings')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------ le brochage
pinout lift "$A" "ESP32<br>LIFT HILL" \
"$(t 'SORTIES · CE QUE LE MODULE COMMANDE' 'OUTPUTS · WHAT THE MODULE DRIVES')" \
"$(t 'ENTRÉES · CE QUE LE MODULE MESURE' 'INPUTS · WHAT THE MODULE MEASURES')" \
"25|$(t 'Moteur, PWM' 'Motor, PWM')|$(t 'Vitesse de la chaîne' 'Chain speed')" \
"26|$(t 'Moteur, sens' 'Motor, direction')|$(t 'Sens de rotation' 'Direction of rotation')" \
"27|$(t 'Moteur, activation' 'Motor, enable')|$(t 'Coupure de puissance' 'Power cut-off')" \
"2|$(t 'LED marche' 'Running LED')|$(t 'État LIFTING' 'LIFTING state')" \
"4|$(t 'LED défaut' 'Fault LED')|$(t 'État FAULT' 'FAULT state')" \
-- \
"34|$(t 'Capteur Hall' 'Hall sensor')|$(t 'Une impulsion par tour' 'One pulse per turn')" \
"35|$(t 'Capteur bas' 'Bottom sensor')|$(t 'Présence en pied de montée' 'Present at the foot of the hill')" \
"32|$(t 'Capteur crête' 'Crest sensor')|$(t 'Arrivée en haut' 'Arrival at the top')"

# ------------------------------------------------------------ les réglages
grid lift-cfg "$A" 2 \
"LIFT_SPEED_PERCENT|$(t 'Vitesse de montée visée. Trop bas, la chaîne patine sous charge.' 'Target climbing speed. Too low and the chain slips under load.')" \
"RAMP_MS|$(t "Douceur du départ et de l'arrivée en crête. Sans rampe, la chaîne claque." 'How gently it starts and reaches the crest. With no ramp, the chain snaps taut.')" \
"STALL_TIMEOUT_MS|$(t 'Silence toléré du capteur Hall avant de déclarer le blocage.' 'Hall sensor silence tolerated before calling it a stall.')" \
"LIFT_TIMEOUT_MS|$(t "Durée maximale d'une montée avant de passer en défaut." 'Maximum duration of a climb before going to fault.')"
