c	clantrsub.f
c
c	This program is a fortran wrapper for clantr
c
        subroutine clantrsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  m,
     $  n,
     $  a,
     $  lda,
     $  work)
        real output
        character norm
        character uplo
        character diag
        integer m
        integer n
        complex a
        integer lda
        real work
        EXTERNAL clantr
        real clantr
        output = clantr(norm, uplo, diag, m, n, a, lda, work)
        return
        end