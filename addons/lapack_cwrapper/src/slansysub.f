c	slansysub.f
c
c	This program is a fortran wrapper for slansy
c
        subroutine slansysub(output,
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
        real a
        integer lda
        real work
        EXTERNAL slansy
        real slansy
        output = slansy(norm, uplo, n, a, lda, work)
        return
        end