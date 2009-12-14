c	slapy3sub.f
c
c	This program is a fortran wrapper for slapy3
c
        subroutine slapy3sub(output,
     $  x,
     $  y,
     $  z)
        real output
        real x
        real y
        real z
        EXTERNAL slapy3
        real slapy3
        output = slapy3(x, y, z)
        return
        end