c	zlanspsub.f
c
c	This program is a fortran wrapper for zlansp
c
        subroutine zlanspsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  ap,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        complex*16 ap
        double precision work
        EXTERNAL zlansp
        double precision zlansp
        output = zlansp(norm, uplo, n, ap, work)
        return
        end