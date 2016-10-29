#!/bin/bash
# note.sh for https://github.com/Naereen/uLogMe/
# MIT Licensed, https://lbesson.mit-license.org/
#
# allows the user to simply record a note, saves it together with unix time in ../logs/notes_...

# Use https://bitbucket.org/lbesson/bin/src/master/.color.sh to add colors in Bash scripts
[ -f ~/.color.sh ] && . ~/.color.sh
[ -f color.sh ] && . color.sh

mkdir -p ../logs

read -p "Enter note: " n

if [ -z "$1" ]; then
    T="$(date +%s)" # default to current time
else
    T="$1"  # argument was provided, use it!
fi

logfile="../logs/notes_$(python ./rewind7am.py "$T").txt"
echo "$T $n" >> "$logfile"
echo -e "Logged ${yellow}note${white}: ${magenta}$T${white} ${green}$n${white} into '${black}$logfile${white}'"
