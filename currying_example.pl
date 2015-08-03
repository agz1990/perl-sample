#!/usr/bin/perl -w

use 5.010;
use strict;


sub  my_sorted_grep{
	my( $pattern, $array_ref ) = @_;
	
	my @results = sort grep /$pattern/o, @$array_ref;
	
	wantarray ? @results : scalar @results;
}

my @input = qw (
%common
dbuser=dqasdba
dbsid=dqas
amq_conn_str=failover:(tcp://192.168.56.58:61616)
to_queue=dqaspro.Scheduler 
hdfshome=/data/dqas
coll_err_dir=/opt/mcb/dqas/data/err_file
);


my @results = my_sorted_grep qr/Scheduler/, \@input;

print @results;
