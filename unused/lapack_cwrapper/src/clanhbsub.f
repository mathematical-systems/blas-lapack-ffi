c	clanhbsub.f
c
c	This program is a fortran wrapper for clanhb
c
        subroutine clanhbsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  k,
     $  ab,
     $  ldab,
     $  work)
        real output
        character norm
        character uplo
        integer n
        integer k
        complex ab
        integer ldab
        real work
        EXTERNAL clanhb
        real clanhb
        output = clanhb(norm, uplo, n, k, ab, ldab, work)
        return
        end