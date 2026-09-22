#!/bin/bash
# Les figures du README de MicroCoasterWebApp.
#
# Le schéma d'architecture ne vient pas d'ici : il a son propre fichier,
# architecture-webapp.sh, parce qu'il ne suit aucun gabarit commun.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/tree.sh"     >/dev/null 2>&1

A="#5B8DEF"

# ----------------------------------------------------------- la bannière
ban webapp "$A" \
'<svg viewBox="0 0 144 144" fill="none"><rect x="6" y="18" width="132" height="102" rx="12" stroke="#FAFAFA" stroke-width="6"/><path d="M6 46h132" stroke="#FAFAFA" stroke-width="6"/><circle cx="24" cy="32" r="5" fill="#5B8DEF"/><circle cx="42" cy="32" r="5" fill="#4A4A4A"/><rect x="22" y="62" width="40" height="40" rx="7" fill="#5B8DEF"/><rect x="74" y="62" width="48" height="16" rx="6" fill="#FAFAFA" opacity=".85"/><rect x="74" y="86" width="30" height="16" rx="6" fill="#6A6A6A"/></svg>' \
'MicroCoaster <em>WebApp</em>' \
"$(t 'Application web de pilotage : supervision des modules,' 'The web app that drives it all: module supervision,')" \
"$(t "télémétrie temps réel, comptes et journal d'événements." 'realtime telemetry, accounts and an event log.')" \
"$(P 'NODE.JS' 'WEBSOCKET' 'MYSQL' 'DAO')" "$(t 'APPLICATION' 'APPLICATION')"

# ------------------------------------------------ les bandeaux de section
rep webapp "$A" \
"$(t 'Architecture' 'Architecture')" \
"$(t 'Structure' 'Structure')" \
"$(t 'Installation' 'Installation')" \
"$(t 'Développement' 'Development')" \
"$(t 'Écosystème' 'Ecosystem')"

# ---------------------------------------------------------- l'arborescence
treefig webapp "$A" "MicroCoasterWebApp/" \
"1|api/|$(t "Les gestionnaires d'événements : modules, utilisateurs, notifications." 'The event handlers: modules, users, notifications.')" \
"1|websocket/|$(t 'La liaison avec les modules ESP32.' 'The link to the ESP32 modules.')" \
"1|bdd/|$(t "L'accès aux données, un DAO par entité, sur une base commune." 'Data access, one DAO per entity, over a shared base.')" \
"1|routes/|$(t 'Les routes HTTP.' 'The HTTP routes.')" \
"1|middleware/|$(t "Authentification et contrôle d'accès." 'Authentication and access control.')" \
"1|views/|$(t 'Les gabarits des pages.' 'The page templates.')" \
"1|public/|$(t 'Les ressources servies telles quelles.' 'The assets served as they are.')" \
"1|locales/|$(t "Les traductions de l'interface." 'The interface translations.')" \
"1|sql/|$(t 'Le schéma et les données initiales.' 'The schema and the seed data.')" \
"1|esp/|$(t 'Les firmwares de référence des modules.' 'The reference firmwares for the modules.')" \
"1|sim/|$(t 'Les simulateurs de modules, pour développer sans matériel.' 'The module simulators, to develop without hardware.')" \
"1|tests/|$(t 'Les tests automatisés.' 'The automated tests.')" \
"1|utils/|$(t 'Les fonctions partagées.' 'The shared helpers.')"
