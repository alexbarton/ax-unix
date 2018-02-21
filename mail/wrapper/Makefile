#
# ax-unix: Alex' UNIX Tools & Scripts
# Copyright (c)2013-2018 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

ALL = mail-wrapper

include ../../Makefile.ax

check-local:
	./mail-wrapper --help 2>&1 | grep 'mail-wrapper reads from standard input' >/dev/null

install-local: mail-wrapper
	install -d -o "$(USER)" -g "$(GROUP)" -m 755 \
	 "$(DESTDIR)$(PREFIX)/bin"
	install -p -o "$(USER)" -g "$(GROUP)" -m 755 mail-wrapper \
	 "$(DESTDIR)$(PREFIX)/bin/mail-wrapper"
