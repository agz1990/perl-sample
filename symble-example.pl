#!/bin/perl -w

# packgage main 

use strict "vars";
use warnings;

our( @friends, @dogs, $key, $value); # Declaring variables

my ($name, $pal, $money);

$name = "Sunsanne";

@friends = qw(Joe Jeff Jan);

@dogs = qw(Guyson Lara Junior);

local $main::dude = "Ernie";

print $main::dude, "\n";

$pal = "Linda";
$money = 1000;

while(($key, $value) = each (%main::)){
	print "$key <=======> $value\n";
	
}