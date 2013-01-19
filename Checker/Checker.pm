package Checker::Checker;

use strict;
use warnings;
use Carp;

require Exporter;

our @ISA = qw/Exporter/;

our %EXPORT_TAGS = (
	'all' => [ qw/
		assert_equals string_comparator number_comparator
	/ ]
);

our $EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.01';

sub assert_equals(&$$;$) {
	my $comparator = shift;
	my $expected = shift;
	my $actual = shift;
	my $explanation = shift;

	my ($package, $filename, $line) = caller;

	my $compare_result = &$comparator($expected, $actual);
	
	if ( $compare_result != 0) {
		print "assert_equals fails at $package\:\:$filename line $line : [$actual] not equals to [$expected].\n";
		print $explanation if defined $explanation;
		print "\n";
	}
	return 1;
}


### Comparators

sub string_comparator($$) {
	my ($string1, $string2) = @_;

	if($string1 eq $string2) {
		return 0;
	} elsif($string1 lt $string2) {
		return -1;
	} else {
		return 1;
	}
}

sub number_comparator($$) {
	my ($number1, $number2) = @_;

	if($number1 == $number2) {
		return 0;
	} elsif($number1 < $number2) {
		return -1;
	} else {
		return 1;
	}
}








1;

__END__

=head1 NAME

	Checker::Checker - text validation functions.

=head1 SYNOPSIS

	use Checker::Checker;

=head1 DESCRIPTION

	Bla bla

=head1 EXPORTS

	'all'

=head1 SUBS
	
	assert_equals

	string_comparator

	number_comparator

=cut