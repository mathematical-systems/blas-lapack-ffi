c	ieeecksub.f
c
c	This program is a fortran wrapper for ieeeck
c
        subroutine ieeecksub(output,
     $  ispec,
     $  zero,
     $  one)
        integer output
        integer ispec
        real zero
        real one
        EXTERNAL ieeeck
        integer ieeeck
        output = ieeeck(ispec, zero, one)
        return
        end