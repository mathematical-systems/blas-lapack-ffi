#!/usr/bin/perl -i.orig -p -n
# -i.orig -p
# -n make pearl repeat the script for all the input files
# replace while (<>)
# ARGV : current file
# $_ : current line
# $. : line number
use IO::File;


# open file for update, file must exist
#$input = IO::File->new("+< essai.f")
#   or die "Couldn't open essai.f $!\n";
#$line = $input->getline();
#STDOUT->print($line) if $line=~ /SUBROUTINE/;
#$input->close();

# profile *.f

if ( $_!~ /^\*/ ) {
# get all the words of the line
	@allwords = split (/(\s+)/,$_);
# Verify line size < 72
	$size = 0;
	$i = -1;
	$nb_words = $#allwords;
	while ($i++ < $nb_words ) {
		    $size += length(@allwords[$i]);   }
	if ( $size > 72 ) {
#print "PROBLEM $ARGV:Total size = $size\n";
		$newline = @allwords[$nb_words-1];
		$#allwords = $nb_words-2;
		$_ = join ("",@allwords);
		$_ =  "$_\n     \$  $newline \n";
	}
	else {
		$_ = join ("",@allwords);
	}
}
