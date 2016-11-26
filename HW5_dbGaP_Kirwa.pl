use strict;
use warnings;
use mahlon;
#############################################################
# Final Project
# Research with dbGaP data
#############################################################

#############################################################
# Put the raw data into an array using readFileToArray Subroutine
#############################################################
my $inFile = "kirwa5.txt";
#my $inFile = "testdata.txt";
my $refA = readFileToArray($inFile);
#print "$refA\n";

#############################################################
# Cleaning by removing comments that start with # symbol
#############################################################

#############################################################
# Array operations push, pop, shift, unshift
#############################################################
=comment
my @x = (1, 2, 3);
print "@x\n";

push (@x, 'a', 'b'); # Pushing elements at the end of array
print "@x\n";

shift (@x); # Remove one element from the beginning of an array
print "@x\n";

pop (@x); # Remove one element from the end of an array
print "@x\n";

unshift (@x, 'y'); #Pushing elements at the beginning of array
print "@x\n";
=cut

for (my $i = 0; $i <= 20; $i = $i +1)
{
	shift(@$refA);
}

#print "@$refA\n";
#my $outfile = "clean_data.txt";
#writeArrayUnsort($refA, $outfile);

#############################################################
# Isolate data for P-Value, Rank, Chr ID, Allele 1, Allele 2, Minor Allele, &
# Coded Allele
#############################################################
my @clean = ();
foreach my $line(@$refA)
{
	my @temp = split("\t", $line);
	my $cleanData = join("\t", $temp[3], $temp[4], $temp[6], $temp[11], $temp[12], $temp[13], $temp[19]);
	
	push(@clean, $cleanData);
	#print "@clean\n";
}


my $outFile = "HW5_dbGaP_clean_Kirwa.txt";
writeArray(\@clean, $outFile);