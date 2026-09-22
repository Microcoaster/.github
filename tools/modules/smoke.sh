#!/bin/bash
# Les figures du README de Smoke-Machine.
#
# La machine à états vient de etats.sh, et le câblage de cablage-smoke.sh :
# ni l'un ni l'autre ne passe par un gabarit commun.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1

A="#C9CDD2"

# ----------------------------------------------------------- la bannière
ban smoke "$A" \
'<svg viewBox="0 0 144 144" fill="none"><rect x="30" y="78" width="84" height="48" rx="10" stroke="#FAFAFA" stroke-width="7"/><rect x="46" y="94" width="24" height="16" rx="4" fill="#C9CDD2"/><path d="M64 62c-14-8 6-18-4-30M88 58c-16-10 8-20-4-34" stroke="#C9CDD2" stroke-width="7" stroke-linecap="round"/></svg>' \
'Smoke <em>Machine</em>' \
"$(t 'Module de fumée : résistance et ventilateur commutés par MOSFET,' 'The smoke module: heater and fan switched by a MOSFET,')" \
"$(t 'cycle court sans temporisation locale, imposée par le maître.' 'short cycles with no local timer, the master dictates them.')" \
"$(P 'ESP32' 'MOSFET' "$(t 'SPÉCIFICATION' 'SPECIFICATION')")" "$(t 'MODULE' 'MODULE')"

# ------------------------------------------------ les bandeaux de section
rep smoke "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Sécurité' 'Safety')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Protocole' 'Protocol')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"
