/*
 * lapack_lsamen.c
 *
 *This program is a C interface to lsamen.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

long int lapack_lsamen(const int n, const char * ca, const char * cb )
{

	long int output;

#ifdef F77_INT
	F77_INT F77_n=n;
#else
	#define F77_n n
#endif

#ifdef F77_CHAR
	F77_CHAR F77_ca = C2F_STR(ca, strlen(ca)) , F77_cb = C2F_STR(cb, strlen(cb)) ;
#else
	#define F77_ca ca
	#define F77_cb cb
#endif

	f77_lsamen(&output, &F77_n, ca, cb);

#ifdef F77_INT
#endif

return output;
}
