c	slamchsub.f
c
c	This program is a fortran wrapper for slamch
c
        subroutine slamchsub(output,
     $  cmach)
        real output
        character cmach
        EXTERNAL slamch
        real slamch
        output = slamch(cmach)
        return
        end