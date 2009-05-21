#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasv2_(float* f, float* g, float* h, float* ssmin, float* ssmax, float* snl, float* csl, float* snr, float* csr)
{
	lapack_slasv2(*f, *g, *h, ssmin, ssmax, snl, csl, snr, csr);
}
