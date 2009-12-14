c	slamc3sub.f
c
c	This program is a fortran wrapper for slamc3
c
        subroutine slamc3sub(output,
     $  a,
     $  b)
        real output
        real a
        real b
        EXTERNAL slamc3
        real slamc3
        output = slamc3(a, b)
        return
        end