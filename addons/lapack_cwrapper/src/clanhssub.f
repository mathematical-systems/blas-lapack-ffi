c	clanhssub.f
c
c	This program is a fortran wrapper for clanhs
c
        subroutine clanhssub(output,
     $  norm,
     $  n,
     $  a,
     $  lda,
     $  work)
        real output
        character norm
        integer n
        complex a
        integer lda
        real work
        EXTERNAL clanhs
        real clanhs
        output = clanhs(norm, n, a, lda, work)
        return
        end