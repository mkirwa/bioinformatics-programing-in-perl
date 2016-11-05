use strict;
use midterm_h3_mahlon;
use warnings;
######################################
# Midterm: Working on Raw Data: GEO Profiles data
# Learning Objective:
#  How to use Array and Hash to Clean the Raw Data
# Source of Raw Data: GEO Profiles Database from NCBI( National Center for Biotechnolgy Information)
# Output: Five columns of data with column headings: Serial #, Gene Symbol, GDS #(Data set), Samples,Organism(Tabular Data)
###################################################################################
######################################################################################################################
# Learning objective:
# Regular Expression, Pattern Matching, Binding Operator to extract meaningful information from text like data
####################################################################################################################
#Regular expressions are used in finding a pattern in a string.
#regular expressions are made from towo kinds of characters
# 1. Characters that matches themselves. Examples 'a', 'z'. 'A', etc.
# 2. Metacharacteristics have special meaning: Example: () are used to group other characters,
# Another example is "\" (metacharacter - back slash)
# Regular expression pattern goes inside to two forward slashes
# Metacharacters: \ | ()| {} | $  * + ? .
# Period or dot represents any character except new line
# |( alteration or  OR): a|b|c  = [abc] "Looking for a or b or c at a certain postition
# [] represents a character class: [A-Za-z0-9]
# Characters represent themselves Metacharacters do not represent itself.

#my $inFile = "geoprofiles_result_asthma.txt";
my $inFile = "geoprofiles_result_asthmacopy.txt";
open(FH, "<", $inFile) || die "cant open file $inFile";

# Decompose the raw data into "record" as seperated by double newlines "\n\n"
my @records;
{
 my @raw_file_data = <FH>; # Reading files line by line and storing them into an array
 my $raw_string_data = join("", @raw_file_data); # Putting array into a string , with ""indicateds empty string.
 @records = split("\n\n", $raw_string_data);  # Since each record is seperated by a blank line ("\n\n")
}
close FH;
#printArrayUnsort(\@records);
print "Number of Elements:", scalar(@records), "\n";



my @clean = ();



foreach my $record (@records)

{
 my @lines = split("\n", $record); # each record has 6 lines
 #Isolating serieal number from the first line of record using regular expression and pattern matching
 my ($si_Number) = ($lines[0] =~ m/^(\d+)\./);  # since  the zeroth element contains the serial number (m stands for matching)
 #Explanation of regular expression (/ /)
 # This regular expression (/ /) find the pattern, as the beginning of the string (^),
 #consist of one or more (+) decimal digits (\d+), followed by a period or dot(\.)
 # What is captured ?: From this regular expression we want to capture decemial digits only
 # and to do that use parenthesis, (\d+)

 print "$si_Number\n"; # To check the result
#Curly braces
#Isolating gene symbol from the 2nd line of record using regualr expression and pattern matching
my ($gene)=($lines[1] =~ m/^Annotation: ([A-Za-z0-9]+)\-*([A-Za-z0-9]+), .+$/); # Looking fo any of these typesof characters + gives one or more of that character#Dot plus = any characters


			#bypassing record that does not have the gene symbol. You have to use a gene statement

			if(not $gene) # we want to skip this record
				{

					next;
				}

#exept new line
#Explanation of regular expression (/ /)
#This is regular expression (/ /) find the pattern, at the beginning of the string(^), containing "Annotation: ",followed
#  by one or more (+) charachters from character class ([A-Za-z0-9] followed by a coma and space(, )
#  and ends ($) with one or more number of any character except newline(.+)
# What is captured? : From this regular expression we want to capture gene symbol, which appears after "Annotation: "
#  So, we put parenthesis for that part of the regular expression.
print "$gene\n"; #To check the result


####################################################################################################
###			Isolating Organisms name
####################################################################################################


my ($organism)=($lines[2] =~ m/^Organism: (.+)$/); 

print "$organism\n";

####################################################################################################
###			Isolating GDS
my ($GDS)=($lines[3] =~ m/ (GDS[0-9]+)/); 

print "$GDS\n";

#############################


my ($sample)=($lines[4] =~ m/([0-9]+ samples)/); 

print "$sample\n";




my $string = "$si_Number\t$gene\t$GDS\t$organism\t$sample";
	#print "$string";


	push (@clean,$string);	




}




my $sample = "HW4_Output_Kirwa.txt.";
writeArray(\@clean,$sample);


=comment
# Putting data from file to an array
my inFile = "geoprofiles_result_asthma.txt";
my refA = readFileToArray($inFile);
print "refA\n";
#printArrayUnsort($refA);
# Isolate individual record
my $rawstring =join("", @$refA); # Join all array elements into one large string joining
my $raw_string =~ s/\r//g;
my @records = split("\n\n", $raw_string);