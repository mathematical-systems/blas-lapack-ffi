#!/usr/bin/awk -f

# Determine the non-array input arguments to a function

/SUBROUTINE/ {
    gsub(/[(]/, "");
    printf("\nsubroutine " tolower($2));
}

/FUNCTION/ && !/SEL/ && !/DOUBLE/{
    gsub(/[(]/, "");
	    printf("\nfunction " tolower($1) " " tolower($3));
		}

/FUNCTION/ && !/SEL/ && /DOUBLE/{
    gsub(/[(]/, "");
	        printf("\nfunction " tolower($1) " "  tolower($2) " " tolower($4));
			        }
/array/ {
	gsub(/\( +/, "(");
	gsub(/ +\)/, ")");
	gsub(/\(/, " (");
	gsub(/\)/, ") ");
	}
	
!/array/ {
	gsub(/,/, "");
	}

/[(]input[)]/  && !/array/ {
	printf("\n" "  in " tolower($4) " " tolower($2));
}

/[(]input[)]/  && /array/ {
    pre=NF - 1;
    printf("\n" "  in " tolower($4) " " tolower($2) " array " tolower($pre) " " tolower($NF));
	}
	
/[(]input[/]output[)]/  && !/array/ {
    printf("\n" "  in/out " tolower($4) " " tolower($2));
	}

/[(]input or output[)]/  && !/array/ {
    printf("\n" "  in/out " tolower($6) " " tolower($2));
	}

/[(]input[/]output[)]/  && /array/  {
	pre=NF - 1;
#	gsub(/\( +/, "(");
#	gsub(/ +\)/, ")");
	printf("\n" "  in/out " tolower($4) " " tolower($2) " array " tolower($pre) " " tolower($NF));
	}

/[(]input or output[)]/  && /array/  {
	pre=NF - 1;
	printf("\n" "  in/out " tolower($6) " " tolower($2) " array " tolower($pre) " " tolower($NF));
	}

/workspace/  && /array/  {
	pre=NF - 1;
	printf("\n" "  in/out " tolower($4) " " tolower($2) " array " tolower($pre) " " tolower($NF));
	}
	
/[(]external procedure[)]/ {
	pre=NF - 1;
	printf("\n" "  in " tolower($5) " " tolower($2) " " tolower($8) " procedure " );
	}

/[(]output[)]/  && !/array/{
	pre=NF - 1;
	printf("\n" "  out " tolower($4) " " tolower($2));
    }
	
/[(]output[)]/  && /array/{
    pre=NF - 1;
	printf("\n" "  out " tolower($4) " " tolower($2) " array " tolower($pre) " " tolower($NF));
    }


