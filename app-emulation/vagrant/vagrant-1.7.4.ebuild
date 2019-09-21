#
# @copyright 2008-2019 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI="5"

USE_RUBY="ruby22"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="vagrant.gemspec"
RUBY_FAKEGEM_EXTRAINSTALL="keys plugins templates version.txt"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem eutils

DESCRIPTION="A tool for building and distributing virtual machines"
HOMEPAGE="https://www.vagrantup.com/"
SRC_URI="https://github.com/mitchellh/vagrant/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos"
IUSE="test"

RESTRICT="test"

RDEPEND="
    ${RDEPEND}
    app-arch/libarchive
    net-misc/curl
    !app-emulation/vagrant-bin
"

ruby_add_bdepend "
    dev-ruby/rake
    test? (
        dev-ruby/mocha
        virtual/ruby-minitest
    )
"

ruby_add_rdepend "
    >=dev-ruby/bundler-1.5.2
    >=dev-ruby/childprocess-0.5.0
    >=dev-ruby/erubis-2.7.0
    >=dev-ruby/listen-3.0.2
    >=dev-ruby/log4r-1.1.9
    >=dev-ruby/net-ssh-2.6.6
    >=dev-ruby/net-sftp-2.1
    >=dev-ruby/net-scp-1.1.0
    >=dev-ruby/rest-client-1.6.0
"

all_ruby_prepare()
{
    #sed -i \
    #    -e "/bundler/d" \
    #    Rakefile || die

    sed -i \
        -e "/hashicorp-checkpoint/d" \
        -e "/nokogiri/d" \
        -e "/rb-kqueue/d" \
        -e "/wdm/d" \
        -e "/winrm/d" \
        ${PN}.gemspec || die

    #rm Gemfile || die
    rm test/unit/plugins/communicators/winrm/config_test.rb || die
    rm test/unit/plugins/communicators/winrm/helper_test.rb || die
    rm test/unit/plugins/communicators/winrm/shell_test.rb || die
}

pkg_postinst()
{
    if use x64-macos ; then
        ewarn
        ewarn "For Mac OS X prefixes, you must install the virtualbox"
        ewarn "package specifically for OS X which can be found at:"
        ewarn "https://www.virtualbox.org/wiki/Downloads"
        ewarn
    fi
}
