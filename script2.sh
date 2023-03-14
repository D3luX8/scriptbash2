#!/bin/bash

# Inizializza le variabili per contare il numero di file per ogni interprete shebang
declare -A counters

# Loop sui file nella directory corrente
for file in *
do
  # Verifica se il file è uno script e contiene uno shebang
  if [[ -x "$file" && $(head -c 2 "$file") == '#!' ]]
  then
    # Estrae l'interprete shebang dal file
    shebang=$(head -n 1 "$file" | cut -c 3-)

    # Incrementa il contatore per l'interprete shebang corrispondente
    counters["$shebang"]=$((counters["$shebang"]+1))
  fi
done

# Stampa i risultati per ogni interprete shebang
for shebang in "${!counters[@]}"
do
  echo "Interprete shebang '$shebang': ${counters["$shebang"]} file"
done


