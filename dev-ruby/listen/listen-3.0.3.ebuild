#
# @copyright 2008-2021 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI=5

USE_RUBY="ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

SRC_URI="https://github.com/guard/listen/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Listens to file modifications and notifies you about the changes"
HOMEPAGE="https://github.com/guard/listen"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND+="
    !!media-sound/listen
    !!media-radio/ax25
"

ruby_add_rdepend "
    >=dev-ruby/rb-inotify-0.9
"

all_ruby_prepare()
{
    sed -i \
        -e "/git ls-files/,+3d" \
        -e "/rb-fsevent/d" \
        -e "/bundler/d"\
        ${PN}.gemspec || die

    rm -rf spec/lib/listen/adapter/darwin_spec.rb || die
}
