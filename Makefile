# NetKitty: Generic Multi Server
# Copyright (c) 2006, 2007, 2008, 2009, 2010
# 	        David Martínez Oliveira
# This file is part of NetKitty
#
# NetKitty is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# NetKitty is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with NetKitty.  If not, see <http://www.gnu.org/licenses/>.
#

DIET_CFLAGS=-falign-functions=0 -fdata-sections -ffunction-sections -Wl,--gc-sections -Os -fno-stack-protector
CFLAGS=-falign-functions=0 -fdata-sections -ffunction-sections -Wl,--gc-sections -Os -fno-stack-protector

all: nk

nk: nk.c
	gcc ${CFLAGS} -o $@ $<
	strip -s $@

.PHONY:
small: nk.c
	diet -Os gcc ${DIET_CFLAGS} -o nk-diet nk.c 
	strip -s nk-diet

clean:
	rm nk nk-diet
