#!/usr/bin/perl -w

system("ls *.[cf] > ls_res");

$file = "ls_res";
open(INFO,$file);
@awkf = <INFO>;
close(INFO);


$s = "SLASRC = ";
$d = "DLASRC = ";
$c = "CLASRC = ";
$z = "ZLASRC = ";
$aux = "AUXSRC = ";
foreach $t (@awkf)
{
	$t=~s/\n//;
	@words=split(/ /,$t);

	foreach $word (@words)
	{
		$word =~ s/\.c/.o/;	
		$word =~ s/\.f/.o/;	
		if ($t=~/^c/)
		{
			if ($t=~/^cs/)
			{
				$s .= "$word ";	
			}elsif ($t=~/^cd/)
			{
				$d .= "$word ";	
			}elsif ($t=~/^cc/)
			{
				$c .= "$word ";	
			}elsif ($t=~/^cz/)
			{
				$z .= "$word ";	
			}else
			{
				$aux .= "$word ";
			}
		}
		elsif ($t=~/^f/)
		{
			if ($t=~/^fs/)
			{
				$s .= "$word ";	
			}elsif ($t=~/^fd/)
			{
				$d .= "$word ";	
			}elsif ($t=~/^fc/)
			{
				$c .= "$word ";	
			}elsif ($t=~/^fz/)
			{
				$z .= "$word ";	
			}else
			{
				$aux .= "$word ";
			}
		}
		else
		{
			if ($t=~/^s/)
			{
				$s .= "$word ";	
			}elsif ($t=~/^d/)
			{
				$d .= "$word ";	
			}elsif ($t=~/^c/)
			{
				$c .= "$word ";	
			}elsif ($t=~/^z/)
			{
				$z .= "$word ";	
			}else
			{
				$aux .= "$word ";
			}
			
		}
	}
}

$file="obj_list.in";
open(INFO,">$file");
print INFO "$s\n\n$d\n\n$c\n\n$z\n\n$aux\n\n";
close(INFO);

system("rm -f ls_res");

