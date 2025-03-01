# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1

DESCRIPTION="Golden Disk Image builder"
HOMEPAGE="http://docs.openstack.org/developer/diskimage-builder/"
if [[ ${PV} == 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://opendev.org/openstack/diskimage-builder.git"
else
	inherit pypi
	KEYWORDS="amd64 ~arm64 x86 ~amd64-linux ~x86-linux"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

CDEPEND=">=dev-python/pbr-2.0.0[${PYTHON_USEDEP}]
	!~dev-python/pbr-2.1.0[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}
	>=dev-python/babel-2.3.4[${PYTHON_USEDEP}]
	!~dev-python/babel-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/networkx-1.10[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/six-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.20.0[${PYTHON_USEDEP}]
	app-emulation/qemu
	sys-block/parted
	sys-fs/multipath-tools
	sys-fs/dosfstools
	sys-apps/gptfdisk
	!dev-python/dib-utils[${PYTHON_USEDEP}]"
