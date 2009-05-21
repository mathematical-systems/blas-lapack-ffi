c	clanhpsub.f
c
c	This program is a fortran wrapper for clanhp
c
        subroutine clanhpsub(output,
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
        EXTERNAL clanhp
        real clanhp
        output = clanhp(norm, uplo, n, ap, work)
        return
        end