/*
 * lapack_dlags2.c
 *
 *This program is a C interface to dlags2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlags2(const long int upper, const double a1, const double a2, const double a3, const double b1, const double b2, const double b3, double * csu, double * snu, double * csv, double * snv, double * csq, double * snq )
{
#ifdef F77_INT
#else
#endif

#ifdef F77_LOG
	F77_LOG F77_upper=upper;
#else
	#define F77_upper upper
#endif

	f77_dlags2(&F77_upper, &a1, &a2, &a3, &b1, &b2, &b3, csu, snu, csv, snv, csq, snq);

#ifdef F77_INT
#endif

#ifdef F77_LOG
#endif

}
