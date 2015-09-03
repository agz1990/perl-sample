#!/usr/bin/perl -w

use 5.010;
use Data::Dumper;

my $str ="
geneA	vector
geneA	vector
geneA	vector
geneA	vector
geneB	vector
geneB	vector
geneB	we
geneB	qw
geneC	we
geneC	qw
geneC	as
geneC	er
geneB	vector
geneB	vector
geneB	we
geneB	qw
";

open my $str_fh, '<', \$str;

my %dic = ();
while (<$str_fh>) {
	my ( $k, $v ) = split;

	next if !$k;

	if ( exists $dic{$k} ) {
		push $dic{$k}, $v;
	}
	else {

		$dic{$k} = [$v];
	}

}
print  Dumper( \ @{$dic{'geneB'}} ), "\n"; ;
print Dumper( \%dic ), "\n";

#my $len = @ { $dic{'A'}};
#
#
#my @arr = qw [1 2 3];
#my $arr_ref = \ @arr;
#
#
#$str = \ "len";
#
#
#say '@arr = ' . @arr ;
#say '\@arr =' . \@arr;
#say '@$arr_ref =' . @$arr_ref;
#say '@{$arr_ref} =' . @{$arr_ref};
#
#
#say '$dic{\'A\'} = ' . $dic{'A'};
#say '@{$dic{\'A\'}} = ' . @ {$dic{'A'}};

#print $dic{'A'}->[1];

#print Dumper( \%dic ), "\n";

#print %hash_IN{'DIS3L2'};