use strict;
use warnings;

my $usage = "Usage: perl orf_filter.pl [input_file] [output_file]";
if($#ARGV<1){die "$usage";}
open K, "$ARGV[0]" or die $!;
open F, ">$ARGV[1]" or die $!;
$/ = ">";
while(<K>){
  if($_=~/[-+\d]\t(\d+)\t(\d+)/){
    if($2-$1<300){
	  print F $_;
	} 
  }
}
close K;
close F;
