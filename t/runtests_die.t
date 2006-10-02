#! /usr/bin/perl -T

use strict;
use warnings;

package Object;
sub new { undef };

package Foo;
use Test::More;
use base qw(Test::Class);

sub test_object : Test(2) {
	my $object = Object->new;
	isa_ok($object, "Object") or die("could not create object\n");
	is($object->open, "open worked");
};

package main;
use Test::Builder::Tester tests => 1;
$ENV{TEST_VERBOSE}=0;
my $SEP = '/'; # use forward slash even on Win32. '\\' would cause regex failure
test_out("not ok 1 - The object isa Object");
test_err("#     Failed test (t${SEP}runtests_die.t at line 15)");
test_err("#     The object isn't defined");
test_out("not ok 2 - test_object died (could not create object)");
test_err("#     Failed test (t${SEP}runtests_die.t at line 28)");
Foo->runtests;
test_test("early die handled");
