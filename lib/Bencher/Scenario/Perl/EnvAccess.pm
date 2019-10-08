package Bencher::Scenario::Perl::EnvAccess;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    precision => 100,
    participants => [
        {name => 'read FOO'  , code_template => '$ENV{FOO}'},
        {name => 'read PATH' , code_template => '$ENV{PATH}'},
        {name => 'write FOO' , code_template => '$ENV{FOO}  = "/foo:/bar"'},
        {name => 'write PATH', code_template => '$ENV{PATH} = "/foo:/bar"'},
    ],
};

1;
# ABSTRACT:
