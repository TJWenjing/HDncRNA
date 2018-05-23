use strict;
use warnings;

my @disease;
my @lncRNA; 
my $combine;

open(FILE3,"> final_result.txt") || die"can not create that file!";
open(FILE2,"heart_disease_name_final.txt") || die "can not open that file!";
chomp(@disease=<FILE2>);
close FILE2;
open(FILE1,"lncRNA.txt") || die "can not open that file!";
chomp(@lncRNA=<FILE1>);
close FILE1;
for(my $j=0;$j <= $#lncRNA;$j++){
	for(my $i = 0;$i <= $#disease;$i++){
		$combine = $lncRNA[$j] ." AND ". $disease[$i];
		print FILE3 $combine;
		print FILE3 "\n";
		}
	}	
close FILE1;
close FILE2;
