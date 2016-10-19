use strict; 
#subroutines
#writehash
#printhash - printing to the screen

#parameters
#  refernce to hash- give information about hash and give file name also. File name is the second parameter
#the two parameters:
		#1. reference to hash 
		#2.File name to write 
#Should also return the hash 
#writes the sorted hash file 

sub writeHash
{
	#@_ is a default array and it stores the list of parameters of the subroutine
	#you need an array because you can have more than one parameter

	my ($refHash, $file) = @_;
	open(FH,">",$file) || die "can't open file $file";
	#you have to isolate the key so you can use it 
	#%refrence to hash
	#%$reference to get the whole hash....to make it hash
	foreach my $key(sort keys %$refHash)
	{
		#$refHash 
		print FH "$key\t$$refHash{$key}\n"; #if you dont use file handle it is going to print on the screen. 
		#we want it to write on the file

	}

	close FH;#closing the file handle
}
1;#tells perl that this is the perl module
#parameter
#	file name to read
#return
#	refence to hash
sub readFileToHash
{
	my ($file)=@_;
	my %hash=();

	open(FH, "<",$file ) || die "can't open the file, $file";

	while(<FH>)
	{
		my $line= $_;#after reading it, I need to store it somewhere $_ is the default scalar variable to hold a value
		chomp $line;#remove next line symbol
		#n =~ this is binding operator
		# ^ begining of line
		# S stands for substitute you are substituting on the values
		# \S represents blank space
		# + 1 or more
		# // represents regular expression
		# S/^\S+/ regular expressions for 1 or more blank spaces for the beginning of the line
		$line =~ s/^\s+//; #removing space with empty string..blank space and empty string are two diffent things. 
		#First S means substitute. \s represents blank space. there might be more than one blank space + takes care of that
		#$ before embedded new line
		#s/// substitute the spaces is there with an empty string
		$line =~ s/\s+$//; #removing trailing spaces. 
		#s///g Substituion operation globally. Removes all the quotation marks as opposed to one
		#for example  AMM "Ananda M Mondal" it would remove both the quotes
		$line =~ s/\"//g; #remove " symbol from the string if there is one

		#lets say we have key= AMM  tab value= "Ananda M Mondal" tab value= 1111

		my ($key, @temp) = split ("\t", $line); #split the string when you see a tab
		#when you split it you can have more columns, Using a scalar variable and array??????
		my $value= join("\t", @temp); #joining the array elements separated by tab

		# putting the hash elements into the hash

		$hash{$key}= $value;		
	}

close FH;
1:

return %hash; #return the whole hash. This is too much to transfer the whole hash. Just transfer the reference(address) instead of everything

return \%hash; #returning the reference or address



}