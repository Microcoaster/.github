#!/bin/bash
# Les figures du README de Microcoaster-bot, le bot de support du serveur
# Discord. Il vit dans un dépôt qui n'est pas cloné sous org/, donc
# installer.sh ne le repose pas : c'est installer-bot.sh qui s'en charge.
#
# Chaque texte porte ses deux langues, t <français> <anglais>. L'anglais
# n'est pas un calque : une tournure qui claque en français tombe à plat
# traduite mot à mot, alors elle est réécrite.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$D/cartes.sh"   >/dev/null 2>&1
source "$D/sections.sh" >/dev/null 2>&1
source "$D/grid.sh"     >/dev/null 2>&1
source "$D/seq.sh"      >/dev/null 2>&1
source "$D/tree.sh"     >/dev/null 2>&1

A="#5865F2"

# --------------------------------------------- la bannière, rendue à 3x
ECHELLE=3 \
ban bot "$A" \
'<svg viewBox="0 0 144 144" fill="none">
  <rect x="8" y="24" width="128" height="80" rx="18" stroke="#FAFAFA" stroke-width="7"/>
  <path d="M46 104 L40 126 L70 104 Z" fill="#FAFAFA"/>
  <circle cx="54" cy="62" r="10" fill="#5865F2"/>
  <circle cx="92" cy="62" r="10" fill="#5865F2"/>
  <path d="M104 96l10 10 18-20" stroke="#5865F2" stroke-width="9" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
</svg>' \
'Bot <em>Support</em>' \
"$(t 'Bot Discord du serveur : activation des garanties produit,' 'The server Discord bot: product warranty activation,')" \
"$(t 'billetterie de support, modération et attribution des rôles.' 'support ticketing, moderation and role assignment.')" \
"$(P 'DISCORD.JS' 'MYSQL' "$(t 'GARANTIES' 'WARRANTIES')" 'TICKETS')" "$(t 'SUPPORT' 'SUPPORT')"

# ------------------------------------------------ les bandeaux de section
rep bot "$A" \
"$(t "Ce qu'il fait" 'What it does')" \
"$(t 'Commandes' 'Commands')" \
"$(t 'Données' 'Data')" \
"$(t 'Installation' 'Installation')" \
"$(t 'Contribuer' 'Contributing')"

# ------------------------------------------------------------- la garantie
seqfig bot-garantie "$A" \
"$(t 'Le client active' 'The customer activates')|$(t "Il saisit son code de garantie. Le code est vérifié, l'activation passe en attente." 'They enter their warranty code. The code is checked, and the activation goes into the queue.')" \
"$(t 'Un admin valide' 'An admin approves')|$(t "La garantie ne démarre qu'après ce contrôle humain, le temps de vérifier une commande douteuse." 'The warranty only starts after that human check, long enough to look at a doubtful order.')" \
"$(t 'Le bot suit' 'The bot follows through')|$(t 'Rôle attribué, échéance posée, rappels automatiques à J-30 et J-7.' 'Role granted, expiry set, automatic reminders at 30 and 7 days out.')"

# ---------------------------------------------------------- les commandes
grid bot-cmd "$A" 3 \
"/add-code|ADMIN|$(t 'Ajoute un code premium au système.' 'Adds a premium code to the system.')" \
"/activate-warranty|ADMIN|$(t "Valide une activation en attente et ouvre la garantie." 'Approves a queued activation and opens the warranty.')" \
"/list-pending-warranties|ADMIN|$(t 'Liste les activations restant à traiter.' 'Lists the activations still to handle.')" \
"/warranty-extend|ADMIN|$(t 'Prolonge une garantie existante.' 'Extends an existing warranty.')" \
"/setup-warranty|ADMIN|$(t "Publie le panneau d'activation." 'Posts the activation panel.')" \
"/send-tickets|ADMIN|$(t "Publie le panneau d'ouverture de ticket." 'Posts the ticket-opening panel.')" \
"/ban · /unban|$(t 'MODÉRATION' 'MODERATION')|$(t 'Bannissement et levée.' 'Ban and lift.')" \
"/mute|$(t 'MODÉRATION' 'MODERATION')|$(t 'Réduction au silence temporaire.' 'Temporary silencing.')" \
"/warn|$(t 'MODÉRATION' 'MODERATION')|$(t 'Avertissement manuel tracé.' 'A manual warning, recorded.')" \
"/setup-bot|ADMIN|$(t 'Crée rôles, salons et catégories en une fois.' 'Creates roles, channels and categories in one go.')" \
"/config · /config-view|ADMIN|$(t 'Configuration par menus interactifs.' 'Configuration through interactive menus.')" \
"/force-restore-roles|ADMIN|$(t 'Force la restauration des rôles de garantie.' 'Forces the restoration of warranty roles.')"

# ------------------------------------------- les variables d'environnement
grid bot-env "$A" 3 \
"DISCORD_TOKEN|$(t 'Token du bot, délivré par le portail développeur Discord.' 'The bot token, issued by the Discord developer portal.')" \
"CLIENT_ID|$(t "Identifiant de l'application Discord." 'The Discord application ID.')" \
"DB_NAME|$(t 'Nom de la base MySQL.' 'The name of the MySQL database.')" \
"DB_HOST · DB_PORT|$(t 'Adresse du serveur MySQL.' 'The address of the MySQL server.')" \
"DB_USER · DB_PASSWORD|$(t 'Identifiants de connexion à la base.' 'The database connection credentials.')" \
"|$(t 'Aucune de ces valeurs ne doit rejoindre le dépôt : elles vivent dans <code>.env</code>.' 'None of these values should ever reach the repository: they live in <code>.env</code>.')"

# ------------------------------------------------------------ les tables
grid bot-db "$A" 2 \
"warranty_premium_codes|$(t "Codes de garantie, état d'activation et échéance." 'Warranty codes, activation state and expiry.')" \
"warranty_activation_logs|$(t 'Journal des activations, pour retrouver qui a validé quoi.' 'The activation log, to trace who approved what.')" \
"support_tickets · ticket_counter|$(t 'Tickets ouverts et numérotation incrémentale.' 'Open tickets and the incrementing numbering.')" \
"ticket_transcriptions|$(t 'Archives de conversation, écrites à la fermeture du ticket.' 'Conversation archives, written when the ticket closes.')" \
"user_status · user_bans|$(t 'État et sanctions par membre.' 'State and sanctions per member.')" \
"user_roles_backup · role_restoration_logs|$(t 'Rôles sauvegardés et restaurations effectuées.' 'Saved roles and the restorations carried out.')" \
"moderation_logs|$(t "Piste d'audit de toutes les actions de modération." 'The audit trail of every moderation action.')" \
"|$(t 'Les tables sont créées par le bot au premier démarrage, il suffit que la base existe.' 'The tables are created by the bot on first boot, the database only has to exist.')"

# ------------------------------------------------------- la mise en route
seqfig bot-setup "$A" \
"/setup-bot|$(t 'Crée les rôles, les catégories et les salons dont le bot a besoin. À lancer en premier, une seule fois.' 'Creates the roles, categories and channels the bot needs. Run it first, once.')" \
"/config|$(t 'Renseigne les identifiants ainsi créés dans <code>config/config.json</code>, par menus interactifs.' 'Fills the IDs it just created into <code>config/config.json</code>, through interactive menus.')" \
"/setup-warranty|$(t "Publie le panneau d'activation de garantie dans le salon prévu." 'Posts the warranty activation panel in the channel meant for it.')" \
"/send-tickets|$(t "Publie le panneau d'ouverture de ticket. Le bot est opérationnel." 'Posts the ticket-opening panel. The bot is live.')"

# ---------------------------------------------------------- l'arborescence
treefig bot "$A" "Microcoaster-bot/" \
"1|commands/|$(t 'Les commandes slash, une par fichier.' 'The slash commands, one per file.')" \
"1|buttons/|$(t "Les gestionnaires d'interaction des boutons." 'The button interaction handlers.')" \
"1|modals/|$(t 'Les formulaires modaux de saisie.' 'The modal input forms.')" \
"1|events/|$(t 'Le cycle de vie Discord : démarrage, arrivées, départs, messages.' 'The Discord lifecycle: startup, arrivals, departures, messages.')" \
"1|dao/|$(t "L'accès à la base, une classe par domaine." 'Database access, one class per domain.')" \
"2|warrantyDAO.js|$(t 'Codes, activations en attente et échéances.' 'Codes, queued activations and expiries.')" \
"2|ticketDAO.js|$(t 'Tickets, numérotation et transcriptions.' 'Tickets, numbering and transcripts.')" \
"2|moderationDAO.js|$(t "Sanctions et piste d'audit." 'Sanctions and the audit trail.')" \
"1|utils/|$(t 'Le socle : initialisation de la base, gestion de la configuration, expiration des bannissements.' 'The base layer: database initialisation, configuration handling, ban expiry.')" \
"1|sql/|<code>init_tables.sql</code>, $(t 'appliqué au premier démarrage.' 'applied on first boot.')" \
"1|config/|<code>config.json</code>$(t ' : identifiants de rôles, salons et catégories.' ': the IDs of roles, channels and categories.')"
