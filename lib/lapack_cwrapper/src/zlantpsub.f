c	zlantpsub.f
c
c	This program is a fortran wrapper for zlantp
c
        subroutine zlantpsub(output,
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
        complex*16 ap
        double precision work
        EXTERNAL zlantp
        double precision zlantp
        output = zlantp(norm, uplo, diag, n, ap, work)
        return
        end