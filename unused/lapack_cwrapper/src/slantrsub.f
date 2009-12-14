c	slantrsub.f
c
c	This program is a fortran wrapper for slantr
c
        subroutine slantrsub(output,
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
        real a
        integer lda
        real work
        EXTERNAL slantr
        real slantr
        output = slantr(norm, uplo, diag, m, n, a, lda, work)
        return
        end