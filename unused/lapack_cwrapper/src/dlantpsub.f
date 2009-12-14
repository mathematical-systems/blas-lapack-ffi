c	dlantpsub.f
c
c	This program is a fortran wrapper for dlantp
c
        subroutine dlantpsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  n,
     $  ap,
     $  work)
        double precision output
        character norm
        character uplo
        character diag
        integer n
        double precision ap
        double precision work
        EXTERNAL dlantp
        double precision dlantp
        output = dlantp(norm, uplo, diag, n, ap, work)
        return
        end