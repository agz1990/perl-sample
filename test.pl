#!/usr/bin/perl -w
use Data::Dumper;

open IN,"testhasharray1.txt";

my %hash_IN=();
while(<IN>){
    chomp;
    next if(!$_);
    my @line = split("\t",$_);
    if(exists $hash_IN{$line[1]}){
       push $hash_IN{$line[1]},"$line[4]:$line[5]";
    }
    else{
       $hash_IN{$line[1]}=["$line[4]:$line[5]"];
    }

    #push(@{$hash_IN{$line[1]}},"$line[4]:$line[5]");
    #@{$hash{$key}}
}






