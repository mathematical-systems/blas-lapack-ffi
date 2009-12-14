#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlas2_(double* f, double* g, double* h, double* ssmin, double* ssmax)
{
	lapack_dlas2(*f, *g, *h, ssmin, ssmax);
}
