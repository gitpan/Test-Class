#! /usr/bin/perl -w

use strict;
use base qw(Test::Class);
use Test::Builder::Tester tests => 2;
use Test::More;

sub _only : Test(setup) {
	my $self = shift;
	$self->SKIP_ALL("skippy");
};

sub test : Test(3) { die "this should never run!" };

test_out("1..3");
test_out("ok 1 # skip skippy");
test_out("ok 2 # skip skippy");
test_out("ok 3 # skip skippy");

plan tests => 3;
$ENV{TEST_VERBOSE}=0;
__PACKAGE__->runtests;

END {
	test_test("SKIP_ALL skipped tests");
	is($?, 0, "exit value okay");
	$?=0;
};
