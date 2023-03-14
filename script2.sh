#!/bin/bash

# Verifica che il numero di argomenti sia corretto
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Assegna l'argomento alla variabile
directory=$1

# Verifica che la directory esista e sia una directory
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Utilizza il comando 'find' per cercare tutti i file nella directory specificata e nei suoi sottodirectory
# Il comando 'grep' viene utilizzato per cercare la riga che inizia con '#!' (shebang)
# Il comando 'cut' viene utilizzato per estrarre l'interprete shebang
# Il comando 'sort' viene utilizzato per ordinare gli interpreti shebang in ordine alfabetico
# Il comando 'uniq -c' viene utilizzato per contare il numero di file per ogni interprete shebang
find "$directory" -type f -exec grep -H '^#!' {} \; | cut -d' ' -f1 --complement | sort | uniq -c

# Mostra un messaggio di conferma
echo "Debug completato con successo per la directory: $directory"

