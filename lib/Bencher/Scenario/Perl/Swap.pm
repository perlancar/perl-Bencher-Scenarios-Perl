package Bencher::Scenario::Perl::Swap;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark swapping two variables',
    participants => [
        {code_template => 'my $a = <a>; my $b = <b>; my $tmp; for (1..1001) { $tmp = $a; $a = $b; $b = $tmp } [$a, $b]'},
        {code_template => 'my $a = <a>; my $b = <b>; for (1..1001) { ($a, $b) = ($b, $a) } [$a, $b]'},
    ],
    datasets => [
        {name=>'undef', args=>{a=>undef, b=>undef}},
        {name=>'empty-string', args=>{a=>'', b=>''}},
        {name=>'short-string', args=>{a=>'12345', b=>'54321'}},
        {name=>'long-string', args=>{a=>'1' x 100, b=>'2' x 100}},
        {name=>'number', args=>{a=>1, b=>2}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION


=head1 SEE ALSO
