#!/usr/bin/env perl
use strict;
use warnings;

my $INPUT = '/tmp/output_1.txt';
my $OUTPUT = '/tmp/output_2.txt';
my $SEPARATOR = '   ';

open(my $IN_FILE, $INPUT) or die $!; # open(my $FILE, '<', $INPUT)
open(my $OUT_FILE, '>', $OUTPUT) or die $!;

while (<$IN_FILE>) {
	# split the line between data and comment and remove extra spaces
	my @line = split(/#/); # split(/PATTERN/, $_)
	my @data_line = split(/\s+/, $line[0]);

	if (@data_line == 0) { # empty or comment line
		print $OUT_FILE $_;
	} else {
		# IP field is at most 15 char long
		$data_line[0] = sprintf("%-15s", $data_line[0]);

		print $OUT_FILE join($SEPARATOR, @data_line);

		# merge inline comment again
		if (@line > 1) {
			print $OUT_FILE $SEPARATOR.'#'.@line[1..$#line];
		} else {
			print $OUT_FILE "\n";
		}
	}
}

close($IN_FILE) or die $!;
close($OUT_FILE) or die $!;
