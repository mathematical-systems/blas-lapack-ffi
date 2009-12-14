c	slantbsub.f
c
c	This program is a fortran wrapper for slantb
c
        subroutine slantbsub(output,
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
        real ab
        integer ldab
        real work
        EXTERNAL slantb
        real slantb
        output = slantb(norm, uplo, diag, n, k, ab, ldab, work)
        return
        end