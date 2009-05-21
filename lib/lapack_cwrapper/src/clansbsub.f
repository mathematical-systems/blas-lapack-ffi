c	clansbsub.f
c
c	This program is a fortran wrapper for clansb
c
        subroutine clansbsub(output,
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
        EXTERNAL clansb
        real clansb
        output = clansb(norm, uplo, n, k, ab, ldab, work)
        return
        end