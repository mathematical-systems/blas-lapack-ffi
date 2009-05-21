/*
 * lapack_dlaqtr.c
 *
 *This program is a C interface to dlaqtr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaqtr(const long int ltran, const long int lreal, const int n, const double * t, const int ldt, const double * b, const double w, double * scale, double * x, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_ltran=ltran, F77_lreal=lreal;
#else
	#define F77_ltran ltran
	#define F77_lreal lreal
#endif

	f77_dlaqtr(&F77_ltran, &F77_lreal, &F77_n, t, &F77_ldt, b, &w, scale, x, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
