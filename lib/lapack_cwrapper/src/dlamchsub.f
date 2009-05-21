c	dlamchsub.f
c
c	This program is a fortran wrapper for dlamch
c
        subroutine dlamchsub(output,
     $  cmach)
        double precision output
        character cmach
        EXTERNAL dlamch
        double precision dlamch
        output = dlamch(cmach)
        return
        end