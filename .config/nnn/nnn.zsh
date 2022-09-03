# Environment variables {{{
export NNN_PLUG="p:preview-tui"
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/lastd"
# }}}

# cd on quit {{{
n ()
{
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  nnn -aeiU -P p "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
# }}}

# Bind Ctrl+n to Ctrl+U -> n -> Enter {{{
bindkey -s "^N" "^Un^M"
# }}}

# vim:foldmethod=marker:foldlevel=0
