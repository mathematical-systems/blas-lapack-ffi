c	slanstsub.f
c
c	This program is a fortran wrapper for slanst
c
        subroutine slanstsub(output,
     $  norm,
     $  n,
     $  d,
     $  e)
        real output
        character norm
        integer n
        real d
        real e
        EXTERNAL slanst
        real slanst
        output = slanst(norm, n, d, e)
        return
        end