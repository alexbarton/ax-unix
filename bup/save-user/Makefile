#
# ax-unix: Alex' UNIX Tools & Scripts
# Copyright (c)2013-2016 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

ALL = bup-save-user

include ../../Makefile.ax

install-local: bup-save-user
	[ -d "$(DESTDIR)$(PREFIX)/bin" ] || \
		install -d -o "$(USER)" -g "$(GROUP)" -m 755 \
		 "$(DESTDIR)$(PREFIX)/bin"
	install -p -o "$(USER)" -g "$(GROUP)" -m 755 bup-save-user \
	 "$(DESTDIR)$(PREFIX)/bin/bup-save-user"
