/*
 * lapack_dlaed6.c
 *
 *This program is a C interface to dlaed6.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaed6(const int kniter, const long int orgati, const double rho, const double * d, const double * z, const double finit, double * tau, int * info )
{
#ifdef F77_INT
	F77_INT F77_kniter=kniter;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_kniter kniter
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_orgati=orgati;
#else
	#define F77_orgati orgati
#endif

	f77_dlaed6(&F77_kniter, &F77_orgati, &rho, d, z, &finit, tau, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
