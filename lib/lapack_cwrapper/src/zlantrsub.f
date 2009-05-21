c	zlantrsub.f
c
c	This program is a fortran wrapper for zlantr
c
        subroutine zlantrsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  m,
     $  n,
     $  a,
     $  lda,
     $  work)
        double precision output
        character norm
        character uplo
        character diag
        integer m
        integer n
        complex*16 a
        integer lda
        double precision work
        EXTERNAL zlantr
        double precision zlantr
        output = zlantr(norm, uplo, diag, m, n, a, lda, work)
        return
        end