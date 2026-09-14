#!/usr/bin/env sh
# Scan a draft for identifiers that must never appear in it.
#
# Usage: check-draft.sh output/casework-request.md [more files...]
#
# Exits 1 if anything is found. Run before showing a draft to the user and
# again before any draft leaves their machine.
#
# Uses `command grep` deliberately: an interactive shell may alias grep to a
# gitignore-aware wrapper, which will silently skip the very files most
# likely to hold identifiers.

set -eu
[ $# -ge 1 ] || { echo "usage: $0 <file> [file...]" >&2; exit 2; }

# A-number, SSN, USCIS receipt, I-94 number, dates that look like a DOB,
# passport-shaped tokens.
PATTERN='[Aa][0-9]{3}[- ]?[0-9]{3}[- ]?[0-9]{3}|[0-9]{3}-[0-9]{2}-[0-9]{4}|\b(IOE|EAC|WAC|LIN|SRC|MSC|NBC|YSC)[0-9]{10}\b|\b[0-9]{11}[[:space:]]?[A-Z][0-9]\b|\b(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/(19|20)[0-9]{2}\b'

found=0
for f in "$@"; do
  [ -f "$f" ] || { echo "skip (not a file): $f" >&2; continue; }
  if hits=$(command grep -nEo "$PATTERN" "$f" 2>/dev/null); then
    echo "IDENTIFIERS IN $f:"
    echo "$hits" | sed 's/^/  /'
    found=1
  fi
done

if [ "$found" -eq 1 ]; then
  echo
  echo "These belong on the official form, typed by the applicant, not in a draft."
  echo "Remove them before the draft goes anywhere."
  exit 1
fi

echo "clean: no identifiers found in $*"
