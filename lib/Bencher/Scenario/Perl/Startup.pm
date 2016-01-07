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
    #my @perls;
    while ($out =~ /^\s*\*\s*(.+)/gm) {
        #push @perls, $1;
        push @$participants, (
            {
                name => "$1 -e1",
                cmdline => ["$perlbrew_root/perls/$1/bin/perl", "-e1"],
            },
            {
                name => "$1 -E1",
                cmdline => ["$perlbrew_root/perls/$1/bin/perl", "-E1"],
            },
        );
    }
}

our $scenario = {
    summary => 'Benchmark startup time of perls',
    default_precision => 0.001,
    participants => $participants,
};

1;
# ABSTRACT:
