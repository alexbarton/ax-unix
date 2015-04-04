#
# ax-common.sh -- Common Functions for Shell Scripts
# Copyright (c)2013-2015 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

ax_common_sourced=1

# Display a colored message.
#  $1    Level: -=title, 0=ok, 1=warning, 2=error.
#  $2    Word(s) to highlight.
#  $3-n  Remaining word(s). [optional]
ax_msg1() {
	case "$1" in
		"0")	c="32"; shift; ;;	# green
		"1")	c="33"; shift; ;;	# yellow
		"2")	c="31"; shift; ;;	# red
		"-")	c="1";  shift; ;;	# bold
		*)	c="0";
	esac
	# print colored word(s):
	printf "\x1b[0;${c}m"
	/bin/echo -n "${1}"
	printf "\x1b[0m "
	shift
	# print remaining word(s) and trailing newline:
	echo "${*}"
}

# Display a colored message.
#  $1    Level, see ax_msg1 function.
#  $2-n  Word(s) to highlight.
ax_msg() {
	level="$1"
	shift
	ax_msg1 "$level" "$*"
}

# Abort the script with an error message and exit code 1.
#  $1  Error message [optional]. Will be formatted as "Error: %s Aborting!".
#      if no error message is given, "Aborting!" will be printed.
ax_abort() {
	[ $# -gt 0 ] \
		&& ax_msg 2 "Error: $* Aborting!" \
		|| ax_msg 2 "Aborting!"
	exit 1
}
