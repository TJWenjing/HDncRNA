#This script is used to search each line's key words in the list file and return the Punmid id to output file.
use LWP::Simple;
open(FILE,"list_for_search.txt") || die "can not open the inputfile!";
chomp(@text=<FILE>);
open(OUT, "> search_result.txt") || die "Can't open file!\n";
for(my $i=0;$i<=$#text;$i++){
# Display current search item
$query="$text[$i]";
print $query."\n";
#assemble the esearch URL
$base='http://eutils.ncbi.nlm.nih.gov/entrez/eutils/';
$url = $base."esearch.fcgi?db=pubmed&term=$query&usehistory=y";
#post the esearch URL
$output = get($url);
# parse WebEnv, QueryKey and Count (# records retrieved)
$web = $1 if ($output =~ /<WebEnv>(\S+)<\/WebEnv>/);
$key = $1 if ($output =~ /<QueryKey>(\d+)<\/QueryKey>/);
$count = $1 if ($output =~ /<Count>(\d+)<\/Count>/);
# open output file for writing
print OUT $text[$i];
print OUT "\n";
# retrieve data in batches of 500
$retmax = 500;
for ($retstart = 0; $retstart < $count; $retstart += $retmax){
	$efetch_url=$base."efetch.fcgi?db=pubmed&WebEnv=$web";
	$efetch_url.="&query_key=$key&retstart=$retstart";
	$efetch_url.="&retmax=$retmax&rettype=uilist&retmode=text";
	$efetch_out=get($efetch_url);
	print OUT "$efetch_out";
	}
}
close OUT;
