#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlasdt_(int* n, int* lvl, int* nd, int* inode, int* ndiml, int* ndimr, int* msub)
{
	lapack_dlasdt(*n, lvl, nd, inode, ndiml, ndimr, *msub);
}
