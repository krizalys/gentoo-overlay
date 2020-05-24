#
# @copyright 2008-2020 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI="5"

CMAKE_MIN_VERSION="2.8.12"

inherit cmake-utils games

DESCRIPTION="Heroes 3: WoG recreated"
HOMEPAGE="http://vcmi.eu/"

SRC_URI="
    https://github.com/vcmi/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
    http://download.vcmi.eu/WoG/wog.zip
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug editor erm +launcher +pch +sdl2 test"

RDEPEND="
    dev-libs/boost:0/1.56.0[nls]
    media-video/ffmpeg
    sys-libs/zlib[minizip]
    sdl2? (
        media-libs/libsdl2
        media-libs/sdl2-image[png]
        media-libs/sdl2-mixer
        media-libs/sdl2-ttf
    )
    !sdl2? (
        media-libs/libsdl
        media-libs/sdl-image[png]
        media-libs/sdl-mixer
        media-libs/sdl-ttf
    )
    editor? (
        >=dev-qt/qtwidgets-5
    )
    launcher? (
        >=dev-qt/qtnetwork-5
        >=dev-qt/qtwidgets-5
    )
"

DEPEND="
    ${RDEPEND}
    dev-util/pkgconfig
"

# Building this package with too much optimization may exhaust all available
# memory and hang the machine. Disabling parallel build should prevent this.
MAKEOPTS="-j1"

SHARE_REL="usr/share/${PN}"

pkg_preinst()
{
    games_pkg_preinst
}

src_prepare()
{
    cmake-utils_src_prepare
    epatch_user
}

src_configure()
{
    local mycmakeargs=(
        $(cmake-utils_use_enable debug)
        $(cmake-utils_use_enable editor)
        $(cmake-utils_use_enable erm)
        $(cmake-utils_use_enable launcher)
        $(cmake-utils_use_enable pch)
        $(cmake-utils_use_enable sdl2)
        $(cmake-utils_use_enable test)
    )

    cmake-utils_src_configure
}

src_install()
{
    cmake-utils_src_install
    local SHARE_ABS="${D}/${SHARE_REL}"
    dodir "${SHARE_REL}"
    cp -R "${WORKDIR}/Mods/WoG" "${SHARE_ABS}/Mods" || die
}

pkg_postinst()
{
    games_pkg_postinst
    einfo "${P} has been installed. To run the client, you need to copy manually the Data,"
    einfo "Maps, and MP3 directories from the Heroes III: Shadow of Death or Complete edition"
    einfo "CD-ROM(s) to /${SHARE_REL}."
}
