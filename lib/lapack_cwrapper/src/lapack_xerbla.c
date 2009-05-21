/*
 * lapack_xerbla.c
 *
 *This program is a C interface to xerbla.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_xerbla(const char * srname, const int info )
{
#ifdef F77_INT
	F77_INT F77_info=info;
#else
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_srname = C2F_STR(srname, strlen(srname)) ;
#else
	#define F77_srname srname
#endif

	f77_xerbla(srname, &F77_info);

#ifdef F77_INT
#endif

}
