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
		if (!($t=~/sub\.f/))
		{
			if ($t=~/lapack_s/)
			{
				$s .= "$word ";	
			}elsif ($t=~/lapack_d/)
			{
				$d .= "$word ";	
			}elsif ($t=~/lapack_c/)
			{
				$c .= "$word ";	
			}elsif ($t=~/lapack_z/)
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

