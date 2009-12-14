c	dlapy2sub.f
c
c	This program is a fortran wrapper for dlapy2
c
        subroutine dlapy2sub(output,
     $  x,
     $  y)
        double precision output
        double precision x
        double precision y
        EXTERNAL dlapy2
        double precision dlapy2
        output = dlapy2(x, y)
        return
        end