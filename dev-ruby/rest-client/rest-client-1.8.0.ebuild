#
# @copyright 2008-2015 Krizalys. All rights reserved.
# @link      http://www.krizalys.com/
#

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="history.md README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Simple Simple HTTP and REST client for Ruby"
HOMEPAGE="https://github.com/rest-client/rest-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/webmock )"

ruby_add_rdepend "
    >=dev-ruby/http-cookie-1.0.2:0
    >=dev-ruby/mime-types-1.16
    >=dev-ruby/netrc-0.7:0
"

all_ruby_prepare()
{
    sed \
        -e '/bundler/I s:^:#:' \
        -e '/namespace :windows/,/^end/ s:^:#:' \
        -i Rakefile || die

    rm spec/integration/request_spec.rb || die
}
