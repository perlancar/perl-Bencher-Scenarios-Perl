package Bencher::Scenario::Perl::5220Perf_length;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark hash lookup',
    default_precision => 0.001,
    participants => [
        {name=>'length100', code_template => 'use bytes; my $str = <str>; for(1..100) { my $len = length($str) }' },
    ],
    datasets => [
        {name=>'str100', args => {str=>'abcd' x 25}},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

From L<perl5220delta>: There is a performance improvement of up to 20% when
length is applied to a non-magical, non-tied string, and either use bytes is in
scope or the string doesn't use UTF-8 internally.


=head1 SEE ALSO

L<perl5220delta>
