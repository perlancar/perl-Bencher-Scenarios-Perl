package Bencher::Scenario::Perl::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Which;

my $participants = [];

if (my $perlbrew_path = which("perlbrew")) {
    my $perlbrew_root = $perlbrew_path;
    $perlbrew_root =~ s!/bin/perlbrew\z!!;
    my $out = `perlbrew list`;

    my @perls;
    while ($out =~ /^\s*\*?\s*(.+)/gm) {
        push @perls, $1;
    }

    for my $perl (@perls) {
        my ($perl_ver) = $perl =~ /perl-(.+)/;

        push @$participants, {
            name => "$perl -e1",
            cmdline => ["$perlbrew_root/perls/$perl/bin/perl", "-e1"],
        };

        if (version->parse($perl_ver) >= version->parse("5.10.0")) {
            push @$participants, {
                name => "$perl -E1",
                cmdline => ["$perlbrew_root/perls/$perl/bin/perl", "-E1"],
            };
        }
    }
} else {
    warn "Please install perlbrew so I can easily locate the different perls";
}

our $scenario = {
    summary => 'Benchmark startup time of perls',
    default_precision => 0.001,
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
