c	secondsub.f
c
c	This program is a fortran wrapper for second
c
        subroutine secondsub(output)
        real output
        EXTERNAL second
        real second
        output = second()
        return
        end