c	clanhesub.f
c
c	This program is a fortran wrapper for clanhe
c
        subroutine clanhesub(output,
     $  norm,
     $  uplo,
     $  n,
     $  a,
     $  lda,
     $  work)
        real output
        character norm
        character uplo
        integer n
        complex a
        integer lda
        real work
        EXTERNAL clanhe
        real clanhe
        output = clanhe(norm, uplo, n, a, lda, work)
        return
        end