require 5.008007;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile
(
          'NAME' => 'Mojolicious::Plugin::SMS',
          'VERSION_FROM' => 'lib/Mojolicious/Plugin/SMS.pm',
          'PREREQ_PM' => {
                           'Mojolicious' => '1.17',
                           'SMS::Send' => '0.04',
                           'Test::More' => 0
                         },
          'INSTALLDIRS' => 'site',
          'EXE_FILES' => [],
          'PL_FILES' => {}
        )
;
