package Bencher::Scenario::Perl::Swap;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark swapping two variables',
    participants => [
        {code_template => 'my ($a, $b, $tmp); for (1..1000) { $tmp = $a; $a = $b; $b = $tmp }'},
        {code_template => 'my ($a, $b); for (1..1000) { ($a, $b) = ($b, $a) }'},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION


=head1 SEE ALSO
