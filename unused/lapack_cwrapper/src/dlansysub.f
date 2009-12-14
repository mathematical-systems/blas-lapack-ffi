c	dlansysub.f
c
c	This program is a fortran wrapper for dlansy
c
        subroutine dlansysub(output,
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
        double precision a
        integer lda
        double precision work
        EXTERNAL dlansy
        double precision dlansy
        output = dlansy(norm, uplo, n, a, lda, work)
        return
        end