#!/usr/bin/env zsh
file=$1
w=$2
h=$3
x=$4
y=$5

case "$file" in
  *.tar*) tar tf "$file";;
  *.zip) unzip -l "$file";;
  *.pdf) pdftotext "$file" -;;
  *) if [[ "$( file -Lb --mime-type "$file")" =~ ^image ]]; then
      kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file" < /dev/null > /dev/tty
      exit 1
    else
      bat --color=always --style=plain "$file"
    fi;;
esac
