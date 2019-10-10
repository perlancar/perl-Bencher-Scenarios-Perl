package Bencher::Scenario::Perl::Array;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark array access',
    precision => 0.001,
    participants => [
        {name => 'access'      , code_template => 'no warnings "void"; state $ary = <array>; for (<firstelem>..<lastelem>) { $ary->[$_] }'},
        {name => 'shift'       , code_template => 'my $ary = <array>; for (<firstelem>..<lastelem>) { shift @$ary }'},
        {name => 'splice-shift', code_template => 'my $ary = <array>; for (<firstelem>..<lastelem>) { splice @$ary, 0, 1 }'},
        {name => 'push'        , code_template => 'my $ary = []; for (<firstelem>..<lastelem>) { push @$ary, 0 }'},
        {name => 'splice-push' , code_template => 'my $ary = []; for (<firstelem>..<lastelem>) { splice @$ary, scalar(@$ary), 0, 0 }'},
    ],
    datasets => [
        {
            name => 'a100',
            summary => 'A 100-element ("001".."100") array',
            args => {firstelem => "001", lastelem => "100", array=>["001".."100"] },
        },
        {
            name => 'a1k',
            summary => 'A 1k-element ("0001".."1000") array',
            args => {firstelem => "0001", lastelem => "1000", array=>["0001".."1000"] },
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES
