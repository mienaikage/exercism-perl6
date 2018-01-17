#!/usr/bin/env perl6
use v6;
use Test;
use lib my $dir = $?FILE.IO.dirname; #`[Look for the module inside the same directory as this test file.]
use JSON::Fast;

my Version:D $version = v2; #`[The version we will be matching against the exercise.]
plan 3; #`[This is how many tests we expect to run.]

#`[Check that the module can be use-d.]
use-ok 'HelloWorld' or bail-out;
use HelloWorld;

#`[If the exercise is updated, we want to make sure other people testing
your code don't think you've made a mistake if things have changed!]
if HelloWorld.^ver !~~ $version {
  warn "\nExercise version mismatch. Further tests may fail!"
    ~ "\nHelloWorld is {HelloWorld.^ver.gist}. "
    ~ "Test is {$version.gist}.\n";
}

my $c-data = from-json $=pod.pop.contents;
# Go through the cases and check that &hello gives us the correct response.
is hello, |.<expected description> for @($c-data<cases>);

=head2 Canonical Data
=begin code

{
  "exercise": "hello-world",
  "version": "1.0.0",
  "cases": [
    {
      "description": "Say Hi!",
      "property": "hello",
      "expected": "Hello, World!"
    }
  ]
}

=end code
