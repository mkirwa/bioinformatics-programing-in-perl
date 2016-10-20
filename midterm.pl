use strict;
#use warnings;
use mahlon;
#############################################################################################################
#midterm
# Working on Raw Data: Geo profiles data
# Learning Objective:
#       How to use Array and Hash to Clean the Raw Data
# Source of Raw Data: Gene Database from NCBI (National Center for Biotechnology Information)
# Output: Five columns of data with column headings serial #, Gene symbol, GDS, Sample, Organism
#############################################################################################################

#putting data from file to array

my $inFile="geoprofiles_result_asthma.txt";
my $refA = readFileToArray($inFile);


#isolating serial number and gene symbol
for (my $i=1; $i<scalar@$refA; $i=$i+7)
{
	my $line =$$refA[$i];
	print "$line\n";
}





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

##################################################
# Work with clean data
# Question-1: What are the species the data is coming from?
# Question-2: How many unique genes are there?
# Question-3: How many unique gene IDs are there?
# Question-4: Are these three questions similar?
# Answer: Yes. Write a subroutine to find the answer to these questions.
# Need a subroutine to find the frequency
##################################################

# Isolating the species, geneID, and geneSymbol columns from the array @clean
my @species;
my @geneID;
my @geneSymbol;
foreach my $element (@clean)
{
        my @temp = split("\t", $element);
        push(@species, $temp[0]);
        push(@geneID, $temp[1]);
        push(@geneSymbol, $temp[2]);
}

# Finding unique species names and their frequencies
my $speciesHash = frequency(\@species);
print"\nFrequencies for Gene Species\n";
printHash($speciesHash);

my $outSpecies = "HW3_Species_Kirwa.txt";
writeHash($speciesHash, $outSpecies);

#Finding unique gene ID and their frequencies
my $geneIDHash = frequency(\@geneID);
print"\nFrequencies for Gene ID\n";
printHash($geneIDHash);

my $outGeneID = "HW3_GeneID_Kirwa.txt";
writeHash($geneIDHash, $outGeneID);

# Finding unique gene symbols and their frequencies
my $geneSymbolHash = frequency(\@geneSymbol);
print"\nFrequencies for Gene Symbol\n";
printHash($geneSymbolHash);

my $outGeneSymbol = "HW3_GeneSymbol_Kirwa.txt";
writeHash($geneSymbolHash, $outGeneSymbol);


