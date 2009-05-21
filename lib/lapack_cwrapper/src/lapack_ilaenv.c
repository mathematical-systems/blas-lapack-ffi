/*
 * lapack_ilaenv.c
 *
 *This program is a C interface to ilaenv.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

int lapack_ilaenv(const int ispec, const char * name, const char * opts, const int n1, const int n2, const int n3, const int n4 )
{

	int output;

#ifdef F77_INT
	F77_INT F77_ispec=ispec, F77_n1=n1, F77_n2=n2, F77_n3=n3, F77_n4=n4;
#else
	#define F77_ispec ispec
	#define F77_n1 n1
	#define F77_n2 n2
	#define F77_n3 n3
	#define F77_n4 n4
#endif

#ifdef F77_CHAR
	F77_CHAR F77_name = C2F_STR(name, strlen(name)) , F77_opts = C2F_STR(opts, strlen(opts)) ;
#else
	#define F77_name name
	#define F77_opts opts
#endif

	f77_ilaenv(&output, &F77_ispec, name, opts, &F77_n1, &F77_n2, &F77_n3, &F77_n4);

#ifdef F77_INT
#endif

return output;
}
