#!/usr/bin/perl -w

#-- Pragmas --------------------------------------------------------------------

use 5.010;
use strict;
use warnings;

use lib qw(
    lib
    t/lib
    ../lib
);

# ENVIRONMENT ------------------------------------------------------------------

use Test::More;

#-- verify load the module

BEGIN {
    eval 'use Test::NoWarnings';    ## no critic
    plan skip_all => 'because Test::NoWarnings required for testing' if $@;
}

plan 'no_plan';

#-- load the modules -----------------------------------------------------------

use Kafka qw (
    $BITS64
);

#-- setting up facilities ------------------------------------------------------

#-- declarations ---------------------------------------------------------------

#-- Global data ----------------------------------------------------------------

# INSTRUCTIONS -----------------------------------------------------------------

eval { my $ret = unpack( 'Q', ( 255 ) x 8 )."\n" };

if      ( $@ )  { ok( !$BITS64, 'Your system not supports 64-bit integer values' ); }
else            { ok(  $BITS64, 'Your system supports 64-bit integer values' ); }

# POSTCONDITIONS ---------------------------------------------------------------
