c	clantbsub.f
c
c	This program is a fortran wrapper for clantb
c
        subroutine clantbsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  n,
     $  k,
     $  ab,
     $  ldab,
     $  work)
        real output
        character norm
        character uplo
        character diag
        integer n
        integer k
        complex ab
        integer ldab
        real work
        EXTERNAL clantb
        real clantb
        output = clantb(norm, uplo, diag, n, k, ab, ldab, work)
        return
        end