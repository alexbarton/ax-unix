#
# ax-unix: Alex' UNIX Tools & Scripts
# Copyright (c)2013-2024 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

ALL = kopia-snapshot

include ../../Makefile.ax

check-local:
	./kopia-snapshot --help 2>&1 | grep 'Usage:' >/dev/null

install-local: kopia-snapshot
	install -d -o "$(USER)" -g "$(GROUP)" -m 755 \
	 "$(DESTDIR)$(PREFIX)/bin"
	install -p -o "$(USER)" -g "$(GROUP)" -m 755 kopia-snapshot \
	 "$(DESTDIR)$(PREFIX)/bin/kopia-snapshot"
