#
# @copyright 2008-2015 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI="5"

MY_PN="${PN/-bin/}"

inherit unpacker eutils

DESCRIPTION="Tool for building and distributing virtual machines"
HOMEPAGE="https://www.vagrantup.com/"

SRC_URI_AMD64="https://dl.bintray.com/mitchellh/${MY_PN}/${MY_PN}_${PV}_x86_64.deb"
SRC_URI_X86="https://dl.bintray.com/mitchellh/${MY_PN}/${MY_PN}_${PV}_i686.deb"

SRC_URI="
    amd64? ( ${SRC_URI_AMD64} )
    x86? ( ${SRC_URI_X86} )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/opt/${MY_PN}"

DEPEND=""

RDEPEND="
    ${DEPEND}
    app-arch/libarchive
    net-misc/curl
    !app-emulation/vagrant
"

RESTRICT="mirror"

src_unpack()
{
    unpack_deb "${A}"
}

src_install()
{
    #echo $P
    #die
    local dir="/opt/${P}"
    dodir "${dir}"
    cp -ar ./* "${ED}${dir}" || die
    make_wrapper "${MY_PN}" "${dir}/bin/${MY_PN}"
}
