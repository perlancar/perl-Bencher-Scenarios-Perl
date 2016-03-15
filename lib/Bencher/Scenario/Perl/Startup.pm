package Bencher::Scenario::Perl::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use App::perlbrew;
use File::Which;

my $participants = [];

my $pb = App::perlbrew->new;
for my $perl ($pb->installed_perls) {
    push @$participants, {
        name => "$perl->{name} -e1",
        cmdline => [$perl->{executable}, "-e1"],
    };
    if (version->parse($perl->{version}) >= version->parse("5.10.0")) {
        push @$participants, {
            name => "$perl->{name} -E1",
            cmdline => [$perl->{executable}, "-E1"],
        };
    }
}

our $scenario = {
    summary => 'Benchmark startup time of perls',
    default_precision => 0.005,
    participants => $participants,
};

1;
# ABSTRACT:

=head1 DESCRIPTION

Conclusion: in general newer versions of perl has larger startup overhead than
previous ones. If startup overhead is important to you, use C<-e> instead of
C<-E> unless necessary.


=head1 SEE ALSO

L<Bencher::Scenario::Interpreters>
