c	zladivsub.f
c
c	This program is a fortran wrapper for zladiv
c
        subroutine zladivsub(output,
     $  x,
     $  y)
        double precision output
        complex*16 x
        complex*16 y
        EXTERNAL zladiv
        double precision zladiv
        output = zladiv(x, y)
        return
        end