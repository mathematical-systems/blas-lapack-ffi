/*
 * lapack_clags2.c
 *
 *This program is a C interface to clags2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_clags2(const long int upper, const float a1, const void * a2, const float a3, const float b1, const void * b2, const float b3, float * csu, void * snu, float * csv, void * snv, float * csq, void * snq )
{
#ifdef F77_INT
#else
#endif

#ifdef F77_LOG
	F77_LOG F77_upper=upper;
#else
	#define F77_upper upper
#endif

	f77_clags2(&F77_upper, &a1, a2, &a3, &b1, b2, &b3, csu, snu, csv, snv, csq, snq);

#ifdef F77_INT
#endif

#ifdef F77_LOG
#endif

}
