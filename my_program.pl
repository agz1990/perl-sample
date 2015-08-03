#!/usr/bin/perl -w

print join " ", keys %::;

sub max{
	my($max_so_far) = shift @_;
	foreach(@_){
		if($_ > $max_so_far){
			$max_so_far = $_;
		}
	}
	
	$max_so_far
}

sub which_element_is{
	my($what, @array) = @_;
	foreach(0..$#array){
		if($what eq $array[$_]){
			return $_;
		}
		
	}
	-1;
}


$maxinum = &max(1,5,2,6,8);


$item = &which_element_is ("abc",  qw/ x  xxx abc ddd /);

print $item;



print $maxinum
