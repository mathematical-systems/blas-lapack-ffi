c	zlansysub.f
c
c	This program is a fortran wrapper for zlansy
c
        subroutine zlansysub(output,
     $  norm,
     $  uplo,
     $  n,
     $  a,
     $  lda,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        complex*16 a
        integer lda
        double precision work
        EXTERNAL zlansy
        double precision zlansy
        output = zlansy(norm, uplo, n, a, lda, work)
        return
        end