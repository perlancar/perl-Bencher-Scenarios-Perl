package Bencher::Scenario::Perl::Hash;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    precision => 0.001,
    participants => [
        {name => 'access', code_template => 'no warnings "void"; state $hash = <hash>; for (<firstkey>..<lastkey>) { $hash->{$_} }'},
        {name => 'delete', code_template => 'my $hash = <hash>; for (<firstkey>..<lastkey>) { delete $hash->{$_} }'},
        {name => 'insert', code_template => 'my $hash = {}; for (<firstkey>..<lastkey>) { $hash->{$_} = 0 }'},
    ],
    datasets => [
        {
            name => 'h100',
            summary => 'A 100-key ("001".."100") hash',
            args => {firstkey => "001", lastkey => "100", hash=>{ map {$_=>0} "001".."100" }},
        },
        {
            name => 'h1k',
            summary => 'A 1k-key ("0001".."1000") hash',
            args => {firstkey => "0001", lastkey => "1000", hash=>{ map {$_=>0} "0001".."1000" }},
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

cperl (tested version: 5.22.1) and stableperl (tested version: 5.22.0) is around
15-20% faster than perl 5.22.1.
