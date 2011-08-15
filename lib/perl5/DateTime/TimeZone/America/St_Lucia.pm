# This file is auto-generated by the Perl DateTime Suite time zone
# code generator (0.07) This code generator comes with the
# DateTime::TimeZone module distribution in the tools/ directory

#
# Generated from /tmp/hraLGAMw6M/northamerica.  Olson data version 2011h
#
# Do not edit this file directly.
#
package DateTime::TimeZone::America::St_Lucia;
BEGIN {
  $DateTime::TimeZone::America::St_Lucia::VERSION = '1.35';
}

use strict;

use Class::Singleton;
use DateTime::TimeZone;
use DateTime::TimeZone::OlsonDB;

@DateTime::TimeZone::America::St_Lucia::ISA = ( 'Class::Singleton', 'DateTime::TimeZone' );

my $spans =
[
    [
DateTime::TimeZone::NEG_INFINITY,
59611176240,
DateTime::TimeZone::NEG_INFINITY,
59611161600,
-14640,
0,
'LMT'
    ],
    [
59611176240,
60305313840,
59611161600,
60305299200,
-14640,
0,
'CMT'
    ],
    [
60305313840,
DateTime::TimeZone::INFINITY,
60305299440,
DateTime::TimeZone::INFINITY,
-14400,
0,
'AST'
    ],
];

sub olson_version { '2011h' }

sub has_dst_changes { 0 }

sub _max_year { 2021 }

sub _new_instance
{
    return shift->_init( @_, spans => $spans );
}



1;
