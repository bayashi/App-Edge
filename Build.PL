use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    name                => 'App-Edge',
    module_name         => 'App::Edge',
    license             => 'perl',
    dist_author         => 'Dai Okabayashi <bayashi@cpan.org>',
    dist_version_from   => 'lib/App/Edge.pm',
    configure_requires  => {
        'Module::Build' => 0.38,
    },
    build_requires      => {
        'Test::More' => 0.88,
        'Test::Output' => 0,
    },
    requires => {
        'perl' => '5.008001',
        'Getopt::Long' => 2.42,
        'Pod::Usage' => 0,
    },
    script_files        => [ 'script/edge' ],
    add_to_cleanup      => [ 'App-Edge-*' ],
    meta_merge     => {
      resources => {
        repository  => 'http://github.com/bayashi/App-Edge',
        bugtracker  => 'http://github.com/bayashi/App-Edge/issues',
      }
    },
    recursive_test_files => 1,
    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? ['t/', 'xt/'] : ['t/'],
);

$builder->create_build_script();
