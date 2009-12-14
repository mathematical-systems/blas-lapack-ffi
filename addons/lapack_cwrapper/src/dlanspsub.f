c	dlanspsub.f
c
c	This program is a fortran wrapper for dlansp
c
        subroutine dlanspsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  ap,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        double precision ap
        double precision work
        EXTERNAL dlansp
        double precision dlansp
        output = dlansp(norm, uplo, n, ap, work)
        return
        end