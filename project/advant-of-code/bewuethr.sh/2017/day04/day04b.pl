#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';

my $fname = shift;

open my $fh, "<", $fname
    or die "Can't open $fname: $!";

my $ctr = 0;

while (my $line = <$fh>) {
    chomp $line;
    my @arr = map { my @chars = split //, $_; join '', sort @chars } split / /, $line;
    $ctr++ if not ( (join ' ', @arr) =~ /(\b\w+\b).*\1/ );
}

say $ctr;
