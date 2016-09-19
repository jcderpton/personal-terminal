#!/usr/bin/env perl

use strict;
use Cwd;
use warnings;

sub main {

  my $branch = $_[0];

  if ($branch) {
    my $exit = system("git checkout $branch");

    if ($exit != 0) {
      return $exit;
    }
  }

  my @branches = split(/\n/, `git branch | grep -v '*' | grep -v 'master'`);

  for my $branch(@branches) {
    $branch =~ s/^\s+//;
    my $exit = system("git branch -D $branch\n");
    if ($exit != 0) {
      return $exit;
    }
  }
  
  return 0;
}

exit main(shift @ARGV);
