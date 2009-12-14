#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlasr_(char* side, char* pivot, char* direct, int* m, int* n, double* c, double* s, void* a, int* lda)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_pivot_type pivotC;
	if (*pivot=='V') pivotC = lapack_variable;
	else if(*pivot=='T') pivotC = lapack_top;
	else if(*pivot=='B') pivotC = lapack_bottom;
	else pivotC = 0;
	enum lapack_direction_type directC;
	if (*direct=='F') directC = lapack_forward;
	else if(*direct=='B') directC = lapack_backward;
	else directC = 0;
	lapack_zlasr(sideC, pivotC, directC, *m, *n, c, s, a, *lda);
}
