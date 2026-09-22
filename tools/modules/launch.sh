#!/bin/bash
# Les figures du README de Launch-Track.
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

A="#FF4D4D"

# --------------------------------------------- la bannière, rendue à 3x
ECHELLE=3 \
ban launch "$A" \
'<svg viewBox="0 0 144 144" fill="none">
  <g stroke="#5A5A5A" stroke-width="4" stroke-linecap="round">
    <path d="M12 118v-10M32 118v-10M52 118v-10M72 118v-10M92 118v-10M112 118v-10M132 118v-10"/>
  </g>
  <path d="M4 106h136" stroke="#FAFAFA" stroke-width="7" stroke-linecap="round"/>
  <path d="M4 92h136" stroke="#FAFAFA" stroke-width="7" stroke-linecap="round"/>
  <g stroke="#FF4D4D" stroke-width="9" stroke-linecap="round">
    <path d="M24 78V56M44 78V50M64 78V44M84 78V50M104 78V56"/>
  </g>
  <g stroke="#FAFAFA" stroke-width="7" stroke-linecap="round">
    <path d="M96 24h34M104 40h26M112 8h18"/>
  </g>
</svg>' \
'Launch <em>Track</em>' \
"$(t 'Zone de lancement : poulie motorisée et courroie dentée,' 'The launch section: a driven pulley and a toothed belt,')" \
"$(t "un taquet accroche le train, l'accélère, puis le relâche." 'a catch car takes the train, accelerates it, then lets go.')" \
"$(P 'ESP32' "$(t 'COURROIE DENTÉE' 'TOOTHED BELT')" "$(t 'CODEUR' 'ENCODER')" 'WEBSOCKET')" "$(t 'MODULE' 'MODULE')"

# ------------------------------------------------ les bandeaux de section
rep launch "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Sécurité' 'Safety')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Réglages' 'Settings')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------ le brochage
pinout launch "$A" "ESP32<br>LAUNCH TRACK" \
"$(t 'SORTIES · CE QUE LE MODULE COMMANDE' 'OUTPUTS · WHAT THE MODULE DRIVES')" \
"$(t 'ENTRÉES · CE QUE LE MODULE MESURE' 'INPUTS · WHAT THE MODULE MEASURES')" \
"25|$(t 'Moteur, PWM' 'Motor, PWM')|$(t 'Vitesse de la courroie' 'Belt speed')" \
"26|$(t 'Moteur, sens' 'Motor, direction')|$(t 'Lancement ou retour' 'Launch or return')" \
"27|$(t 'Moteur, activation' 'Motor, enable')|$(t 'Coupure de puissance' 'Power cut-off')" \
"2|$(t 'LED prêt' 'Ready LED')|$(t 'État LOADED' 'LOADED state')" \
"4|$(t 'LED défaut' 'Fault LED')|$(t 'État FAULT' 'FAULT state')" \
-- \
"34|$(t 'Codeur, voie A' 'Encoder, channel A')|$(t 'Vitesse et position' 'Speed and position')" \
"35|$(t 'Codeur, voie B' 'Encoder, channel B')|$(t 'Sens de rotation' 'Direction of rotation')" \
"32|$(t 'Capteur de repos' 'Rest sensor')|$(t 'Taquet en position basse' 'Catch car parked')" \
"33|$(t 'Capteur de présence' 'Presence sensor')|$(t 'Train en zone' 'Train in the zone')" \
"36|$(t 'Capteur de sortie' 'Exit sensor')|$(t 'Sortie effective' 'Exit confirmed')"

# ------------------------------------------------------------ les réglages
grid launch-cfg "$A" 2 \
"LAUNCH_SPEED_PERCENT|$(t "Vitesse visée en fin d'accélération, en pourcentage du rapport cyclique maximal." 'Target speed at the end of the ramp, as a percentage of maximum duty cycle.')" \
"RAMP_UP_MS|$(t 'Donne son caractère au lancement : court et brutal, ou long et progressif.' 'Gives the launch its character: short and brutal, or long and gradual.')" \
"RAMP_DOWN_MS|$(t 'Décélération après la relâche. Sans elle, le taquet arrive en butée.' 'Deceleration after the release. Without it, the catch car slams into the stop.')" \
"RETURN_SPEED_PERCENT|$(t 'Vitesse de retour au repos, volontairement basse pour ne rien heurter.' 'Return speed, kept deliberately low so nothing gets hit.')" \
"SLIP_TOLERANCE_PERCENT|$(t 'Écart toléré entre vitesse mesurée et consigne avant de déclarer le patinage.' 'Gap tolerated between measured and commanded speed before calling it slip.')" \
"LAUNCH_TIMEOUT_MS|$(t "Délai au-delà duquel une sortie jamais constatée devient un défaut." 'The delay past which an exit never seen becomes a fault.')"
