c	dlantrsub.f
c
c	This program is a fortran wrapper for dlantr
c
        subroutine dlantrsub(output,
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
        double precision a
        integer lda
        double precision work
        EXTERNAL dlantr
        double precision dlantr
        output = dlantr(norm, uplo, diag, m, n, a, lda, work)
        return
        end