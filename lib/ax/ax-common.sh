#!/bin/sh
#
# ax-common.sh -- Common Functions for Shell Scripts
# Copyright (c)2013-2018 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

# "ax_common_sourced" is a flag and stores the "API version" of "ax-common.sh",
# too. It should be incremented each time the public API changes!
# shellcheck disable=SC2034
ax_common_sourced=2

# Display a colored message (a plain message, when not writing to a terminal).
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
	if [ -t 1 ]; then
		# writing to a terminal, print colored word(s):
		printf "\\033[0;%sm%s\\033[0m " "${c}" "${1}"
	else
		# print plain text:
		printf "%s " "${1}"
	fi
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

# Display an error message to stderr.
#  [-l]  Log message to syslog, too.
#  $1-n  Error message.
ax_error() {
	if [ "$1" = "-l" ]; then
		shift
		logger -t "${NAME:-${0##*/}}" -p err "$*"
	fi
	ax_msg1 2 "$*" >&2
}

# Abort the script with an error message and exit code 1.
#  [-l]  Log message to syslog, too.
#  $1    Error message [optional]. Will be formatted as "Error: %s Aborting!".
#        if no error message is given, "Aborting!" will be printed.
ax_abort() {
	if [ "$1" = "-l" ]; then
		log_param="-l"
		shift
	else
		unset log_param
	fi
	if [ $# -gt 0 ]; then
		ax_error $log_param "Error: $* Aborting!"
	else
		ax_error $log_param "Aborting!"
	fi
	exit 1
}

# Display a debug message, when debug mode is enabled, that is, the environment
# variable "DEBUG" is set.
ax_debug() {
	[ -n "$DEBUG" ] && ax_msg1 1 "DEBUG:" "$*"
}
