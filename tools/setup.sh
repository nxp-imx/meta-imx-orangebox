# Setup Script for OrangeBox build environment
#
# See meta-imx-orangebox/README for instructions on using this script.
#
# Copyright 2023 NXP Semiconductors
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

if [ "$DISTRO" = "" ]; then
    DISTRO=fsl-imx-xwayland
fi
if [ "$MACHINE" = "" ]; then
    MACHINE=imx8dxl-orangebox
fi
EULA=$EULA DISTRO=$DISTRO MACHINE=$MACHINE . imx-setup-release.sh -b $@

echo "BBLAYERS += \" \${BSPDIR}/sources/meta-imx-orangebox \"" >> conf/bblayers.conf
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-imx-scfw \"" >> conf/bblayers.conf

echo ""
echo "OrangeBox build setup complete. Create an image with:"
echo "    $ bitbake imx-image-core"
echo ""
