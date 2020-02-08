#!/usr/bin/env perl
use strict;
use warnings;

my $INPUT = '/tmp/output_1.txt';
my $OUTPUT = '/tmp/output_2.txt';
my $SEPARATOR = '   ';
my $N_FIELDS = 10;

open(my $IN_FILE, $INPUT) or die $!; # open(my $FILE, '<', $INPUT)
open(my $OUT_FILE, '>', $OUTPUT) or die $!;

my @column_sizes = (0) x $N_FIELDS;

while (<$IN_FILE>) {
	# split the line between data and comment and remove extra spaces
	my @line = split(/#/); # split(/PATTERN/, $_)
	my @data_line = split(/\s+/, $line[0]);

	# check the size for each data field
	for (my $col = 0; $col < $#data_line; $col++) {
		if (length $data_line[$col] > $column_sizes[$col]) {
			$column_sizes[$col] = length $data_line[$col];
		}
	}
}

seek($IN_FILE, 0, 0);
while (<$IN_FILE>) {
	# split the line between data and comment and remove extra spaces
	my @line = split(/#/); # split(/PATTERN/, $_)
	my @data_line = split(/\s+/, $line[0]);

	if (@data_line == 0) { # empty or comment line
		print $OUT_FILE $_;
	} else {
		# format each field to the max size
		for (my $col = 0; $col < $#data_line; $col++) {
			my $size = $column_sizes[$col];
			$data_line[$col] = 
			        sprintf("%-${size}s", $data_line[$col]);
		}

		print $OUT_FILE join($SEPARATOR, @data_line);

		# merge inline comment again
		if (@line > 1) {
			print $OUT_FILE $SEPARATOR.'#'.@line[1..$#line];
		}
	}
}

close($IN_FILE) or die $!;
close($OUT_FILE) or die $!;
