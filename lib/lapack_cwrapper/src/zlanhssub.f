c	zlanhssub.f
c
c	This program is a fortran wrapper for zlanhs
c
        subroutine zlanhssub(output,
     $  norm,
     $  n,
     $  a,
     $  lda,
     $  work)
        double precision output
        character norm
        integer n
        complex*16 a
        integer lda
        double precision work
        EXTERNAL zlanhs
        double precision zlanhs
        output = zlanhs(norm, n, a, lda, work)
        return
        end