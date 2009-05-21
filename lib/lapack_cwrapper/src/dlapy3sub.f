c	dlapy3sub.f
c
c	This program is a fortran wrapper for dlapy3
c
        subroutine dlapy3sub(output,
     $  x,
     $  y,
     $  z)
        double precision output
        double precision x
        double precision y
        double precision z
        EXTERNAL dlapy3
        double precision dlapy3
        output = dlapy3(x, y, z)
        return
        end