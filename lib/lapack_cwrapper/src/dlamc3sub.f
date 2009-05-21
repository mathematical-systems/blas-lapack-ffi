c	dlamc3sub.f
c
c	This program is a fortran wrapper for dlamc3
c
        subroutine dlamc3sub(output,
     $  a,
     $  b)
        double precision output
        double precision a
        double precision b
        EXTERNAL dlamc3
        double precision dlamc3
        output = dlamc3(a, b)
        return
        end