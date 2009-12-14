c	zlanhesub.f
c
c	This program is a fortran wrapper for zlanhe
c
        subroutine zlanhesub(output,
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
        EXTERNAL zlanhe
        double precision zlanhe
        output = zlanhe(norm, uplo, n, a, lda, work)
        return
        end