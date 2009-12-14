c	clansysub.f
c
c	This program is a fortran wrapper for clansy
c
        subroutine clansysub(output,
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
        EXTERNAL clansy
        real clansy
        output = clansy(norm, uplo, n, a, lda, work)
        return
        end