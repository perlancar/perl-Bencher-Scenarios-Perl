package Bencher::Scenario::Perl::Hash;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    precision => 0.001,
    participants => [
        {name => 'access', code_template => 'no warnings "void"; state $hash = <hash>; for ("001"..<lastkey>) { $hash->{$_} }'},
        {name => 'delete', code_template => 'my $hash = <hash>; for ("001"..<lastkey>) { delete $hash->{$_} }'},
        {name => 'insert', code_template => 'my $hash = {}; for ("001"..<lastkey>) { $hash->{$_} = 0 }'},
    ],
    datasets => [
        {
            name => 'h100',
            summary => 'A 100-key ("001".."100") hash',
            args => {lastkey => "100", hash=>{ map {$_=>0} "001".."100" }},
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

cperl (tested version: 5.22.1) and stableperl (tested version: 5.22.0) is around
15-20% faster than perl 5.22.1.
