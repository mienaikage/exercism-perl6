#!/usr/bin/env perl6
use v6;
use JSON::Fast;

my $base-dir := $?FILE.IO.resolve.parent.parent;
my @deprecated := from-json($base-dir.add(‘config.json’).slurp)<exercises>.grep(*<deprecated>).map(*<slug>).List;

for $base-dir.add(‘exercises’).dir {
  if .basename (elem) @deprecated {next}
  .add(‘Example.pm6’).rename(.dir.first({.extension eq ‘pm6’ && .basename ne ‘Example.pm6’}));
}
