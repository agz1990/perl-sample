#！/usr/bin/perl -w

use strict;
use 5.010;

use Fcntl qw(:seek);

my $string = 'abcdefghijklmnopqrstuvwxyz';

my $str = `dir`;
#print $str;

open my ($str_hd), '<', \$string;

#print $string;


# hash slices
my %officer=(
	"NAME" => "Tom Savage",
	"SSN"  => "510-22-3456",
	"DOB"  => "06/19/66",
);

my @info = qw(Marine Captain 50000);

@officer{'BRANCH', 'TITLE', 'SALARY'} = @info; # This is a hash slice

my @sliceinfo = @officer{'NAME', 'BRANCH', 'TITLE'};  # This is also a hash slice

print "The new values from the hash slice are: @sliceinfo\n\n";
print "The hash now looks like this\n";

foreach my $k (keys %officer){
	printf "Key: %-10sValue: %-15s\n", $k, $officer{$k};
}



# Nested hashes

my %students = (
	Math => {qw/Joc 100 Joan 95/},
	Science => { Bill => 85, Dan=> 76},
);

print "On the match test Joan got ";
print qq/$students{Math}->{Joan}. \n/;

print "On the science test Bill got ";
print qq/$students{Science}->{Bill}\n/;



# Anonymous arrays as keys in a hash
my %grades = (
	Math => [90, 100, 94],
	Science => [77, 87, 86],
	English => [65, 76, 99, 100],
);

print %grades, "\n";
print "All of the science grade are: @{$grades{Science}}\n";


# An array of hashes
my @stores = (
	{
		Boss => "Ari Goldberg",
		Employees => 24,
		Registers => 10,
		Sales => 15000.00,
	 },
	 {
		Boss => "Ben Chien",
		Employees => 12,
		Registers => 5,
		Sales => 3500.00,
	 },
);

print "The number of elements in the array: ", $#stores + 1, "\n"; # The number of the last subscript + 1

for (my $i=0; $i < $#stores + 1; $i++){
	foreach my $k (keys %stores[$i]){
#		my $a = ref %stores[$i];
#		print "$a\n";
		print $stores[$i]->{$k}, "\n";	# Access an array element
	}
	print "-" x 20, "\n"
}



# Seaching for  patterns in a list
my @list = qw(tomatoes tomorrow patatoes phantom Tommy);
my $count = grep( /tom/i, @list);
my @items = grep( /tom/i, @list);
print "Found items: @items\nNumber found: $count\n";



