#
# @copyright 2008-2019 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI="5"

WX_GTK_VER="3.0"

inherit eutils wxwidgets

DESCRIPTION="The Open Source IA-32 Emulation Project"
HOMEPAGE="http://bochs.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="3dnow avx debugger doc gdb ncurses readline svga sdl +smp wxwidgets vnc X +x86-64"

REQUIRED_USE="
    avx? ( x86-64 )
    gdb? ( !debugger !smp )
    debugger? ( !gdb )
"

RDEPEND="
    X? (
        x11-libs/libICE
        x11-libs/libSM
        x11-libs/libX11
        x11-libs/libXpm
    )
    sdl? ( media-libs/libsdl )
    svga? ( media-libs/svgalib )
    wxwidgets? ( x11-libs/wxGTK:3.0[X] )
    readline? ( sys-libs/readline )
    ncurses? ( sys-libs/ncurses )
"

DEPEND="
    ${RDEPEND}
    doc? ( app-text/docbook-sgml-utils )
    X? ( x11-proto/xproto )
    sys-apps/sed
    >=app-text/opensp-1.5
"

src_prepare()
{
    sed -i \
        -e "s:^docdir.*:docdir = ${EPREFIX}/usr/share/doc/${PF}:" \
        Makefile.in || die

    epatch "${FILESDIR}/${P}-linux-4.x-compat.patch"
    epatch_user
}

src_configure()
{
    econf \
        --enable-all-optimizations \
        --enable-idle-hack \
        --enable-cdrom \
        --enable-clgd54xx \
        --enable-cpu-level=6 \
        --enable-disasm \
        --enable-e1000 \
        --enable-gameport \
        --enable-monitor-mwait \
        --enable-ne2000 \
        --enable-plugins \
        --enable-pci \
        --enable-pcidev \
        --enable-pnic \
        --enable-raw-serial \
        --enable-sb16 \
        --enable-usb \
        --enable-usb-ohci \
        --enable-usb-xhci \
        --prefix=/usr \
        --with-nogui \
        $(use_enable 3dnow) \
        $(use_enable avx) \
        $(use_enable debugger) \
        $(use_enable doc docbook) \
        $(use_enable gdb gdb-stub) \
        $(use_enable readline) \
        $(use_enable smp) \
        $(use_enable x86-64) \
        $(use_with ncurses term) \
        $(use_with sdl) \
        $(use_with svga) \
        $(use_with vnc rfb) \
        $(use_with wxwidgets wx) \
        $(use_with X x) \
        $(use_with X x11) \
        ${myconf}
}
