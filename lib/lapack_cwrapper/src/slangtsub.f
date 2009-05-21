c	slangtsub.f
c
c	This program is a fortran wrapper for slangt
c
        subroutine slangtsub(output,
     $  norm,
     $  n,
     $  dl,
     $  d,
     $  du)
        real output
        character norm
        integer n
        real dl
        real d
        real du
        EXTERNAL slangt
        real slangt
        output = slangt(norm, n, dl, d, du)
        return
        end