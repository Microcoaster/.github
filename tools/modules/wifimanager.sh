#!/bin/bash
# Les figures du README de MicroCoaster_WifiManager.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
source "$D/seq.sh"      >/dev/null 2>&1

A="#22D3EE"

# ----------------------------------------------------------- la bannière
ban wifimanager "$A" \
'<svg viewBox="0 0 144 144" fill="none"><path d="M20 58a74 74 0 0 1 104 0" stroke="#FAFAFA" stroke-width="9" stroke-linecap="round"/><path d="M40 80a46 46 0 0 1 64 0" stroke="#FAFAFA" stroke-width="9" stroke-linecap="round"/><path d="M58 100a20 20 0 0 1 28 0" stroke="#22D3EE" stroke-width="9" stroke-linecap="round"/><circle cx="72" cy="118" r="8" fill="#22D3EE"/></svg>' \
'WiFi <em>Manager</em>' \
"$(t 'Firmware de base commun à tous les modules : portail captif,' 'The base firmware every module shares: a captive portal,')" \
"$(t 'appairage au réseau, puis connexion automatique au serveur.' 'network pairing, then an automatic connection to the server.')" \
"$(P 'ESP32' 'PLATFORMIO' "$(t 'PORTAIL CAPTIF' 'CAPTIVE PORTAL')" 'LITTLEFS')" "$(t 'FIRMWARE' 'FIRMWARE')"

# ------------------------------------------------ les bandeaux de section
rep wifimanager "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Reprise en main' 'Taking it back')" \
"$(t 'Réglages' 'Settings')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------- le principe
seqfig wm-principe "$A" \
"$(t 'Premier démarrage' 'First boot')|$(t "Aucun <code>/wifi.json</code> en mémoire : le module ouvre son propre point d'accès." 'No <code>/wifi.json</code> in memory: the module opens an access point of its own.')" \
"$(t 'Portail captif' 'Captive portal')|$(t "Toute requête est redirigée vers la page de configuration, quelle que soit l'URL demandée." 'Every request is redirected to the configuration page, whatever the URL asked for.')" \
"$(t 'Identifiants saisis' 'Credentials entered')|$(t 'Écrits dans <code>/wifi.json</code> sur LittleFS, puis le module redémarre.' 'Written to <code>/wifi.json</code> on LittleFS, then the module reboots.')" \
"$(t 'Ensuite' 'From then on')|$(t 'Connexion directe au réseau mémorisé. En cas de coupure, reconnexion automatique puis repli sur le portail.' 'A direct connection to the remembered network. If it drops, an automatic retry, then a fallback to the portal.')"

# ---------------------------------------------------------- le bouton
grid wm-btn "$A" 2 \
"$(t 'Appui de 2 à 5 secondes' 'Press for 2 to 5 seconds')|$(t 'Réouvre le portail de configuration sans rien effacer.' 'Reopens the configuration portal without erasing anything.')" \
"$(t 'Appui de 5 secondes ou plus' 'Press for 5 seconds or more')|$(t 'Efface les identifiants mémorisés. Le module repart vierge.' 'Erases the stored credentials. The module starts over blank.')"

# ------------------------------------------------------------ les réglages
grid wm-cfg "$A" 2 \
"setPortalTimeout|$(t 'Durée avant fermeture du portail. Une heure ici, quelques minutes en exploitation.' 'How long before the portal closes. An hour here, a few minutes in service.')" \
"setAPClientCheck|$(t "Le portail ne se ferme pas tant qu'un client y est connecté." 'The portal stays open as long as a client is connected to it.')" \
"setWebClientCheck|$(t 'Chaque requête HTTP relance le compte à rebours.' 'Every HTTP request restarts the countdown.')" \
"setCaptivePortal|$(t 'Redirige toute requête vers la page de configuration.' 'Redirects every request to the configuration page.')" \
"setFallbackPolicy|$(t "<code>ON_FAIL</code> : le portail ne s'ouvre qu'après un échec de connexion." '<code>ON_FAIL</code>: the portal only opens after a failed connection.')" \
"setAutoReconnect|$(t 'Tentative de reconnexion sans intervention après une coupure.' 'Retries the connection on its own after a drop.')"
