#!/usr/bin/perl

foreach $file (@ARGV)
{
	open(info,$file);
	@text = <info>;
	close(info);

	foreach $t (@text)
	{
		$l=length($t);
		if ((length($t) > 73) && ($t!~m/^\*/))
		{
			print "$file\n";
			system("cp $file $file.orig");
			system("./correct_line.pl < $file.orig > $file");
			last;
#system("vi $file");
#			exit;
		}
	}
}
