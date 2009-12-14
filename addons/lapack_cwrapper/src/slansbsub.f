c	slansbsub.f
c
c	This program is a fortran wrapper for slansb
c
        subroutine slansbsub(output,
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
        real ab
        integer ldab
        real work
        EXTERNAL slansb
        real slansb
        output = slansb(norm, uplo, n, k, ab, ldab, work)
        return
        end