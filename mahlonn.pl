use strict;
use warnings;
use mahlon;
#############################################################################################################
#
# Working on Raw Data
# Learning Objective:
#       How to use Array and Hash to Clean the Raw Data
# Source of Raw Data: Gene Database from NCBI (National Center for Biotechnology Information)
# Output: Three columns of data with column headings org_name, Gene ID, Symbol
#############################################################################################################

# Calling readFileToArray subroutine
my $file = "gene_result_asthma.txt";
my $refA = readFileToArray($file);

print "$refA\n";

# Calling printArray subroutine to check if it works 
#printArray($refA);

my @clean = ();
foreach my $line (@$refA)
{
        # Split each line of record and store into an array
        my @temp = split("\t", $line);
        
        #Collect the columns of data we need
        my $cleanData = join("\t", $temp[1], $temp[2], $temp[5]);
        
        # Check to see whether the program is correct using a print statement
        #print "$cleanData\n"
        
        push(@clean, $cleanData);
}

#Sending the cleaned data to a file
my $outfile = "cleanData.txt";
writeArray(\@clean, $outfile);

###########################################################################
#Question-1: What are the species the data coming from?
#Question-2: How mamy unique genes are there?
#Question-3: How many unique gene IDs are there?
#Question-4: Are these three questions similar?
#Answer: Yes. Write a subroutine to find the answer to these questions
#Need a subroutine to find the frequency
########################################################################3###

#isolating the species column from @clean array

my @species;
my @geneID;
my @geneSymbol;

foreach my $element(@clean)
{

	my@temp= split("\t", $element);
	push(@species,$temp[0]);#creates clean array  out of cleandata
	push(@geneID,$temp[1]);
	push(@geneSymbol,$temp[2]);

}

#Finding uniques species names and their frequencies

my $refH = frequency(\@species);#use backlash because it is a reference of species array. To make it refence you use backlash similarly hash

printHash($refH);

my $fileSpecies="species.txt";
writeHash($refH,$fileSpecies);






 
 

