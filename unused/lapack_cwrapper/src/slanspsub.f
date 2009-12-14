c	slanspsub.f
c
c	This program is a fortran wrapper for slansp
c
        subroutine slanspsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  ap,
     $  work)
        real output
        character norm
        character uplo
        integer n
        real ap
        real work
        EXTERNAL slansp
        real slansp
        output = slansp(norm, uplo, n, ap, work)
        return
        end