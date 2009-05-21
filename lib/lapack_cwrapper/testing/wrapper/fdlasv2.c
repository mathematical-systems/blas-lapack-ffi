#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasv2_(double* f, double* g, double* h, double* ssmin, double* ssmax, double* snl, double* csl, double* snr, double* csr)
{
	lapack_dlasv2(*f, *g, *h, ssmin, ssmax, snl, csl, snr, csr);
}
