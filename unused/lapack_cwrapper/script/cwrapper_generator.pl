#!/usr/bin/perl -w

# complain on the readability of the script goes to Remi Delmas
# delmas@cs.utk.edu

sub get_dimensions
{
	$exit=0;
	$pop=0;
	$dim1="";
	$dim2="";
	
	$ch=$_[0];
	@t=split(//,$ch);
	for($i=0; (($i<$#t) && ($exit==0)) ;$i=$i+1)
	{
	    if ($t[$i]=~/\(/)
	    {
	        $exit=1;
	    }
	}
	$exit=0;
	for(;(($i<$#t) && ($exit==0)) ;$i=$i+1)
	{
	    if ($t[$i]=~/\(/)
	    {
	        $pop=$pop+1;
	        $dim1.=$t[$i];
	        if ($t[$i+1]!~/[0-9]/)
	        {
#	            $dim1.="*";
	        }
	    } elsif ($t[$i]=~/\)/ && $pop!=0)
	    {
	        $pop=$pop-1;
	        $dim1.=$t[$i];
	    } elsif ($t[$i]=~/\)/ && $pop==0)
	    {
			$i=$i+1;
	        $exit=1;
	    } elsif ($t[$i]=~/,/ && $pop==0)
	    {
	        $exit=1;
	    } elsif ($t[$i]=~/,/ && $pop!=0)
	    {
	        $dim1.=$t[$i];
	        if ($t[$i+1]!~/[0-9]/)
	        {
#	            $dim1.="*";
	        }
	    } else
	    {
	        $dim1.=$t[$i];
	    }
	}
	$exit=0;
	for(;(($i<$#t) && ($exit==0)) ;$i=$i+1)
	{
	    if ($t[$i]=~/\(/)
	    {
	        $pop=$pop+1;
	        $dim2.=$t[$i];
	        if ($t[$i+1]!~/[0-9]/)
	        {
	            $dim2.="*";
	        }
	    } elsif ($t[$i]=~/,/)
	    {
	        $dim2.=$t[$i];
	        if ($t[$i+1]!~/[0-9]/)
	        {
#	            $dim2.="*";
	        }
	    } elsif ($t[$i]=~/\)/ && $pop!=0)
	    {
	        $pop=$pop-1;
	        $dim2.=$t[$i];
		} elsif ($t[$i]=~/\)/ && $pop==0)
	    {
	        $exit=1;
	    } else
	    {
	        $dim2.=$t[$i];
	    }

	}
#	if ($dim1 !~ /\(/ && length($dim1)>0 ) { $dim1 = "*".$dim1; }
#	if ($dim2 !~ /\(/ && length($dim2)>0 ) { $dim2 = "*".$dim2; }
	($dim1, $dim2);		
}




system("../script/getargs.awk @ARGV > awk_file");

&write_fh();
&write_ch();


sub write_fh
{
	$file = 'awk_file';
	open(INFO,$file);
	@awkf = <INFO>;
	close(INFO);

	$file = '../include/lapack_f77.h';
	open(hf_file,">$file");

	print "Writing $file ...\n";

	print hf_file "/*   LAPACK Fortran77 Header File\n";
	print hf_file " *   included by all the lapack wrapper functions lapack_*.c\n";
	print hf_file " *   Written by Remi Delmas\n";
	print hf_file " */\n\n";
	print hf_file "#ifndef LAPACK_F77_H\n";
	print hf_file "#define LAPACK_F77_H\n\n";
	
	print hf_file "#if defined(ADD_)\n";

	foreach $t (@awkf)
	{
		if ($t =~ /subroutine/ || $t=~/function/)
		{
			if ($t=~/function/) 
			{ 
				$is_function=1; 
				@words = split(/ /, $t);
				$type_function = $words[1];
				if ($type_function=~/double/)
				{
					$l = $words[3];
					$l =~ s/\n//;
				}
				else
				{
					$l = $words[2];
					$l =~ s/\n//;
				}
			}
			else 
			{ 
				$is_function = 0; 
				$l=$t;
				$l =~ s/subroutine//;
				$l =~ s/function//;
				$l =~ s/ //;
				$l =~ s/\n//;
			}
			if ($is_function) {
				print hf_file "\t#define f77_$l ${l}sub_\n";
			} else {
				print hf_file "\t#define f77_$l ${l}_\n"; 
			}
		}
	}
	print hf_file "#elif defined(UPCASE)\n";
	foreach $t (@awkf)
	{
		if ($t =~ /subroutine/ || $t=~/function/)
		{
			if ($t=~/function/) 
			{ 
				$is_function=1; 
				@words = split(/ /, $t);
				$type_function = $words[1];
				if ($type_function=~/double/)
				{
					$l = $words[3];
					$l =~ s/\n//;
				}
				else
				{
					$l = $words[2];
					$l =~ s/\n//;
				}
			}
			else 
			{ 
				$is_function = 0; 
				$l=$t;
				$l =~ s/subroutine//;
				$l =~ s/function//;
				$l =~ s/ //;
				$l =~ s/\n//;
			}
			if ($is_function) {
				print hf_file "\t#define f77_$l \U${l}sub\n"; 
			} else {
				print hf_file "\t#define f77_$l \U${l}\n"; 
			}
		}
	}
	print hf_file "#elif defined(NOCHANGE)\n";
	foreach $t (@awkf)
	{
		if ($t =~ /subroutine/ || $t=~/function/)
		{
			if ($t=~/function/) 
			{ 
				$is_function=1; 
				@words = split(/ /, $t);
				$type_function = $words[1];
				if ($type_function=~/double/)
				{
					$l = $words[3];
					$l =~ s/\n//;
				}
				else
				{
					$l = $words[2];
					$l =~ s/\n//;
				}
			}
			else 
			{ 
				$is_function = 0; 
				$l=$t;
				$l =~ s/subroutine//;
				$l =~ s/function//;
				$l =~ s/ //;
				$l =~ s/\n//;
			}
			if ($is_function) {
				print hf_file "\t#define f77_$l ${l}sub\n"; 
			} else {
				print hf_file "\t#define f77_$l ${l}\n"; 
			}
		}
	}
	print hf_file "#endif\n\n";

	print hf_file "#ifdef F77_INT\n";
	print hf_file "\t#define FINT const F77_INT *\n";
	print hf_file "\t#define FINT2 F77_INT *\n";
	print hf_file "#else\n";
	print hf_file "\t#define FINT const int *\n";
	print hf_file "\t#define FINT2 int *\n";
	print hf_file "#endif\n\n";

	print hf_file "#ifdef F77_LOG\n";
	print hf_file "\t#define FLOG const F77_LOG *\n";
	print hf_file "\t#define FLOG2 F77_LOG *\n";
	print hf_file "#else\n";
	print hf_file "\t#define FLOG const long int *\n";
	print hf_file "\t#define FLOG2 long int *\n";
	print hf_file "#endif\n\n";
	
	print hf_file "#ifdef  F77_CHAR\n";
	print hf_file "\t#define FCHAR F77_CHAR\n";
	print hf_file "#else\n";
	print hf_file "\t#define FCHAR char *\n";
	print hf_file "#endif\n\n";
	
	print hf_file "#define C2F_CHAR(a) ( _cptofcd( (a), 1 ) )\n\n";
    print hf_file "#define C2F_STR(a, i) ( _cptofcd( (a), (i) ) )\n\n";

	for($ind = 0, $t=$awkf[$ind] ; $ind<=$#awkf ; $ind++ , $t=$awkf[$ind])
	{
		if ($t =~ /subroutine/ || $t=~/function/)
		{
			if ($t =~ /function/) { $is_function=1; }
			else { $is_function=0; }
			
			if (!$is_function)
			{
				$l = $t;
				$l =~ s/subroutine//;
				$l =~ s/function//;
				$l =~ s/ //;
				$l =~ s/\n//;
				print hf_file "void f77_$l("; 
			}
			else
			{
				@words = split(/ /, $t);
				$type_function = $words[1];
				if ($type_function=~/double/)
				{
					$l = $words[3];
				}
				else
				{
					$l = $words[2];
				}
				$l =~ s/\n//;
				print hf_file "void $l"."sub(";
				
				$file_sub = "$l"."sub.f";
				open(f_file,">$file_sub");
				print "Writing $file_sub ...\n";
				print f_file "c\t$l"."sub.f\n";
				print f_file "c\n";
				print f_file "c\tThis program is a fortran wrapper for $l\n";
				print f_file "c\n";
				print f_file "        subroutine $l"."sub(output";
				
				if ($type_function =~ /double/)
				{
					print hf_file "double* output";
					$str = "        double precision output\n";	
					$call= "        output = $l(";  
					$fort_type = "double precision";
				}
				elsif ($type_function =~ /complex\*16/)
				{
					print hf_file "void *output";
					$str = "        complex*16 output\n";
					$call= "        output = $l(";
					$fort_type = "complex*16";
				}
				elsif ($type_function =~ /complex/)
				{
					print hf_file "void *output";
					$str = "        complex output\n";
					$call= "        output = $l(";
					$fort_type = "complex";
				}
				elsif ($type_function =~ /integer/)
				{
					print hf_file "FINT output";
					$str = "        integer output\n";
					$call= "        output = $l(";
					$fort_type = "integer";
				}
				elsif ($type_function =~ /logical/)
				{
					print hf_file "FLOG output";
					$str = "        logical output\n";
					$call= "        output = $l(";
					$fort_type = "logical";
				}
				elsif ($type_function =~ /real/)
				{
					print hf_file "float output";
					$str = "        real output\n";
					$call= "        output = $l(";
					$fort_type = "real";
				}
				else
				{
					print "Warning, function return type not recognised in $l : $type_function\n";
				}
				$i=$ind+1;	
				if ( !( ($awkf[$i])=~/function/ || ($awkf[$i])=~/subroutine/))
				{
					print hf_file ", ";
				}
			}
			
			++$ind;
			$t = $awkf[$ind];
			$first = 1;
			# write the parameters of the function
			for(;($ind<=$#awkf) && !($t=~/subroutine/ || $t=~/function/); ++$ind , $t=$awkf[$ind])
			{
				@words=split(/[ +\n]/,$t);
				#TODO : understand this
				if ($#words<3)
				{
					print "Warning, variable name badly parsed!\n";
				}
				
				if ($first!=1)
				{
					print hf_file ", ";
					if ($is_function) { $call .= ", "; }
				}
				else
				{
					$first = 0;
				}
				if ($is_function) {	
					print f_file ",\n     \$  "; 
					$call .= $words[4];
				}
				
				if (($t=~/integer/) && ($t=~/ in /) && $t!~/procedure/)
				{
					print hf_file "FINT ";
					if ($is_function) { $str .= "        integer $words[4]\n"; }
				}
				elsif ($t=~/integer/ && $t!~/procedure/)
				{
					print hf_file "FINT2 ";
					if ($is_function) { $str .= "        integer $words[4]\n"; }
				} 
				elsif ($t=~/logical/ && ($t=~/ in /) && $t!~/procedure/)
				{
						if ($t!~/bwork/) { print hf_file "FLOG "; }
						else { print hf_file "const long int * "; }
						if ($is_function) { $str .= "        logical $words[4]\n"; }
				}
				elsif ($t=~/logical/ && $t!~/procedure/)
				{
						if ($t!~/bwork/) { print hf_file "FLOG2 "; }
						 else { print hf_file "long int * "; }
						if ($is_function) { $str .= "        logical $words[4]\n"; }
				}
				elsif ($t=~/procedure/) 
				{
# hack:
# the types of the arguments are the type working precision (s, d, c or z) 
# the only lapack functions that using function pointeurs are *gees*, and *gges*
# and they all return a logical value...

					if ($t=~/logical/) {
						print hf_file " const long int (\*$words[4]) ";
						if ($l=~/^s/) {
							if ($t=~/one/) { print hf_file "(float*)"; }
							elsif ($t=~/two/) { print hf_file "(float*,float*)"; }
							elsif ($t=~/three/) { print hf_file "(float*,float*,float*)"; }
						}elsif ($l=~/^d/) {
							if ($t=~/one/) { print hf_file "(double*)"; }
							elsif ($t=~/two/) { print hf_file "(double*,double*)"; }
							elsif ($t=~/three/) { print hf_file "(double*,double*,double*)"; }
						}elsif ($l=~/^c/) {
							if ($t=~/one/) { print hf_file "(void*)"; }
							elsif ($t=~/two/) { print hf_file "(void*,void*)"; }
							elsif ($t=~/three/) { print hf_file "(void*,void*,void*)"; }
						}elsif ($l=~/^z/) {
							if ($t=~/one/) { print hf_file "(void*)"; }
							elsif ($t=~/two/) { print hf_file "(void*,void*)"; }
							elsif ($t=~/three/) { print hf_file "(void*,void*,void*)"; }
						}		
					} else {
						print "Parameter badly parsed in function pointer $l!\n";
					}
				}
				else
				{
					if ($t=~/ in /)
					{
						print hf_file "const ";
					}
					if ($t=~/double/)
					{
						print hf_file "double * ";
						if ($is_function) { $str .= "        double precision $words[4]\n"; }
					} elsif ($t=~/ real /) {
						print hf_file "float * ";
						if ($is_function) { $str .= "        real $words[4]\n";}
					} elsif ($t=~/complex\*16/) {
						print hf_file "void *";
						if ($is_function) { $str .= "        complex*16 $words[4]\n"; }
					} elsif ($t=~/integer/) {
						print hf_file "FINT * ";
					} elsif ($t=~/complex/) {
						print hf_file "void * ";
						if ($is_function) { $str .= "        complex $words[4]\n"; }
					} elsif ($t=~/character\*1/) #enum needed here
					{
						print hf_file "FCHAR ";
						if ($is_function) { $str .= "        character $words[4]\n"; }
					} elsif ($t=~/character/) #transfer the string as is.
					{
						print hf_file "FCHAR ";
						if ($is_function) { $str .= "        character*(*) $words[4]\n";}
					}
					else
					{
						print "Parameter badly parsed in $l!\n";
					}
				}

				if ($t!~/procedure/) 
				{
					print hf_file $words[4]; #get the var name
				}		
				if ($is_function) { print f_file $words[4];	}
			}
			#hack 'cause I don't quite understand perl (yet!)
			$ind -= 1;
			print hf_file ");\n";
			if ($is_function) { 
				print f_file ")\n";
				print f_file $str;
				print f_file "        EXTERNAL $l\n";
				print f_file "        $fort_type $l\n";
				print f_file $call.")\n";
				print f_file "        return\n";
				print f_file "        end";
			}
		}
	}
	print hf_file "#endif /* LAPACK_F77_H */ \n";
	close(hf_file);
	if ($is_function) {	close(f_file); }
}



sub write_ch
{
	$file = 'awk_file';
	open(INFO,$file);
	@awkf = <INFO>;
	close(INFO);

	$file = '../include/lapack.h';
	open(h_file,">$file");
	print "Writing $file ...\n";

	print h_file "/*   LAPACK C Wrapper Header File\n";
	print h_file " *   included by all the lapack wrapper functions lapack_*.c\n";
	print h_file " *   Written by Remi Delmas\n";
	print h_file " */\n\n";
	print h_file "#ifndef LAPACK_H\n";
	print h_file "#define LAPACK_H\n\n";
	print h_file "#include \"lapack_enum.h\" \n\n";

	for($ind = 0, $t=$awkf[$ind] ; $ind<=$#awkf ; $ind++ , $t=$awkf[$ind])
	{
		if ($t =~ /subroutine/ || $t=~/function/)
		{
			if ($t=~/function/) 
			{ 
				@words = split(/ /, $t);
				$type_function = $words[1];
				if ($type_function=~/double/)
				{
					$l = $words[3];
				}
				else
				{
					$l = $words[2];
				}
				$l =~ s/\n//;
				$is_function=1; 
				$type_function = $words[1];
			}
			else
			{
				$is_function = 0;
			
				$l = $t;
				$l =~ s/subroutine//;
				$l =~ s/function//;
				$l =~ s/ //;
				$l =~ s/\n//;
			}
			$file2 = "lapack_$l.c";
			open(ch_file,">$file2");
			print "Writing $file2 ...\n";
	
			$file_testing = "../testing/wrapper/c$l.f";
			open (test_file,">$file_testing");
			print "Writing $file_testing...\n";
		
			$file2_testing = "../testing/wrapper/f$l.c";
			open(testC_file,">$file2_testing");
			print "Writing $file2_testing...\n";
			
			$author = "Remi Delmas";
			print ch_file "/*\n"; 
			print ch_file " * $file2\n";
			print ch_file " *\n";
			print ch_file " *This program is a C interface to $l.\n";
			print ch_file " *\n";
			print ch_file " * Written by $author.\n";
			print ch_file " *\n";
			print ch_file " */\n\n";
			print ch_file "#include \"../include/lapack_f77.h\"\n";
			print ch_file "#include \"../include/lapack_enum.h\"\n";
			print ch_file "#include \"../include/lapack_aux.h\"\n\n";

			
			$proto = "";
			$testC_proto = "";
			$testC_call = "";

			$testC_proto .= "void f$l\_(";

			if (!$is_function)
			{
				$proto .= "void lapack_$l("; 
				print test_file "        SUBROUTINE c$l(";
				$testC_call .= "lapack_$l(";
			}
			else
			{
				 
				if ($type_function =~ /double/)
				{
					$proto .= "double";
					$testC_proto .= "double* output";	
					$rtype= "DOUBLE PRECISION";
					$testC_call .= "*output = lapack_$l( ";	
				}
				elsif ($type_function =~ /integer/)
				{
					$proto .= "int";
					$testC_proto .= "int* output";	
					$rtype= "INTEGER";
					$testC_call .= "*output = lapack_$l( ";	
				}
				elsif ($type_function =~ /logical/)
				{
					$proto .= "long int";
					$testC_proto .= "long int* output";	
					$rtype= "LOGICAL";
					$testC_call .= "*output = lapack_$l( ";	
				}
				elsif ($type_function =~ /complex\*16/)
				{
					$proto .= "void*";
					$testC_proto .= "void* output";	
					$rtype= "COMPLEX\*16";
					$testC_call .= "(double*) output = lapack_$l( ";	
				}
				elsif ($type_function =~ /complex/)
				{
					$proto .= "void*";
					$testC_proto .= "void* output";	
					$rtype= "COMPLEX";
					$testC_call .= "(float*) output = lapack_$l( ";	
				}
				elsif ($type_function =~ /real/)
				{
					$proto .= "float";
					$testC_proto .= "float* output";	
					$rtype= "REAL";
					$testC_call .= "*output = lapack_$l( ";	
				}
				else
				{
					print "Warning, function return type not recognised in $l : $type_function\n";
				}
			
				$proto .= " lapack_$l(";
				print test_file "        $rtype FUNCTION c$l(";
			}
#			$proto .= " const enum lapack_order_type order_major";

			$conv_enum = "";
			$f_params = "";
			$f_decl = "";
			++$ind;
			$first=1;
			$t = $awkf[$ind];
			# write the parameters of the function
			$start=$ind;
			for(;($ind<=$#awkf) && !($t=~/subroutine/ || $t=~/function/); ++$ind , $t=$awkf[$ind])
			{
				if ($first && $is_function) { $testC_proto .= ", "; } 
				if ($first == 1) { $first=0 }
				else { 
					$proto .= ", "; 
					$testC_proto .= ", "; 
					$testC_call .= ", "; 
					$f_params .= ",\n     \$   "; 
				} 
				
				if ($t=~ / in / && $t!~/procedure/)
				{
					$proto .= "const ";

				}
				if ($t=~/integer/)
				{
					$proto .= "int ";
					$testC_proto .= "int* ";
					$f_decl .= "        INTEGER ";

				}
				elsif ($t=~/procedure/) 
				{
# hack:
# the types of the arguments are the type working precision (s, d, c or z) 
# the only lapack functions that using function pointeurs are *gees*, and *gges*
# and they all return a logical value...
					
					
					@words=split(/[ +\n]/,$t); #get the var name
					if ($t=~/logical/) {

						$f_decl .= "        LOGICAL $words[4]\n        EXTERNAL $words[4]\n";						
						$proto .= "const long int (\*$words[4]) ";
						$testC_proto .= "const long int (\*$words[4]) ";
						if ($l=~/^s/) {
							if ($t=~/one/) { 
								$proto .= "(float*)"; 
								$testC_proto .= "(float*)"; 
							}
							elsif ($t=~/two/) { 
								$proto .= "(float*,float*)"; 
								$testC_proto .= "(float*,float*)"; 
							}
							elsif ($t=~/three/) {
								$proto .= "(float*,float*,float*)"; 
								$testC_proto .= "(float*,float*,float*)"; 
							}
						}elsif ($l=~/^d/) {
							if ($t=~/one/) { 
								$proto .= "(double*)"; 
								$testC_proto .= "(double*)"; 
							}
							elsif ($t=~/two/) {
								$proto .= "(double*,double*)"; 
								$testC_proto .= "(double*,double*)"; 
							}
							elsif ($t=~/three/) {
								$proto .= "(double*,double*,double*)"; 
								$testC_proto .= "(double*,double*,double*)"; 
							}
						}elsif ($l=~/^c/) {
							if ($t=~/one/) { 
								$proto .= "(void*)"; 
								$testC_proto .= "(void*)"; 
							}
							elsif ($t=~/two/) {
								$proto .= "(void*,void*)"; 
								$testC_proto .= "(void*,void*)"; 
							}
							elsif ($t=~/three/) {
								$proto .= "(void*,void*,void*)"; 
								$testC_proto .= "(void*,void*,void*)"; 
							}
						}elsif ($l=~/^z/) {
							if ($t=~/one/) { 
								$proto .= "(void*)"; 
								$testC_proto .= "(void*)"; 
							}
							elsif ($t=~/two/) {
								$proto .= "(void*,void*)"; 
								$testC_proto .= "(void*,void*)"; 
							}
							elsif ($t=~/three/) { 
								$proto .= "(void*,void*,void*)"; 
								$testC_proto .= "(void*,void*,void*)"; 
							}
						}		
					} else {
						print "Parameter badly parsed in function pointer $l!\n";
					}
				}
				elsif ($t=~/logical/)
				{
					$proto .= "long int ";
					$testC_proto .= "long int* ";
					$f_decl .= "        LOGICAL ";
				}		
				elsif ($t=~/double/)
				{
					$proto .= "double ";
					$testC_proto .= "double* ";
					$f_decl .= "        DOUBLE PRECISION ";
				} elsif ($t=~/ real /)
				{
					$testC_proto .= "float* ";
					$proto .= "float ";
					$f_decl .= "        REAL ";
				} elsif ($t=~/complex\*16/) {
					$testC_proto .= "void* ";
					$f_decl .= "        COMPLEX*16 ";
					$proto .= "void ";
				} elsif ($t=~/complex/) {
					$testC_proto .= "void* ";
					$f_decl .= "        COMPLEX ";
					$proto .= "void ";
				} elsif ($t=~/character\*1/) #enum needed here
				{
					$testC_proto .= "char* ";
					$f_decl .= "        CHARACTER ";
					@words=split(/[ +\n]/,$t); #get the var name
					# we recognize a transpose type
					if ( $words[4] =~ /trans/ || $words[4] =~ /trana/ || $words[4] =~ /tranb/)
					{
						$conv_enum .= "\tenum lapack_trans_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_no_trans;\n";
						$conv_enum .= "\telse if(*$words[4]=='T') $words[4]C = lapack_trans;\n";
						$conv_enum .= "\telse if(*$words[4]=='C') $words[4]C = lapack_conj_trans;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_trans_type ";
					}
					elsif ( $words[4] =~ /sense/ && ($l=~/geesx/ || $l=~/ggesx/ ||$l=~/geevx/ || $l=~/ggevx/))
					{
						$proto .= "enum lapack_reciprocal_condition_type ";
						$conv_enum .= "\tenum lapack_reciprocal_condition_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_no_reciprocal;\n";
						$conv_enum .= "\telse if(*$words[4]=='E') $words[4]C = lapack_average_selected;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_selected_right_subspace;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_both_reciprocal;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";

					}
					elsif (($words[4] =~ /jobu/ || $words[4] =~ /jobv/ || $words[4] =~ /jobq/) && ($l=~/ggsvd/ || $l=~/ggsvp/))
					{
						$proto .= "enum lapack_compute_ortho_type ";
						$conv_enum .= "\tenum lapack_compute_ortho_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='U') $words[4]C = lapack_compute_ortho_u;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_compute_ortho_v;\n";
						$conv_enum .= "\telse if(*$words[4]=='Q') $words[4]C = lapack_compute_ortho_q;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_do_not_compute_ortho;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";

					}
					elsif ($words[4] =~ /uplo/)
					{
						$proto .= "enum lapack_uplo_type ";
						$conv_enum .= "\tenum lapack_uplo_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='U') $words[4]C = lapack_upper;\n";
						$conv_enum .= "\telse if(*$words[4]=='L') $words[4]C = lapack_lower;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /cmach/)
					{
						$proto .= "enum lapack_cmach_type ";
						$conv_enum .= "\tenum lapack_cmach_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='E') $words[4]C = lapack_eps;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_sfmin;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_base;\n";
						$conv_enum .= "\telse if(*$words[4]=='P') $words[4]C = lapack_epsbase;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_t;\n";
						$conv_enum .= "\telse if(*$words[4]=='R') $words[4]C = lapack_rnd;\n";
						$conv_enum .= "\telse if(*$words[4]=='M') $words[4]C = lapack_emin;\n";
						$conv_enum .= "\telse if(*$words[4]=='U') $words[4]C = lapack_rmin;\n";
						$conv_enum .= "\telse if(*$words[4]=='L') $words[4]C = lapack_emax;\n";
						$conv_enum .= "\telse if(*$words[4]=='O') $words[4]C = lapack_rmax;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						
					}
					elsif ($words[4] =~ /job/ &&  ($l=~/trsna/ || $l=~/trsen/))
					{
						$conv_enum .= "\tenum lapack_compute_cond_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='E') $words[4]C = lapack_cond_eigenvalues;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_cond_eigenvectors;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_no_cond;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_cond_both;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_compute_cond_type ";
					}
					elsif ($words[4] =~ /order/)
					{
						$conv_enum .= "\tenum lapack_order_block_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='B') $words[4]C = lapack_by_block;\n";
						$conv_enum .= "\telse if(*$words[4]=='E') $words[4]C = lapack_matrix;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_order_block_type ";
					}
					elsif ($words[4] =~ /diag/)
					{
						$conv_enum .= "\tenum lapack_diag_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_non_unit_diag;\n";
						$conv_enum .= "\telse if(*$words[4]=='U') $words[4]C = lapack_unit_diag;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_diag_type ";
					}
					elsif ($words[4] =~ /equed/)
					{
						$proto .= "char "; #no enum on that one, it is output
					}
					elsif ($words[4] =~ /ca/ || $words[4] =~ /cb/)
					{
						$proto .= "char "; #no enum on these ones, for lsame
					}
					elsif ($words[4] =~ /range/)
					{
						$conv_enum .= "\tenum lapack_range_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='A') $words[4]C = lapack_range_all;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_interval;\n";
						$conv_enum .= "\telse if(*$words[4]=='I') $words[4]C = lapack_order;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_range_type ";
					}
					elsif (($words[4] =~ /vect/) && ($l=~/sbgst/ || $l=~/hbgst/))
					{
						$proto .= "enum lapack_form_x_type ";
						$conv_enum .= "\tenum lapack_form_x_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_do_not_form_x;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_form_x;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif (($words[4] =~ /vect/) && ($l=~/sbtrd/ || $l=~/hbtrd/))
					{
						$proto .= "enum lapack_form_q_type ";
						$conv_enum .= "\tenum lapack_form_q_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_do_not_form_q;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_form_q;\n";
						$conv_enum .= "\telse if(*$words[4]=='U') $words[4]C = lapack_update_matrix;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif (($words[4] =~ /id/) && ($words[4] !~ /side/))
					{
						$proto .= "enum lapack_sort_type ";
						$conv_enum .= "\tenum lapack_sort_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='I') $words[4]C = lapack_increasing_order;\n";
						$conv_enum .= "\telse if(*$words[4]=='D') $words[4]C = lapack_decreasing_order;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /type/)
					{
						$proto .= "enum lapack_symmetry_type ";
						$conv_enum .= "\tenum lapack_symmetry_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='G') $words[4]C = lapack_general;\n";
						$conv_enum .= "\telse if(*$words[4]=='L') $words[4]C = lapack_lower_triangular;\n";
						$conv_enum .= "\telse if(*$words[4]=='U') $words[4]C = lapack_upper_triangular;\n";
						$conv_enum .= "\telse if(*$words[4]=='H') $words[4]C = lapack_upper_hessenberg;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_symetric_band_lower_stored;\n";
						$conv_enum .= "\telse if(*$words[4]=='Q') $words[4]C = lapack_symetric_band_upper_stored;\n";
						$conv_enum .= "\telse if(*$words[4]=='Z') $words[4]C = lapack_band;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /initv/)
					{
						$proto .= "enum lapack_init_vector_type ";
						$conv_enum .= "\tenum lapack_init_vector_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_no_vectors;\n";
						$conv_enum .= "\telse if(*$words[4]=='U') $words[4]C = lapack_user_vectors;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /eigsrc/)
					{
						$proto .= "enum lapack_eig_source_type ";
						$conv_enum .= "\tenum lapack_eig_source_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='Q') $words[4]C = lapack_source_chseqr;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_source_chseqr;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /sense/)
					{
						$proto .= "enum lapack_balance_type ";
						$conv_enum .= "\tenum lapack_balance_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_nothing;\n";
						$conv_enum .= "\telse if(*$words[4]=='P') $words[4]C = lapack_permute;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_scale;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_permute_scale;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /sort/)
					{
						$proto .= "enum lapack_ordering_type ";
						$conv_enum .= "\tenum lapack_ordering_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='S') $words[4]C = lapack_do_order;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_not_order;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($l=~/tgsj/) #ugly hack
					{
						$proto .= "enum lapack_compute_tgsj_type ";
						$conv_enum .= "\tenum lapack_compute_tgsj_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='U') $words[4]C = lapack_ortho_u;\n";
						$conv_enum .= "\telse if (*$words[4]=='V') $words[4]C = lapack_ortho_v;\n";
						$conv_enum .= "\telse if (*$words[4]=='Q') $words[4]C = lapack_ortho_q;\n";
						$conv_enum .= "\telse if (*$words[4]=='I') $words[4]C = lapack_unit;\n";
						$conv_enum .= "\telse if (*$words[4]=='N') $words[4]C = lapack_do_not_compute;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif (($words[4] =~ /side/) && ($l=~/trevc/ || $l=~/tgevc/)) #ugly hack
					{
						$proto .= "enum lapack_eigenvectors_side_type ";
						$conv_enum .= "\tenum lapack_eigenvectors_side_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='R') $words[4]C = lapack_right_eigenvectors;\n";
						$conv_enum .= "\telse if(*$words[4]=='L') $words[4]C = lapack_left_eigenvectors;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_both_eigenvectors;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /side/)
					{
						$proto .= "enum lapack_side_type ";
						$conv_enum .= "\tenum lapack_side_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='L') $words[4]C = lapack_left_side;\n";
						$conv_enum .= "\telse if(*$words[4]=='R') $words[4]C = lapack_right_side;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /compq/ || $words[4] =~ /compz/)
					{
						$proto .= "enum lapack_compute_type ";
						$conv_enum .= "\tenum lapack_compute_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_not_compute;\n";
						$conv_enum .= "\telse if(*$words[4]=='I') $words[4]C = lapack_unitary;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_product;\n\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /howmny/)
					{
						$proto .= "enum lapack_how_many_type ";
						$conv_enum .= "\tenum lapack_how_many_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='A') $words[4]C = lapack_all;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_backtransform;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_select;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /pivot/)
					{
						$proto .= "enum lapack_pivot_type ";
						$conv_enum .= "\tenum lapack_pivot_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='V') $words[4]C = lapack_variable;\n";
						$conv_enum .= "\telse if(*$words[4]=='T') $words[4]C = lapack_top;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_bottom;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /fact/)
					{
						$proto .= "enum lapack_fact_type ";
						$conv_enum .= "\tenum lapack_fact_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='F') $words[4]C = lapack_fact_f;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_fact_n;\n";
						$conv_enum .= "\telse if(*$words[4]=='E') $words[4]C = lapack_fact_e;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /storev/)
					{
						$proto .= "enum lapack_store_type ";
						$conv_enum .= "\tenum lapack_store_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='C') $words[4]C = lapack_columnwise;\n";
						$conv_enum .= "\telse if(*$words[4]=='R') $words[4]C = lapack_rowwise;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /direct/)
					{
						$proto .= "enum lapack_direction_type ";
						$conv_enum .= "\tenum lapack_direction_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='F') $words[4]C = lapack_forward;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_backward;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /norm/ && $words[4] !~ /normin/)
					{
						$proto .= "enum lapack_norm_type ";
						$conv_enum .= "\tenum lapack_norm_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='1' || *$words[4]=='O') $words[4]C = lapack_one_norm;\n";
						$conv_enum .= "\telse if(*$words[4]=='I') $words[4]C = lapack_inf_norm;\n";
						$conv_enum .= "\telse if(*$words[4]=='M') $words[4]C = lapack_max_norm;\n";
						$conv_enum .= "\telse if(*$words[4]=='F') $words[4]C = lapack_frobenius_norm;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /normin/)
					{
						$proto .= "enum lapack_column_norm_type ";
						$conv_enum .= "\tenum lapack_norm_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='Y') $words[4]C = lapack_column_norm;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_no_column_norm;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /vect/)
					{
						$proto .= "enum lapack_form_matrices_type ";
						$conv_enum .= "\tenum lapack_form_matrices_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_form_none;\n";
						$conv_enum .= "\telse if(*$words[4]=='Q') $words[4]C = lapack_form_qm;\n";
						$conv_enum .= "\telse if(*$words[4]=='P') $words[4]C = lapack_form_pp;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_form_both;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					elsif ($words[4] =~ /jobu/ || $words[4] =~ /jobvt/ || ($words[4] =~ /jobz/ && $l=~/gesdd/))
					{
						$conv_enum .= "\tenum lapack_compute_svd_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='A') $words[4]C = lapack_all_matrix;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_overwritte_u;\n";
						$conv_enum .= "\telse if(*$words[4]=='O') $words[4]C = lapack_overwritte_a;\n";
						$conv_enum .= "\telse if(*$words[4]=='N') $words[4]C = lapack_no_singular_vectors;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_compute_svd_type ";
					}
					elsif ($words[4] =~ /jobvl/ || $words[4] =~ /jobvr/ || $words[4] =~ /jobvs/ || ($words[4] =~ /jobz/ && $l!~/gesdd/) || $words[4] =~ /jobvsl/ || $words[4] =~ /jobvsr/ ) 
					{
						$conv_enum .= "\tenum lapack_compute_vectors_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_no_compute_vectors;\n";
						$conv_enum .= "\telse if(*$words[4]=='V') $words[4]C = lapack_compute_vectors;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_compute_vectors_type ";
					}
					elsif (($words[4] =~ /balanc/ || $words[4] =~ /job/) && ($l=~/hseqr/ || $l=~/hgeqz/))  #ugly hack, but no choice
					{
						$conv_enum .= "\tenum lapack_hseqr_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='E') $words[4]C = lapack_eigenvalues;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_schur_form;\n\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
						$proto .= "enum lapack_hseqr_type ";
					}
					elsif ($words[4] =~ /balanc/ || ($words[4] =~ /job/ && $l!~/hgeqz/)) 
					{
						$proto .= "enum lapack_balance_type ";
						$conv_enum .= "\tenum lapack_balance_type $words[4]C;\n";
						$conv_enum .= "\tif (*$words[4]=='N') $words[4]C = lapack_nothing;\n";
						$conv_enum .= "\telse if(*$words[4]=='P') $words[4]C = lapack_permute;\n";
						$conv_enum .= "\telse if(*$words[4]=='S') $words[4]C = lapack_scale;\n";
						$conv_enum .= "\telse if(*$words[4]=='B') $words[4]C = lapack_permute_scale;\n";
						$conv_enum .= "\telse $words[4]C = 0;\n";
					}
					else
					{
						print "Warning, char*1 badly parsed in $l : $words[4]\n";
					}
				} elsif ($t=~/character/) #transfer the sring as is.
				{
					$proto .= "char * ";
					$testC_proto .= "char* ";
					$f_decl .= "        CHARACTER";
				}
				else
				{
					print "Parameter badly parsed!\n";
				}

				if(($t!~/character*1/)&& (($t=~/out/) || ($t=~/array/) || ($t=~/complex/)))
				{
					$proto .= "* ";
				}
				else
				{
					if ($t!~/character/ && $t!~/procedure/) { $testC_call .= "*"; }
				}
						
				if ($t=~/character/ && $t!~/character\*1/) {
					$f_decl .= 	"*(*)";
				}
				
				@words=split(/[ +\n]/,$t);
				if ($t!~/procedure/)
				{
					$proto .= $words[4];
					$f_decl .= " ".$words[4];
					$testC_proto .= $words[4];
				}

				$f_params .= $words[4];
			    
				if (($t=~/character\*1/) && ($t!~/equed/) && ($t!~/ca/) && ($t!~/cb/)) #enum
				{
					$testC_call .= "$words[4]C";
				}
				else
				{
					$testC_call .= "$words[4]";
				}

				if ($t=~/array/ || ($t=~/character/ && !($t=~/character/))) {
					$f_decl .= "(*)\n";
				}
				else
				{	
					$f_decl .= "\n";
				}

#				$f_decl .= "\n";
			}
			print testC_file "#include \"../../include/lapack_enum.h\"\n";
			print testC_file "#include \"../../include/lapack.h\"\n";
			print testC_file "$testC_proto)\n{\n";
			print testC_file $conv_enum;
			print testC_file "\t$testC_call);\n}\n";
			close(testC_file);


			print test_file "$f_params)\n";

			print test_file "c\n"; 
			print test_file "c       lapack_$l.c\n";
			print test_file "c\n";
			print test_file "c       This program is a fortran Wrapper to\n";
			print test_file "c       the C Wrapper for fortran Lapack.\n";
			print test_file "c       It is used to test the C Wrapper using\n";
			print test_file "c       the testing functions provided with the\n";
			print test_file "c       LAPACK package.\n";
			print test_file "c\n";
			print test_file "c       Written by $author.\n";
			print test_file "c\n";

			print test_file "$f_decl\n";

			if ($is_function)
			{
#				print test_file "        $rtype f$l\n";
				print test_file "        EXTERNAL f$l\n";

				print test_file "        CALL f$l(c$l, $f_params)\n";
			}
			else
			{
				print test_file "        CALL f$l($f_params)\n";
			}
			print test_file "        RETURN\n";
			print test_file "        END\n";
			
			
			#hack 'cause I don't quite understand perl (yet!)
			$ind -= 1;
			$proto .= " )";
			print h_file "$proto;\n";
			print ch_file "$proto\n";
			print ch_file "{\n";

			if ($is_function)
			{
				if ($type_function =~/double/) {
					print ch_file "\n\tdouble output;\n\n";
				}
				elsif ($type_function =~/integer/) {
					print ch_file "\n\tint output;\n\n";
				}
				elsif ($type_function =~/logical/) {
					print ch_file "\n\tlong int output;\n\n";
				}
				elsif ($type_function =~/real/) {
					print ch_file "\n\tfloat output;\n\n";
				}
				elsif ($type_function =~/complex\*16/) {
					print ch_file "\n\tdouble *output;\n";
					print ch_file "\toutput=malloc(2*sizeof(double));\n\n";
				}
				elsif ($type_function =~/complex/) {
					print ch_file "\n\tfloat *output;\n";
					print ch_file "\toutput=malloc(2*sizeof(float));\n\n";
				} else {
					print "Warning, return value badly parsed (in .c)!\n";
				}
			}

			#write the body of the function. For this, we parse $proto
			#first, int
			
			@temp = split(/[()]/,$proto);
			if ($#temp==1)
			{
				$tmp2 = $temp[1];
			}
			else #there is a function pointer somewhere
			{
				$tmp2 = $temp[1].$temp[2].$temp[3].$temp[5]; 
			}
			@args = split(/,/,$tmp2);
	
			print ch_file "#ifdef F77_INT\n";
			$first = 1;
			$done=0;
			foreach $arg (@args)
			{
			
#hack : function pointer are nammed select or selctg... we do not want to enable F77_INT for those
				if ($arg =~ /int/ && $arg!~/long int/ && $arg !~/\*/ && $arg !~ /select/ && $arg !~ /selctg/  )
				{
	                if ($first!=1) { print ch_file ", "; }
	                else { 
						$first = 0;
						print ch_file "\tF77_INT ";
					}

					@int=split(/ /,$arg);
					$name=pop(@int);
					print ch_file "F77_$name=$name";
					$done = 1;
				}
			}
			
			if ($done) {print ch_file ";\n";}
            $first = 1;
			foreach $arg (@args)
            {

                if ($arg =~ /int/ && $arg!~/long int/ && $arg =~/\*/ && $arg !~ /select/ && $arg !~ /selctg/ )
                {

                    @int=split(/ /,$arg);
                    $name=pop(@int);

					if ($arg=~/iwork/)
					{
						print ch_file "\t#define F77_iwork iwork\n";
					}
					else
					{
						if ($first==1) { print ch_file "\tint i_local;\n"; $first=0; }
#to get the dim, we need to reparse the part of the file that describes ur function
						$ind=$start;
						$t = $awkf[$ind];
						while($t!~/$name/ || $t !~ /integer/) { 
							++$ind; 
							$t=$awkf[$ind]; 
						}
						if ($t!~/array/)
						{
							print ch_file "\tF77_INT F77_$name\[1\];\n";
							if ($t=~/ in / || $t=~/int\/out/)	
							{
								print ch_file "\tF77_$name\[0\]=(F77_INT) $name\[0\];\n";
							}
						}
						else
						{

							($dim1,$dim2) = get_dimensions($t);

							if (length($dim1)==0) { $dim1=1; }
							if (length($dim2)==0) { $dim2=1; }

							print ch_file "\tF77_INT F77_$name\[$dim1*$dim2\];\n";
#							if ($t=~/ in / || $t=~/int\/out/)	
#							{
								print ch_file "\tfor(i_local=0;i_local<$dim1*$dim2;i_local++) {\n";
								print ch_file "\t\tF77_$name\[i_local\]=(F77_INT) $name\[i_local\];\n\t}\n";
#							}
						}					
					}	
				}
																				            }
			print ch_file "#else\n";

            foreach $arg (@args)
            {
                if ($arg =~ /int/ && $arg!~/long int/ && $arg !~ /select/ && $arg !~ /selctg/ )
                {
                    @int=split(/ /,$arg);
                    $name=pop(@int);
                    print ch_file "\t#define F77_$name $name\n";
																				                }
			}	
			print ch_file "#endif\n\n";
			#end of parsing ints
			
			#then, logicals
			
			@temp = split(/[()]/,$proto);
			if ($#temp==1) #() in the list of args => function somewhere
			{
				$tmp2 = $temp[1];
				$is_function_pointer = 0;
			}
			else #there is a function pointer somewhere
			{
				$tmp2 = $temp[1].$temp[2].$temp[3].$temp[5]; 
				$is_function_pointer = 1;
			}
			@args = split(/,/,$tmp2);
	
			$first = 1;
#are there any logical in the function?
			$exist_logical=0;
			$nbr_log = ($tmp2=~s/long\ int/long\ int/g); #count # of logical
			if ($tmp2=~/bwork/) { $nbr_log = $nbr_log -1; }
			if ($nbr_log > 0 ) { $exist_logical=1;}
			else { $exist_logical=0; }
			
			if ($exist_logical)
			{
				print ch_file "#ifdef F77_LOG\n";
			}
			foreach $arg (@args)
			{
			
				if ($arg =~ /long int/ && $arg !~/\*/ && ($arg !~ /select/ || $is_function_pointer==0) && ($arg !~ /selctg/ || $is_function_pointer==0) )					
				{
	                if ($first!=1) { print ch_file ", "; }
	                else { 
						print ch_file "\tF77_LOG ";
						$first = 0; 
					}


					@int=split(/ /,$arg);
					$name=pop(@int);
					print ch_file "F77_$name=$name";
				}
			}
			
			if ($exist_logical) { print ch_file ";\n"; }
            $first = 1;
			foreach $arg (@args)
            {

                if ($arg =~ /long int/ && $arg =~/\*/ && ($arg !~ /select/ || $is_function_pointer==0) && ($arg !~ /selctg/ || $is_function_pointer==0))
                {

                    @int=split(/ /,$arg);
                    $name=pop(@int);

					if ($arg=~/bwork/)
					{
						print ch_file "\t#define F77_bwork bwork\n";
					}
					else
					{
						if ($first==1) { print ch_file "\tint j_local;\n"; $first=0; }
#to get the dim, we need to reparse the part of the file that describes ur function
						$ind=$start;
						$t = $awkf[$ind];
						while($t!~/$name/) { 
							++$ind; 
							$t=$awkf[$ind]; }
						if ($t!~/array/)
						{
							print ch_file "\tF77_LOG F77_$name\[1\];\n";
							if ($t=~/ in / || $t=~/int\/out/)	
							{
								print ch_file "\tF77_$name\[0\]=(F77_LOG) $name\[0\];\n";
							}
						}
						else
						{

							($dim1,$dim2) = get_dimensions($t);

							if (length($dim1)==0) { $dim1=1; }
							if (length($dim2)==0) { $dim2=1; }

							print ch_file "\tF77_LOG F77_$name\[$dim1*$dim2\];\n";
#							if ($t=~/ in / || $t=~/int\/out/)	
#							{
								print ch_file "\tfor(j_local=0;j_local<$dim1*$dim2;j_local++) {\n";
								print ch_file "\t\tF77_$name\[j_local\]=(F77_LOG) $name\[j_local\];\n\t}\n";
#							}
						}					
					}
				}
			}
			if ($exist_logical) { print ch_file "#else\n"; }
            foreach $arg (@args)
            {
                if ($arg =~ /long int/ && ($arg !~ /select/ || $is_function_pointer==0) && ($arg !~ /selctg/ || $is_function_pointer==0))
                {
                    @int=split(/ /,$arg);
                    $name=pop(@int);
                    print ch_file "\t#define F77_$name $name\n";
																				                }
			}	
			if ($exist_logical) { print ch_file "#endif\n\n"; }
			
			#then, parse enums
			#small hack to count the number of occurences of enum in proto
			$count = ($proto =~ s/enum/enum/g);
			if ($count >= 1) #major_order not taken into account here
			{
				print ch_file "#ifdef F77_CHAR\n";
				print ch_file "\tF77_CHAR ";
				@temp = split(/[()]/,$proto);
				if ($#temp==1)
				{
					$tmp2 = $temp[1];
				}
				else #there is a function pointer somewhere
				{
					$tmp2 = $temp[1].$temp[2].$temp[3].$temp[5]; 
				}
				@args = split(/,/,$tmp2);
				$first = 1;
				foreach $arg (@args)
				{
					if (($arg =~ /enum/) ) #&& !($arg =~ /lapack_order_type/)) 
					{
		                if ($first!=1) { print ch_file ", "; }
			            else { $first = 0; }
	
						@int=split(/ /,$arg);
						$name=pop(@int);
						print ch_file "F77_$name";
					}
				}
			
				print ch_file ";\n";
				print ch_file "#else\n";

				foreach $arg (@args)
	            {
		            if (($arg =~ /enum/) ) #&& !($arg =~ /lapack_order_type/))
			        {
				        @int=split(/ /,$arg);
					    $name=pop(@int);
						print ch_file "\t#define F77_$name C_$name\n";
																					                }
				}	
				print ch_file "#endif\n\n";
	
			
				foreach $arg (@args)
				{
					if ($arg =~ /enum/)
					{
						if (!($arg =~ /\,/)) { $arg = ", ".$arg; }
						@enu=split(/ +/,$arg);
						if ($enu[3] =~ /lapack_trans_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_no_trans) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_trans) {\n";
							print ch_file "\t\t C_$enu[4] = 'T';\n";
							print ch_file "\t} else if ($enu[4] == lapack_conj_trans) {\n";
							print ch_file "\t\t C_$enu[4] = 'C';\n";
							print ch_file "\t}\n\n";
#						} elsif ($enu[3] =~ /lapack_order_type/)
#						{
						} elsif ( $enu[3] =~ /lapack_equilibration_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_no_equilibration) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_row_equilibration) {\n";
							print ch_file "\t\t C_$enu[4] = 'R';\n";
							print ch_file "\t} else if ($enu[4] == lapack_column_equilibration) {\n";
							print ch_file "\t\t C_$enu[4] = 'C';\n";
							print ch_file "\t} else if ($enu[4] == lapack_row_column_equilibration) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_order_block_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_by_block) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t} else if ($enu[4] == lapack_matrix) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_tgsj_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_ortho_u) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t} else if ($enu[4] == lapack_ortho_v) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_ortho_q) {\n";
							print ch_file "\t\t C_$enu[4] = 'Q';\n";
							print ch_file "\t} else if ($enu[4] == lapack_unit) {\n";
							print ch_file "\t\t C_$enu[4] = 'I';\n";
							print ch_file "\t} else if ($enu[4] == lapack_do_not_compute) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_column_norm_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_column_norm) {\n";
							print ch_file "\t\t C_$enu[4] = 'Y';\n";
							print ch_file "\t} else if ($enu[4] == lapack_no_column_norm) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_cond_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_cond_eigenvalues) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t} else if ($enu[4] == lapack_cond_eigenvectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_no_cond) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_cond_both) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_ortho_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_compute_ortho_u) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t} else if ($enu[4] == lapack_compute_ortho_v) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_compute_ortho_q) {\n";
							print ch_file "\t\t C_$enu[4] = 'Q';\n";
							print ch_file "\t} else if ($enu[4] == lapack_do_not_compute_ortho) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_reciprocal_condition_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_no_reciprocal) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_average_selected) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t} else if ($enu[4] == lapack_selected_right_subspace) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_both_reciprocal) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_svd_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_all_matrix) {\n";
							print ch_file "\t\t C_$enu[4] = 'A';\n";
							print ch_file "\t} else if ($enu[4] == lapack_overwritte_u) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t} else if ($enu[4] == lapack_overwritte_a) {\n";
							print ch_file "\t\t C_$enu[4] = 'O';\n";
							print ch_file "\t} else if ($enu[4] == lapack_no_singular_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_uplo_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_upper) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t} else if ($enu[4] == lapack_lower) {\n";
							print ch_file "\t\t C_$enu[4] = 'L';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_cmach_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_eps) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t} else if ($enu[4] == lapack_sfmin) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t} else if ($enu[4] == lapack_base) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t} else if ($enu[4] == lapack_epsbase) {\n";
							print ch_file "\t\t C_$enu[4] = 'P';\n";
							print ch_file "\t} else if ($enu[4] == lapack_t) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_rnd) {\n";
							print ch_file "\t\t C_$enu[4] = 'R';\n";
							print ch_file "\t} else if ($enu[4] == lapack_emin) {\n";
							print ch_file "\t\t C_$enu[4] = 'M';\n";
							print ch_file "\t} else if ($enu[4] == lapack_rmin) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t} else if ($enu[4] == lapack_emax) {\n";
							print ch_file "\t\t C_$enu[4] = 'L';\n";
							print ch_file "\t} else if ($enu[4] == lapack_rmax) {\n";
							print ch_file "\t\t C_$enu[4] = 'O';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_form_x_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_do_not_form_x) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_form_x) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_form_q_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_do_not_form_q) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_form_q) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_update_matrix) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_how_many_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_all) {\n";
							print ch_file "\t\t C_$enu[4] = 'A';\n";
							print ch_file "\t} else if ($enu[4] == lapack_backtransform) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t} else if ($enu[4] == lapack_select) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_not_compute) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_unitary) {\n";
							print ch_file "\t\t C_$enu[4] = 'I';\n";
							print ch_file "\t} else if ($enu[4] == lapack_product) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_init_vector_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_no_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_user_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_hseqr_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_eigenvalues) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t} else if ($enu[4] == lapack_schur_form) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_side_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_left_side) {\n";
							print ch_file "\t\t C_$enu[4] = 'L';\n";
							print ch_file "\t} else if ($enu[4] == lapack_right_side) {\n";
							print ch_file "\t\t C_$enu[4] = 'R';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_direction_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_forward) {\n";
							print ch_file "\t\t C_$enu[4] = 'F';\n";
							print ch_file "\t} else if ($enu[4] == lapack_backward) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_symmetry_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_general) {\n";
							print ch_file "\t\t C_$enu[4] = 'G';\n";
							print ch_file "\t} else if ($enu[4] == lapack_lower_triangular) {\n";
							print ch_file "\t\t C_$enu[4] = 'L';\n";
							print ch_file "\t} else if ($enu[4] == lapack_upper_triangular) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t} else if ($enu[4] == lapack_upper_hessenberg) {\n";
							print ch_file "\t\t C_$enu[4] = 'H';\n";
							print ch_file "\t} else if ($enu[4] == lapack_symetric_band_lower_stored) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t} else if ($enu[4] == lapack_symetric_band_upper_stored) {\n";
							print ch_file "\t\t C_$enu[4] = 'Q';\n";
							print ch_file "\t} else if ($enu[4] == lapack_band) {\n";
							print ch_file "\t\t C_$enu[4] = 'Z';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_sort_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_increasing_order) {\n";
							print ch_file "\t\t C_$enu[4] = 'I';\n";
							print ch_file "\t} else if ($enu[4] == lapack_decreasing_order) {\n";
							print ch_file "\t\t C_$enu[4] = 'D';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_range_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_range_all) {\n";
							print ch_file "\t\t C_$enu[4] = 'A';\n";
							print ch_file "\t} else if ($enu[4] == lapack_interval) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_order) {\n";
							print ch_file "\t\t C_$enu[4] = 'I';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_form_matrices_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_form_none) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_form_qm) {\n";
							print ch_file "\t\t C_$enu[4] = 'Q';\n";
							print ch_file "\t} else if ($enu[4] == lapack_form_pp) {\n";
							print ch_file "\t\t C_$enu[4] = 'P';\n";
							print ch_file "\t} else if ($enu[4] == lapack_form_both) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_pivot_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_variable) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_top) {\n";
							print ch_file "\t\t C_$enu[4] = 'T';\n";
							print ch_file "\t} else if ($enu[4] == lapack_bottom) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_fact_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_fact_f) {\n";
							print ch_file "\t\t C_$enu[4] = 'F';\n";
							print ch_file "\t} else if ($enu[4] == lapack_fact_n) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_fact_e) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_diag_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_non_unit_diag) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_unit_diag) {\n";
							print ch_file "\t\t C_$enu[4] = 'U';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_store_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_columnwise) {\n";
							print ch_file "\t\t C_$enu[4] = 'C';\n";
							print ch_file "\t} else if ($enu[4] == lapack_rowwise) {\n";
							print ch_file "\t\t C_$enu[4] = 'R';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_eig_source_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_source_chseqr) {\n";
							print ch_file "\t\t C_$enu[4] = 'Q';\n";
							print ch_file "\t} else if ($enu[4] == lapack_no_source) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_ordering_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_do_order) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t} else if ($enu[4] == lapack_not_order) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_compute_vectors_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_no_compute_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_compute_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t}\n\n";
						} elsif ( $enu[3] =~ /lapack_norm_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_one_norm) {\n";
							print ch_file "\t\t C_$enu[4] = '1';\n";
							print ch_file "\t} else if ($enu[4] == lapack_inf_norm) {\n";
							print ch_file "\t\t C_$enu[4] = 'I';\n";
							print ch_file "\t} else if ($enu[4] == lapack_max_norm) {\n";
							print ch_file "\t\t C_$enu[4] = 'M';\n";
							print ch_file "\t} else if ($enu[4] == lapack_frobenius_norm) {\n";
							print ch_file "\t\t C_$enu[4] = 'F';\n";
							print ch_file "\t}\n\n";
						}elsif ( $enu[3] =~ /lapack_eigenvectors_side_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_left_eigenvectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'L';\n";
							print ch_file "\t} else if ($enu[4] == lapack_right_eigenvectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'R';\n";
							print ch_file "\t} else if ($enu[4] == lapack_both_eigenvectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						}elsif ( $enu[3] =~ /lapack_condition_number_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_none) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_values) {\n";
							print ch_file "\t\t C_$enu[4] = 'E';\n";
							print ch_file "\t} else if ($enu[4] == lapack_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'V';\n";
							print ch_file "\t} else if ($enu[4] == lapack_values_vectors) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						}elsif ( $enu[3] =~ /lapack_balance_type/)
						{
							print ch_file "\tchar C_$enu[4]=' ';\n";
							print ch_file "\tif ($enu[4] == lapack_nothing) {\n";
							print ch_file "\t\t C_$enu[4] = 'N';\n";
							print ch_file "\t} else if ($enu[4] == lapack_permute) {\n";
							print ch_file "\t\t C_$enu[4] = 'P';\n";
							print ch_file "\t} else if ($enu[4] == lapack_scale) {\n";
							print ch_file "\t\t C_$enu[4] = 'S';\n";
							print ch_file "\t} else if ($enu[4] == lapack_permute_scale) {\n";
							print ch_file "\t\t C_$enu[4] = 'B';\n";
							print ch_file "\t}\n\n";
						} else	
						{ #barkage to the head
							print "Warning, enum type not recognised : $enu[3] !\n";
							print "@enu \n";
						}
					}
				}

				print ch_file "#ifdef F77_CHAR\n";
				foreach $arg (@args)
	            {
		            if (($arg =~ /enum/) ) #&& !($arg =~ /lapack_order_type/))
			        {
				        @int=split(/ /,$arg);
					    $name=pop(@int);
						print ch_file "\tF77_$name = C2F_CHAR(&C_$name)\n";
																					                }
				}	
				print ch_file "#endif\n\n";
			}
			#end of parsing enums
		
			#parse character strings
			if ($proto =~ /char/)
			{
				print ch_file "#ifdef F77_CHAR\n";
				print ch_file "\tF77_CHAR ";
				@temp = split(/[()]/,$proto);
				if ($#temp==1)
				{
					$tmp2 = $temp[1];
				}
				else #there is a function pointer somewhere
				{
					$tmp2 = $temp[1].$temp[2].$temp[3].$temp[5]; 
				}
				
				@args = split(/,/,$tmp2);
				$first = 1;
				foreach $arg (@args)
				{
					if ($arg =~ /char/)  
						{
						if ($first!=1) { print ch_file ", "; }
			            else { $first = 0; }

						@int=split(/ /,$arg);
						$name=pop(@int);
						print ch_file "F77_$name = C2F_STR($name, strlen($name)) ";
					}
				}
		
				print ch_file ";\n";
				print ch_file "#else\n";

				foreach $arg (@args)
	            {
		            if ($arg =~ /char/)
			        {
				        @int=split(/ /,$arg);
					    $name=pop(@int);
						print ch_file "\t#define F77_$name $name\n";
			        }
				}	
				print ch_file "#endif\n\n";
			}

			#end of parsing character strings
			
			#call the fortran function
			print ch_file "\tf77_$l(";
			$first = 1;
			if ($is_function) {
				print ch_file "&output";
			}
			foreach $arg (@args)
			{
				#hack to get rid of unwanted parameters
#if (!($arg =~ /pack_order_type/))
#				{
				
				@int=split(/ /,$arg);
#if (length($#int)>2)
#				{
				$name=pop(@int);

				if (defined($name))
				{
				if (!$is_function) {
					if ($first!=1) { print ch_file ", "; }
						else { $first = 0; }
					} else {
						print ch_file ", ";
					}
				}

				# function pointers
				if ( ($arg =~ /select/ || $arg =~ /selctg/) &&  $is_function_pointer==1 )
				{
					$name =~ s/\*//;
					print ch_file "$name";
				}
				elsif ($arg =~ /int/ && !($arg =~ /\*/))
				{
					print ch_file "&F77_$name";
				}
				elsif ($arg =~ /int/ && $arg =~ /\*/) 
				{
					print ch_file "F77_$name";
				}
				elsif ($arg =~ /enum/)
				{
					print ch_file "&F77_$name";
				}
				elsif (!($arg =~ /\*/))
				{
					if (defined($name)) { print ch_file "\&$name"; }
				}
				else
				{
					print ch_file "$name";
				}
#				}
#				}
			}
			print ch_file ");\n\n";
			
			print ch_file "#ifdef F77_INT\n";
            foreach $arg (@args)
            {
                if ($arg =~ /int/ && $arg!~/long int/ && $arg =~ /\*/  && $arg!~/const/ && $arg !~ /select/ && $arg !~ /selctg/ && $arg!~/iwork/)
                {
                    @int=split(/ /,$arg);
                    $name=pop(@int);

#to get the dim, we need to reparse the part of the file that describes ur function
					$ind=$start;
					$t = $awkf[$ind];
					while( $t !~ /$name/ || $t !~ /integer/) 
					{ 
						++$ind; 
						$t=$awkf[$ind]; 
					}
					if ($t=~/array/)
					{
						($dim1,$dim2) = get_dimensions($t);

					    if (length($dim1)==0) { $dim1=1; }
					    if (length($dim2)==0) { $dim2=1; }

#    print ch_file "\tF77_INT F77_$name\[$dim1*$dim2\];\n";
						print ch_file "\tfor(i_local=0;i_local<$dim1*$dim2;i_local++) {\n";
						print ch_file "\t\t$name\[i_local\]=(int) F77_$name\[i_local\];\n\t}\n\n";
					}					
					else
					{
						print ch_file "\t$name\[0\]=(int) F77_$name\[0\];\n";

					}
#@int=split(/ /,$arg);
#                   $name=pop(@int);
#                   print ch_file "\t$name = F77_$name\n";
				}
			}	
			print ch_file "#endif\n\n";
		

			if ($exist_logical) { print ch_file "#ifdef F77_LOG\n";	}
            foreach $arg (@args)
            {
				if ( $arg!~/const/ && $arg=~/\*/ && $arg =~ /long int/ &&  ($arg !~ /select/ || $is_function_pointer==0) && ($arg !~ /selctg/ || $is_function_pointer==0) && $arg!~/bwork/)	
					
#if ($arg =~ /long int/  && $arg =~ /\*/  && $arg!~/const/ && $arg !~ /select/ && $arg !~ /selctg/ && $arg!~/bwork/)
                {
                    @int=split(/ /,$arg);
                    $name=pop(@int);

#to get the dim, we need to reparse the part of the file that describes our function
					$ind=$start;
					$t = $awkf[$ind];
					while( $t !~ /$name/) 
					{ 
						++$ind; 
						$t=$awkf[$ind]; 
					}
					if ($t=~/array/)
					{
						($dim1,$dim2) = get_dimensions($t);

					    if (length($dim1)==0) { $dim1=1; }
					    if (length($dim2)==0) { $dim2=1; }

						print ch_file "\tfor(j_local=0;j_local<$dim1*$dim2;j_local++) {\n";
						print ch_file "\t\t$name\[j_local\]=(long int) F77_$name\[j_local\];\n\t}\n\n";
					}					
					else
					{
						print ch_file "\t$name\[0\]=(long int) F77_$name\[0\];\n\n";
					}
				}
			}	
			if ($exist_logical) { print ch_file "#endif\n\n"; }
			
# return the return value of the function (is is_function, of course).
			if ($is_function) {
				if ($type_function =~ /double/) {
					print ch_file "return output;\n";
				} elsif ($type_function =~ /integer/) {
					print ch_file "return output;\n";
				} elsif ($type_function =~ /logical/) {
					print ch_file "return output;\n";
				} elsif ($type_function =~ /real/) {
					print ch_file "return output;\n";
				} elsif ($type_function =~ /complex\*16/) {
					print ch_file "return output;\n";
				} elsif ($type_function =~ /complex/) {
					print ch_file "return output;\n";
				} else {
					print "Warning, when returning value from .c, type unknown!\n";
				}
			}	
			
			print ch_file "}\n";
		}
	}
	print h_file "#endif /* LAPACK_H */\n";
	close(h_file);
}
