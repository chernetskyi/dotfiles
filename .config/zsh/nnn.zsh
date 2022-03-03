# Environment variables {{{
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/lastd"
# }}}

# cd on quit {{{
n ()
{
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  nnn -e "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
# }}}

# vim:foldmethod=marker:foldlevel=0