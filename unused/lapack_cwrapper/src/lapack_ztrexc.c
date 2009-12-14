/*
 * lapack_ztrexc.c
 *
 *This program is a C interface to ztrexc.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ztrexc(const enum lapack_compute_type compq, const int n, void * t, const int ldt, void * q, const int ldq, const int ifst, const int ilst, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt, F77_ldq=ldq, F77_ifst=ifst, F77_ilst=ilst;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_ldq ldq
	#define F77_ifst ifst
	#define F77_ilst ilst
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_compq;
#else
	#define F77_compq C_compq
#endif

	char C_compq=' ';
	if (compq == lapack_not_compute) {
		 C_compq = 'N';
	} else if (compq == lapack_unitary) {
		 C_compq = 'I';
	} else if (compq == lapack_product) {
		 C_compq = 'V';
	}

#ifdef F77_CHAR
	F77_compq = C2F_CHAR(&C_compq)
#endif

	f77_ztrexc(&F77_compq, &F77_n, t, &F77_ldt, q, &F77_ldq, &F77_ifst, &F77_ilst, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
