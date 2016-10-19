use strict;
use MahlonSubroutine;

#read data from file and store it to a hash

my $file = "hashdata.txt";

#call the subroutine readFileToHash

my $hashRef = readFileToHash;

print "$hashRef\n";

foreach my $key (keys %$hashRef)
{

	print "$key\t$$hashRef{$key})";
}