use strict;
####################################################
# Subroutine writeHash
####################################################
# Parameter
#       Reference to a hash
#       File name to write
# Return
#       Writes the sorted hash to a file
####################################################
sub writeHash
{
        my($refHash, $file) = @_;
        open (FH, ">", $file) || die "can't open file $file";

        foreach my $key(sort keys %$refHash)
        {
                print FH "$key\t$$refHash{$key}\n";
        }
        close FH;
}
####################################################
# Subroutine printHash
####################################################
# Parameter
#       Reference to a hash
# Return
#       Writes the sorted hash to screen
####################################################
sub printHash
{
        my($refHash) = @_;

        foreach my $key(sort keys %$refHash)
        {
                print "$key\t$$refHash{$key}\n";
        }
}
####################################################
# Subroutine writeArray
####################################################
# Parameter
#       Reference to an array
#       File name to write
# Return
#       Writes the sorted array to a file
####################################################
sub writeArray
{
        my ($refArray, $file) = @_;
        open (FH, ">", $file) || die "can't open file $file";

        foreach my $value (sort @$refArray)
        {
                print FH "$value\n";
        }
        close FH;
}
####################################################
# Subroutine printArray
####################################################
# Parameter
#       Reference to an array
# Return
#       Prints the sorted array on the screen
####################################################
sub printArray
{
        my ($refArray) = @_;

        foreach my $value (sort @$refArray)
        {
                print "$value\n";
        }

}
####################################################
# Subroutine printArrayUnsort
####################################################
# Parameter
#       Reference to an array
# Return
#       Prints the sorted array on the screen
####################################################
sub printArrayUnsort
{
        my ($refArray) = @_;

        foreach my $value (@$refArray)
        {
                print "$value\n";
        }

}
####################################################
# Subroutine readFileToArray
####################################################
# Parameter
#       File name to read
# Return
#       Reference to An array of lines
####################################################
# Make sure you have the statements to accomplish the following jobs
                 #remove next line symbol
                 #remove leading spaces
                 #remove trailing spaces
                 #remove " from the string if there is one

sub readFileToArray
{
        my ($file) = @_;
        my @array;
        open(FH, "<", $file) || die "can't open file $file\n";
        while(<FH>)
        {
                my $line = $_;
                chomp $line;
                $line =~ s/^\s+//;
                $line =~ s/\s+$//;
                $line =~ s/\"//g;
                push(@array, $line);
        }
        close FH;
        return \@array;
}


####################################################
# Subroutine readFileToHash
####################################################
# Parameter
#       File name to read
# Return
#       Reference to a hash
####################################################
# Make sure you have the statements to accomplish the following jobs
                 #remove next line symbol
                 #remove leading spaces
                 #remove trailing spaces
                 #remove " from the string if there is one

sub readFileToHash
{
        my($file) = @_;
        my %hash = ();

        open(FH, "<", $file) || die "can't open file $file";

        while(<FH>)
        {
                my $line = $_;
                chomp $line;
                $line =~ s/^\s+//;
                $line =~ s/\s+$//;
                $line =~ s/\"//g;

                my ($key, @temp) = split("\t", $line);
                my $value = join("\t", @temp);

                $hash{$key} = $value;
        }
        close FH;

        return \%hash;
}


####################################################
# Subroutine findFrequency
####################################################
# Parameters
#       Reference to a list or array of items
# Return
#       Reference of a hash: Keys are unique items and values are frequency
####################################################
sub frequency
{
        my ($refA) = @_;
        my %hash = (); # Hash to store the unique items and their frequencies

        foreach my $element (@$refA)
        {
                $hash{$element}++;
        }

        return \%hash;
}
1;