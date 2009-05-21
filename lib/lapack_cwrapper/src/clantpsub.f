c	clantpsub.f
c
c	This program is a fortran wrapper for clantp
c
        subroutine clantpsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  n,
     $  ap,
     $  work)
        real output
        character norm
        character uplo
        character diag
        integer n
        complex ap
        real work
        EXTERNAL clantp
        real clantp
        output = clantp(norm, uplo, diag, n, ap, work)
        return
        end