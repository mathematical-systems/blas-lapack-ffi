c	slanhssub.f
c
c	This program is a fortran wrapper for slanhs
c
        subroutine slanhssub(output,
     $  norm,
     $  n,
     $  a,
     $  lda,
     $  work)
        real output
        character norm
        integer n
        real a
        integer lda
        real work
        EXTERNAL slanhs
        real slanhs
        output = slanhs(norm, n, a, lda, work)
        return
        end