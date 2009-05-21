c	clanspsub.f
c
c	This program is a fortran wrapper for clansp
c
        subroutine clanspsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  ap,
     $  work)
        real output
        character norm
        character uplo
        integer n
        complex ap
        real work
        EXTERNAL clansp
        real clansp
        output = clansp(norm, uplo, n, ap, work)
        return
        end