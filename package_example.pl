#!/usr/bin/perl -w

use 5.010
use strict;

use File::Find qw(find);
use File::Find::Closures qw(find_by_regex);

my ($wanted, $reporter) = find_by_regex(qr/*.pl/);

find ( $wanted, @search_dirs);

my @files = $reporter->();