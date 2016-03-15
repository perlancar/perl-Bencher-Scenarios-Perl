package Bencher::Scenario::Perl::5200Perf_return;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark return() being optimized away',
    default_precision => 0.001,
    participants => [
        {name=>'return', code_template => 'my $var = 1; return $var'},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

From L<perl5200delta>: In certain situations, when return is the last statement
in a subroutine's main scope, it will be optimized out. This means code like:

 sub baz { return $cat; }

will now behave like:

 sub baz { $cat; }

which is notably faster.

[perl #120765].


=head1 SEE ALSO

L<perl5200delta>
