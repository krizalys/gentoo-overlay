#
# @copyright 2008-2015 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI=5

inherit versionator

MY_PV=$(replace_version_separator _ -)

DESCRIPTION="Dependency Manager for PHP"
HOMEPAGE="https://getcomposer.org/"
SRC_URI="http://getcomposer.org/download/${MY_PV}/composer.phar -> ${PN}-${MY_PV}.phar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
    >=dev-lang/php-5.3.4[ctype,filter,hash,json,phar,ssl,unicode,zip]
"

src_unpack()
{
    S=${WORKDIR}
}

src_prepare()
{
    epatch_user
}

src_install()
{
    mv "${DISTDIR}/${A}" "${WORKDIR}/composer"
    dobin composer
}
