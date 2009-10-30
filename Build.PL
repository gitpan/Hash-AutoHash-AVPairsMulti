use strict;
use warnings;
use Module::Build;

my $class = Module::Build->subclass
  (
   class => 'My::Builder',
   code => q{
       sub harness_switches { # turn off -w in Test::Harness
         shift->{properties}{debugger} ? qw(-d) : qw(-X);
       }
     },
  );

my $builder = $class->new(
    module_name         => 'Hash::AutoHash::AVPairsMulti',
    license             => 'perl',
    dist_author         => q{Nat Goodman <natg@shore.net>},
    dist_version_from   => 'lib/Hash/AutoHash/AVPairsMulti.pm',
    build_requires =>   {'Test::More' => 0.88,
		         'Test::Deep' => 0,
		          'Exporter' => 0,
		        },
    requires =>         {'Carp' => 0,
		         'Hash::AutoHash' => 1.10,
		         'Hash::AutoHash::MultiValued' => 1.10,
		        },
    add_to_cleanup      => [ 'Hash-AutoHash-AVPairsMulti-*' ],
    create_makefile_pl => 'passthrough',
);

$builder->create_build_script();
