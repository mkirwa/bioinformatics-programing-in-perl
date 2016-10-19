use strict;
use warnings;
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

my $file="geoprofiles_result_asthma.txt"
my $refA = readFileToArray($file);

