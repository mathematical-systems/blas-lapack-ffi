#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fslasdt_(int* n, int* lvl, int* nd, int* inode, int* ndiml, int* ndimr, int* msub)
{
	lapack_slasdt(*n, lvl, nd, inode, ndiml, ndimr, *msub);
}
