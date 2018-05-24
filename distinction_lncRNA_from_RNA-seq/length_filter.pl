use strict;
use warnings;

my $usage = "perl length_search.pl [input_filename]";

if($#ARGV<0){die $usage;}

open F, "$ARGV[0]" or die $!;
open K, ">length_over_200_po_lnc.diff" or die $!;
while(<F>){
  if($_ =~ /[\d+XY]:(\d+)-(\d+)/){
    my $end = $2;
	my $start = $1;
    if($end-$start>=200){
	  print K $_;
	}
  }
}
close K;
close F;
