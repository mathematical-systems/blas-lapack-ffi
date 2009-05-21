c	dlanhssub.f
c
c	This program is a fortran wrapper for dlanhs
c
        subroutine dlanhssub(output,
     $  norm,
     $  n,
     $  a,
     $  lda,
     $  work)
        double precision output
        character norm
        integer n
        double precision a
        integer lda
        double precision work
        EXTERNAL dlanhs
        double precision dlanhs
        output = dlanhs(norm, n, a, lda, work)
        return
        end