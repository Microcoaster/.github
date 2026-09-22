#!/bin/bash
# Refait toutes les figures des dépôts de l'organisation, dans les deux
# langues, puis les repose dans chaque dépôt.
D="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "pastilles.sh"; bash "$D/pastilles.sh"
for LG in fr en; do
  echo; echo "=== $LG ==="
  for m in "$D"/modules/*.sh; do echo "  $(basename "$m")"; LANGUE=$LG bash "$m"; done
  # Les figures qui ne suivent aucun gabarit commun, rendues à part.
  LANGUE=$LG bash "$D/etats.sh"
  LANGUE=$LG bash "$D/cablage-smoke.sh"
  LANGUE=$LG bash "$D/architecture-webapp.sh"
  LANGUE=$LG bash "$D/installer.sh"
done
