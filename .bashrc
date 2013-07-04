function lastchange() {
  OUTPUT=$(svn log -l 2 . | grep -E '^r' | awk '{ print substr($1,2); }')

  nr=$(echo $OUTPUT | cut -f1 -d' ')
  or=$(echo $OUTPUT | cut -f2 -d' ')
  rep='.'

  __private_changeset $nr $or $rep
}

function cs() {
  rep="https://trac.maglabs.net/svn-repos/"
  nr=$1
  or=`expr $1 - 1`

  __private_changeset $nr $or $rep
}

function __private_changeset()
{
  lc="svn log -l 1 -r$1 $3"
  sy="svn diff -r$2:$1 --summarize $3"

  if which colordiff >/dev/null; then
    df="svn diff -r$2:$1 $3 | colordiff"
  else
    df="svn diff -r$2:$1 $3"
  fi

  eval $lc
  echo
  eval $sy
  echo
  eval $df
}

alias ls='ls -A --color'
alias ll='ls -lA --color'
