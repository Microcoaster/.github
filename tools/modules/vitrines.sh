#!/bin/bash
# Les figures des deux pages d'attente, MicroCoaster_Docs et
# MicroCoaster_Forum. Elles partagent leur structure de fichiers, donc
# leur grille de contenu, à la couleur près.
#
# Ces deux dépôts ne sont pas clonés sous org/, donc installer.sh ne les
# repose pas : c'est installer-vitrines.sh qui s'en charge.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes-projet.sh" >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1

L2="$(t 'bascule de langue, et rien de superflu.' 'a language switch, and nothing surplus.')"

# ---------------------------------------------------------------- Docs
ban docs "#60A5FA" "#A78BFA" "#080C14" \
'<svg viewBox="0 0 146 146" fill="none">
  <path d="M73 38c-11-7-24-9-38-7v66c14-2 27 0 38 7 11-7 24-9 38-7V31c-14-2-27 0-38 7z"
        stroke="#60A5FA" stroke-width="6" stroke-linejoin="round"/>
  <path d="M73 38v66" stroke="#60A5FA" stroke-width="6"/>
  <g stroke="#FAFAFA" stroke-width="5" stroke-linecap="round" opacity=".55">
    <path d="M48 55h14M48 70h14M92 55h14M92 70h14"/></g>
</svg>' \
'Micro<em>Coaster</em> Docs' \
"$(t 'Page d’attente de la documentation produit : compte à rebours,' 'A holding page for the product documentation: a countdown,')" \
"$L2" \
"$(P 'NODE.JS' 'EXPRESS' "$(t 'STATIQUE' 'STATIC')" 'I18N')" \
'WEB' ''

rep docs "#60A5FA" \
"$(t 'À quoi ça sert' 'What it is for')" \
"$(t 'Contenu' 'Contents')" \
"$(t 'Lancer en local' 'Running it locally')" \
"$(t 'Quand la vraie doc arrivera' 'When the real docs land')"

# --------------------------------------------------------------- Forum
ban forum "#F59E0B" "#FB923C" "#120D04" \
'<svg viewBox="0 0 146 146" fill="none">
  <path d="M20 36h72v44H46L28 96V80H20z" stroke="#F59E0B" stroke-width="6" stroke-linejoin="round"/>
  <path d="M54 62h72v44h-8v16l-18-16H54z" stroke="#FAFAFA" stroke-width="6" stroke-linejoin="round"/>
  <g stroke="#F59E0B" stroke-width="5" stroke-linecap="round"><path d="M36 58h40"/></g>
  <g stroke="#FAFAFA" stroke-width="5" stroke-linecap="round" opacity=".6"><path d="M70 84h40"/></g>
</svg>' \
'Micro<em>Coaster</em> Forum' \
"$(t 'Page d’attente du forum communautaire : compte à rebours,' 'A holding page for the community forum: a countdown,')" \
"$L2" \
"$(P 'NODE.JS' 'EXPRESS' "$(t 'STATIQUE' 'STATIC')" 'I18N')" \
'WEB' ''

rep forum "#F59E0B" \
"$(t 'À quoi ça sert' 'What it is for')" \
"$(t 'Contenu' 'Contents')" \
"$(t 'Lancer en local' 'Running it locally')" \
"$(t 'Changer la date' 'Changing the date')" \
"$(t 'Ajouter une langue' 'Adding a language')"

# --------------------------------- la grille de contenu, commune aux deux
FILES="server.js|$(t 'Serveur Express. Il sert <code>public/</code> et répond sur <code>/</code>.' 'An Express server. It serves <code>public/</code> and answers on <code>/</code>.')
public/index.html|$(t 'La page elle-même.' 'The page itself.')
public/css/style.css|$(t 'Les styles.' 'The styles.')
public/js/countdown.js|$(t "Le compte à rebours jusqu'à la date de lancement." 'The countdown to the launch date.')
public/js/i18n.js|$(t 'La traduction français-anglais, par attributs <code>data-i18n</code>.' 'The French to English translation, through <code>data-i18n</code> attributes.')"
IFS=$'\n' read -r -d '' -a F <<< "$FILES" || true

grid docs-contenu  "#60A5FA" 2 "${F[@]}"
grid forum-contenu "#F59E0B" 2 "${F[@]}"
