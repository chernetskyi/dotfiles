export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/lastd"

n ()
{
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  nnn -adeiDU "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}

bindkey -s "^N" "^Un^M"
bindkey -as "^N" "ccn^M"
