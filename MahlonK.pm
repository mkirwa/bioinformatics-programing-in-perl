
# Subroutine writeArray

#Two writeArray, and readFileToAnArray
#################################
# Parameter
#       Reference to a an array
#       File name to write
# Return
#       writes the sorted hash to a file
#################################
sub writeArray
{
         ($refArray, $file) = @_; #array stored list of parameters of subroutine @_ is the default array (2 elements reference and file)
        open(FH, ">", $file) || die " can't open file $file";
        
        # foreach my $key ( sort keys @$refArray)
        # {
        # print FH "$key\t$$refArray{$key}\n";
        # print "$key\t$$refArray{$key}\n";
        # }
        
        #sort the reference Array
        @sorted_array = sort @$refArray;
        
        foreach $line (@sorted_array){
                
                print FH "$line\n";
                print "$line\n";
                
        }
        close FH; 
}


#################################
# Subroutine readFileToArray
#################################
# Parameter
#       File name to read 
# return
#################################
#       Reference to Array

#################################
sub readFileToArray
{
        ($file) = @_;
        @x;
        
        print "Check";
                
        open(FH, "<" , $file) || die "Can't open file $file"; # When read use "<" use while loop
                
        while(<FH>)
        {
                my $line = $_; # is the default scalar varible to hold a value. 
                chomp $line; #remove next line symbol
                # =~ binding operator 
                # ^ beginning of a line or string
                # S stands for substitute
                #\S represents blank space
                # + 1 or more
                # / / represents a regular expression for empty string
                # /^\S+/ regular expression for 1 or more blank spaces at the beginning of a line.  
                $line =~ s/^\s+//;
                #First S means substitute. \s represents blank space. there might be more than one blank space + takes care of that
                #$ before embedded new line
                #s/// substitute the spaces is there with an empty string
                $line =~ s/^\s+$//; #removing trailing spaces. 
                #s///g Substituion operation globally. Removes all the quotation marks as opposed to one
                #for example  AMM "Ananda M Mondal" it would remove both the quotes
                $line =~ s/\"//g; #remove " symbol from the string if there is one

                #lets say we have key= AMM  tab value= "Ananda M Mondal" tab value= 1111

                #my ($key, @temp) = split ("\t", $line); #split the string when you see a tab
                #my $value= join("\t", @temp); #joining the array elements separated by tab
                        
                # putting the array elements into an array 

               push @x, $line;            
        }

        close FH;

#return @array; #return the whole array . This is too much to transfer the whole aray. Just transfer the reference(address) instead of everything

        return \@x; #returning the reference or address

}
 # This statement makes this file a PERL Module.

# Subroutine writeHash

#Two writeHash, and readFileToHash
#################################
# Parameter
#       Reference to a hash
#       File name to write
# Return
#       writes the sorted hash to a file
#################################
sub writeHash
{
        ($refHash, $file) = @_; #array stored list of parameters of subroutine @_ is the default array (2 elements reference and file)
        open(FH, ">", $file) || die " can't open file $file";
        
        foreach my $key ( sort keys %$refHash)
        {
        print FH "$key\t$$refHash{$key}\n";
        }
        close FH; 
}


#################################
# Subroutine readFileToHash
#################################
# Parameter
#       File name to read 
# return
#################################
#       Reference to hash

#################################
sub readFileToHash
{
        ($file) = @_;
        %hash = ();
                
        open(FH, "<" , $file) || die "Can't open file $file"; # When read use "<" use while loop
                
        while(<FH>)
        {
                $line = $_; # is the default scalar varible to hold a value. 
                chomp $line; #remove next line symbol
                # =~ binding operator 
                # ^ beginning of a line or string
                # S stands for substitute
                #\S represents blank space
                # + 1 or more
                # / / represents a regular expression for empty string
                # /^\S+/ regular expression for 1 or more blank spaces at the beginning of a line.  
                $line =~ s/^\s+//;
                #First S means substitute. \s represents blank space. there might be more than one blank space + takes care of that
                #$ before embedded new line
                #s/// substitute the spaces is there with an empty string
                $line =~ s/^\s+$//; #removing trailing spaces. 
                #s///g Substituion operation globally. Removes all the quotation marks as opposed to one
                #for example  AMM "Ananda M Mondal" it would remove both the quotes
                $line =~ s/\"//g; #remove " symbol from the string if there is one

                #lets say we have key= AMM  tab value= "Ananda M Mondal" tab value= 1111

                 ($key, @temp) = split ("\t", $line); #split the string when you see a tab
                $value= join("\t", @temp); #joining the array elements separated by tab

                # putting the hash elements into the hash

                $hash{$key}= $value;            
        }

        close FH;

#return %hash; #return the whole hash. This is too much to transfer the whole hash. Just transfer the reference(address) instead of everything

        return \%hash; #returning the reference or address

}

1; # This statement makes this file a PERL Module.