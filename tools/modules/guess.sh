#!/bin/bash
# Les figures du README de GuessTheCoaster.
#
# Le schéma des deux modes ne passe pas par un gabarit : il a son propre
# HTML, en bas de ce fichier.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
mkdir -p "$D/flow$SUF"

A="#5CE08A"

# ----------------------------------------------------------- la bannière
ban guess "$A" \
'<svg viewBox="0 0 144 144" fill="none"><circle cx="72" cy="72" r="58" stroke="#FAFAFA" stroke-width="7"/><path d="M55 57 A17 17 0 1 1 72 74 V88" stroke="#5CE08A" stroke-width="11" stroke-linecap="round" stroke-linejoin="round" fill="none"/><circle cx="72" cy="106" r="7.5" fill="#5CE08A"/></svg>' \
'Guess The <em>Coaster</em>' \
"$(t 'Jeu Discord communautaire : deviner la montagne russe,' 'A community Discord game: name the roller coaster,')" \
"$(t 'avec classement, badges, compétitions et profils.' 'with a leaderboard, badges, competitions and profiles.')" \
"$(P 'DISCORD.JS' 'NODE.JS' 'DAO' "$(t 'CLASSEMENT' 'LEADERBOARD')")" "$(t 'JEU' 'GAME')"

# ------------------------------------------------ les bandeaux de section
rep guess "$A" \
"$(t 'Le jeu' 'The game')" \
"$(t 'Commandes' 'Commands')" \
"$(t 'Données' 'Data')" \
"$(t 'Installation' 'Installation')" \
"$(t 'Contribuer' 'Contributing')"

# --------------------------------------------------------- les difficultés
grid gc-diff "$A" 3 \
"Easy|$(t '60 SECONDES' '60 SECONDS')|$(t 'Une photo évidente, une minute pour répondre, un crédit à la clé.' 'An obvious photo, a minute to answer, one credit at stake.')" \
"Medium|$(t '45 SECONDES' '45 SECONDS')|$(t 'Moins de temps, deux crédits.' 'Less time, two credits.')" \
"Hard|$(t '30 SECONDES' '30 SECONDS')|$(t 'Trente secondes et trois crédits : le barème récompense le risque.' 'Thirty seconds and three credits: the scale rewards the risk.')"

# ---------------------------------------------------------- les commandes
grid gc-cmd "$A" 3 \
"/guess|$(t 'JOUER' 'PLAY')|$(t 'Ouvre une manche solo, au hasard ou à la difficulté choisie.' 'Opens a solo round, at random or at the chosen difficulty.')" \
"/competition|$(t 'JOUER' 'PLAY')|$(t 'Ouvre un round public de soixante secondes.' 'Opens a public sixty-second round.')" \
"/endgame|$(t 'JOUER' 'PLAY')|$(t 'Clôt le round en cours.' 'Closes the round in progress.')" \
"/profile|$(t 'PROFIL' 'PROFILE')|$(t 'Collection, crédits, série en cours et record.' 'Collection, credits, current streak and personal best.')" \
"/badges|$(t 'PROFIL' 'PROFILE')|$(t 'Badges obtenus.' 'Badges earned.')" \
"/leaderboard|$(t 'PROFIL' 'PROFILE')|$(t 'Classement général du serveur.' 'The overall server leaderboard.')" \
"/addcoaster|ADMIN|$(t 'Ajoute un coaster à la base.' 'Adds a coaster to the database.')" \
"/addcontributor|ADMIN|$(t 'Marque un joueur comme contributeur.' 'Marks a player as a contributor.')" \
"/commands|$(t 'UTILITAIRE' 'UTILITY')|$(t 'Liste les commandes disponibles.' 'Lists the available commands.')" \
"/about|$(t 'UTILITAIRE' 'UTILITY')|$(t 'À propos du bot.' 'About the bot.')" \
"/ping|$(t 'UTILITAIRE' 'UTILITY')|$(t 'Vérifie que le bot répond.' 'Checks that the bot answers.')"

# ------------------------------------------------------------ les données
grid gc-db "$A" 3 \
"users|$(t 'Qui joue : crédits, série en cours, record, et les marqueurs de badge.' 'Who plays: credits, current streak, personal best, and the badge markers.')" \
"coasters|$(t 'Quels coasters existent : photo, parc, difficulté et surnom accepté.' 'Which coasters exist: photo, park, difficulty and accepted nickname.')" \
"user_coasters|$(t 'Qui a trouvé quoi. Une ligne par joueur et par coaster, la collection.' 'Who found what. One row per player per coaster, the collection.')"

# --------------------------------------------------------- les deux modes
T1="$(t 'Manche solo' 'Solo round')"
A1="$(t 'Le joueur ouvre sa manche et choisit la difficulté, ou la laisse au hasard.' 'The player opens a round and picks the difficulty, or leaves it to chance.')"
A2="$(t 'Le bot poste la photo et décompte le temps restant, seconde par seconde.' 'The bot posts the photo and counts the time down, second by second.')"
A3="$(t 'Le joueur écrit sa réponse dans le salon. Nom ou surnom, à 80 % de ressemblance près.' 'The player types the answer in the channel. Name or nickname, within 80% similarity.')"
AW="$(t 'TROUVÉ' 'FOUND')"
AWP="$(t 'Crédits selon la difficulté, série prolongée, coaster ajouté à la collection.' 'Credits by difficulty, streak extended, coaster added to the collection.')"
AL="$(t 'TEMPS ÉCOULÉ' 'TIME UP')"
ALP="$(t 'La réponse est révélée et la série repart de zéro.' 'The answer is revealed and the streak resets to zero.')"
T2="$(t 'Compétition' 'Competition')"
B1="$(t "Un round public s'ouvre pour soixante secondes, coaster tiré au hasard." 'A public round opens for sixty seconds, with a coaster drawn at random.')"
B2="$(t 'Tout le serveur peut répondre en même temps, sans lancer sa propre manche.' 'The whole server can answer at once, without starting a round of their own.')"
B3="$(t 'Le premier à tomber juste ferme le round pour tout le monde.' 'The first to get it right closes the round for everyone.')"
BW="$(t 'GAGNÉ' 'WON')"
BWP="$(t '<code>+5</code> crédits et le badge Compétition, quelle que soit la difficulté.' '<code>+5</code> credits and the Competition badge, whatever the difficulty.')"
BL="$(t 'MANQUÉ' 'MISSED')"
BLP="$(t "Une mauvaise réponse ne coûte rien, la série n'est pas touchée." 'A wrong answer costs nothing, and the streak is left alone.')"

cat > "$D/html$SUF/f-guess-modes.html" <<HTML
<!doctype html><html lang="$LG"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@800&family=Space+Grotesk:wght@400&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
html,body{width:1280px;height:404px;overflow:hidden;background:#0D1117}
.w{width:1280px;height:404px;background:#0D1117;display:flex;gap:30px;padding:26px 56px}
.pan{flex:1;background:#131A24;border:1px solid #1F2833;border-radius:13px;
     padding:22px 24px;display:flex;flex-direction:column}
.hd{display:flex;align-items:center;gap:14px;margin-bottom:6px}
.ico{width:40px;height:40px;flex-shrink:0;display:flex;align-items:center;justify-content:center;border-radius:10px}
h3{font-family:Syne,sans-serif;font-weight:800;font-size:19px;line-height:1.2;color:#F0F4F8}
.cmd{font-family:'JetBrains Mono',monospace;font-size:12.5px;margin-top:3px}
.stp{display:flex;align-items:flex-start;gap:12px;margin-top:13px}
.ix{width:22px;height:19px;flex-shrink:0;display:flex;align-items:center;justify-content:center;
    font-family:'JetBrains Mono',monospace;font-size:10.5px;color:#5E6B7B;
    border:1px solid #273140;border-radius:4px;margin-top:1px}
.stp p{font-family:'Space Grotesk',sans-serif;font-size:13.5px;line-height:1.42;color:#9AA6B4}
.sep{height:1px;background:#1F2833;margin:17px 0 3px;margin-top:auto}
.out{display:flex;align-items:flex-start;gap:11px;margin-top:11px}
.tag{font-family:'JetBrains Mono',monospace;font-size:10.5px;letter-spacing:1.2px;
     padding:4px 8px;border-radius:5px;flex-shrink:0;line-height:1.3;width:118px;text-align:center}
.out p{font-family:'Space Grotesk',sans-serif;font-size:13px;line-height:1.4;color:#8B97A6}
code{font-family:'JetBrains Mono',monospace;font-size:12.5px}

.g .ico{background:#5CE08A14;border:1px solid #5CE08A2E}
.g .cmd{color:#5CE08A}
.g code{color:#5CE08A}
.win{color:#5CE08A;background:#5CE08A14;border:1px solid #5CE08A33}
.lose{color:#E2725F;background:#E2725F12;border:1px solid #E2725F30}
.y .ico{background:#F1C40F14;border:1px solid #F1C40F2E}
.y .cmd{color:#F1C40F}
.y code{color:#F1C40F}
.gold{color:#F1C40F;background:#F1C40F14;border:1px solid #F1C40F33}
.none{color:#6B7684;background:#FFFFFF08;border:1px solid #273140}
</style></head><body><div class="w">

<div class="pan g">
  <div class="hd">
    <div class="ico"><svg width="21" height="21" viewBox="0 0 24 24" fill="none">
      <circle cx="12" cy="12" r="8.5" stroke="#5CE08A" stroke-width="1.8"/>
      <path d="M12 7.5v5l3 2" stroke="#5CE08A" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg></div>
    <div><h3>$T1</h3><div class="cmd">/guess [difficulty]</div></div>
  </div>
  <div class="stp"><div class="ix">01</div><p>$A1</p></div>
  <div class="stp"><div class="ix">02</div><p>$A2</p></div>
  <div class="stp"><div class="ix">03</div><p>$A3</p></div>
  <div class="sep"></div>
  <div class="out"><span class="tag win">$AW</span><p>$AWP</p></div>
  <div class="out"><span class="tag lose">$AL</span><p>$ALP</p></div>
</div>

<div class="pan y">
  <div class="hd">
    <div class="ico"><svg width="21" height="21" viewBox="0 0 24 24" fill="none">
      <g stroke="#F1C40F" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
        <path d="M7.5 3.5h9v6a4.5 4.5 0 0 1-9 0z"/><path d="M7.5 5h-3v1.5a3 3 0 0 0 3 3M16.5 5h3v1.5a3 3 0 0 1-3 3"/>
        <path d="M12 14v3.5M8.5 20.5h7"/></g></svg></div>
    <div><h3>$T2</h3><div class="cmd">/competition</div></div>
  </div>
  <div class="stp"><div class="ix">01</div><p>$B1</p></div>
  <div class="stp"><div class="ix">02</div><p>$B2</p></div>
  <div class="stp"><div class="ix">03</div><p>$B3</p></div>
  <div class="sep"></div>
  <div class="out"><span class="tag gold">$BW</span><p>$BWP</p></div>
  <div class="out"><span class="tag none">$BL</span><p>$BLP</p></div>
</div>

</div></body></html>
HTML
"$CH" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=12000 --force-device-scale-factor=2 \
  --screenshot="$B/flow$SUF/guess-modes.png" --window-size=1280,404 "file:///$B/html$SUF/f-guess-modes.html" >/dev/null 2>&1
echo "  guess-modes.png"
