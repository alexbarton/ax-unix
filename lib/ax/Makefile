#
# ax-unix: Alex' UNIX Tools & Scripts
# Copyright (c)2013-2016 Alexander Barton (alex@barton.de)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

ALL = README ax-common.sh

include ../../Makefile.ax

install-local: ax-common.sh
	install -d -o "$(USER)" -g "$(GROUP)" -m 755 \
	 "$(DESTDIR)$(PREFIX)/lib/ax"
	install -p -o "$(USER)" -g "$(GROUP)" -m 644 README \
	 "$(DESTDIR)$(PREFIX)/lib/ax/README"
	install -p -o "$(USER)" -g "$(GROUP)" -m 644 ax-common.sh \
	 "$(DESTDIR)$(PREFIX)/lib/ax/ax-common.sh"
