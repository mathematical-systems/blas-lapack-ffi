c	slantpsub.f
c
c	This program is a fortran wrapper for slantp
c
        subroutine slantpsub(output,
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
        real ap
        real work
        EXTERNAL slantp
        real slantp
        output = slantp(norm, uplo, diag, n, ap, work)
        return
        end