c	slapy2sub.f
c
c	This program is a fortran wrapper for slapy2
c
        subroutine slapy2sub(output,
     $  x,
     $  y)
        real output
        real x
        real y
        EXTERNAL slapy2
        real slapy2
        output = slapy2(x, y)
        return
        end