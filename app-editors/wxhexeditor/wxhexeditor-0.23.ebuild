#
# @copyright 2008-2019 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI="5"

WX_GTK_VER="2.8"

inherit eutils toolchain-funcs wxwidgets

MY_PN="wxHexEditor"

DESCRIPTION="A free hex editor / disk editor for Linux, Windows and MacOSX"
HOMEPAGE="http://www.wxhexeditor.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-v${PV}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    app-crypt/mhash
    dev-libs/udis86
    x11-libs/wxGTK:2.8[X]
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

pkg_pretend()
{
    tc-has-openmp \
        || die "${PN} uses OpenMP libraries. Please use an OpenMP-capable compiler."
}

src_prepare()
{
    epatch "${FILESDIR}/${P}-makefile.patch"
    epatch_user
}
