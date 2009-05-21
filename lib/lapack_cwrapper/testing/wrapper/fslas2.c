#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslas2_(float* f, float* g, float* h, float* ssmin, float* ssmax)
{
	lapack_slas2(*f, *g, *h, ssmin, ssmax);
}
