################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="python-gpiozero"
PKG_VERSION="1.5.1"
PKG_ARCH="any"
PKG_LICENSE="BSD"
PKG_SITE="https://gpiozero.readthedocs.io/"
PKG_URL="https://github.com/gpiozero/gpiozero/archive/v${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="gpiozero-${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain Python python-raspberry-gpio distutilscross:host"
PKG_SECTION="python"
PKG_SHORTDESC="python-gpiozero: A simple interface to GPIO devices with Raspberry Pi"
PKG_LONGDESC="A simple interface to GPIO devices with Raspberry Pi."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"

  rm -rf $INSTALL/usr/bin
}
