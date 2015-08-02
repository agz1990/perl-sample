#!/usr/bin/perl -w


use 5.010;
say "Hello World!";

use File::Slurp;

my @arr = read_file('.gitignore');
print @arr;

for (@INC){
	say;
}

