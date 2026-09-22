#!/bin/bash
# Les figures du README de Module-Audio.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/seq.sh"      >/dev/null 2>&1
source "$D/pinout.sh"   >/dev/null 2>&1

A="#A78BFA"

# ----------------------------------------------------------- la bannière
ban audio "$A" \
'<svg viewBox="0 0 144 144" fill="none"><path d="M26 56h22l28-24v80l-28-24H26z" stroke="#FAFAFA" stroke-width="7" stroke-linejoin="round" fill="none"/><path d="M96 52a28 28 0 0 1 0 40" stroke="#A78BFA" stroke-width="7" stroke-linecap="round"/><path d="M112 38a48 48 0 0 1 0 68" stroke="#A78BFA" stroke-width="7" stroke-linecap="round" opacity=".6"/></svg>' \
"$(t 'Module <em>Audio</em>' 'Audio <em>module</em>')" \
"$(t 'Lecteur audio embarqué : sortie I2S, pistes sur carte microSD,' 'An embedded audio player: I2S output, tracks on a microSD card,')" \
"$(t 'lecture déclenchée à distance par le contrôleur.' 'playback triggered remotely by the controller.')" \
"$(P 'ESP32' 'I2S' 'MICROSD' 'WEBSOCKET')" "$(t 'MODULE' 'MODULE')"

# ------------------------------------------------ les bandeaux de section
rep audio "$A" \
"$(t 'Principe' 'How it works')" \
"$(t 'Matériel' 'Hardware')" \
"$(t 'Protocole' 'Protocol')" \
"$(t 'Mise en service' 'Bringing it up')" \
"$(t 'Écosystème' 'Ecosystem')"

# ------------------------------------------------------------- le principe
seqfig au-principe "$A" \
"$(t 'Ordre reçu' 'Order received')|$(t 'Le contrôleur envoie le nom de la piste à jouer, au moment voulu du parcours.' 'The controller sends the name of the track to play, at the right point of the ride.')" \
"$(t 'Piste trouvée' 'Track found')|$(t "Décodage et sortie I2S vers le DAC, puis vers l'amplificateur." 'Decoding, then I2S out to the DAC and on to the amplifier.')" \
"$(t 'Piste absente' 'Track missing')|$(t 'Signalée au serveur. Un son muet et un module perdu se ressemblent trop pour qu&#39;on les confonde.' 'Reported to the server. Silence and a lost module look far too alike to be left ambiguous.')"

# ------------------------------------------------------------ le brochage
pinout audio "$A" "ESP32<br>MODULE AUDIO" \
"$(t 'SORTIE AUDIO · BUS I2S' 'AUDIO OUT · I2S BUS')" \
"$(t 'STOCKAGE · BUS SPI' 'STORAGE · SPI BUS')" \
"26|I2S BCLK|$(t 'Horloge de bit' 'Bit clock')" \
"25|I2S LRC|$(t 'Sélection de voie' 'Word select')" \
"22|I2S DIN|$(t 'Échantillons vers le DAC' 'Samples to the DAC')" \
"2|$(t 'LED statut' 'Status LED')|$(t 'Lecture en cours' 'Playback running')" \
-- \
"13|SD CS|$(t 'Sélection du lecteur' 'Card select')" \
"23|SPI MOSI|$(t 'Données vers la carte' 'Data to the card')" \
"19|SPI MISO|$(t 'Données depuis la carte' 'Data from the card')" \
"18|SPI SCK|$(t 'Horloge du bus' 'Bus clock')"
