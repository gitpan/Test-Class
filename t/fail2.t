#! /usr/bin/perl -w

use strict;

$ENV{TEST_VERBOSE}=0;

package Object;

sub new {return(undef)};

package main;
use base qw(Test::Class);
use Test::Builder::Tester tests => 2;
use Test::More;

sub _test_new : Test(3) {
	my $self = shift;
	isa_ok(Object->new, "Object") 
		|| $self->FAIL_ALL('cannot create Objects');
};

test_out("1..3");
test_out("not ok 1 - The object isa Object");
test_err("#     Failed test (t/fail2.t at line 18)");
test_err("#     The object isn't defined");
test_out("not ok 2 - cannot create Objects");
test_err("#     Failed test (t/fail2.t at line 18)");
test_out("not ok 3 - cannot create Objects");
test_err("#     Failed test (t/fail2.t at line 18)");


plan tests => 3;

__PACKAGE__->runtests;

END {
	test_test("FAIL_ALL in method");
	is($?, 255, "exit value okay");
	$?=0;
};
