c	dlantbsub.f
c
c	This program is a fortran wrapper for dlantb
c
        subroutine dlantbsub(output,
     $  norm,
     $  uplo,
     $  diag,
     $  n,
     $  k,
     $  ab,
     $  ldab,
     $  work)
        double precision output
        character norm
        character uplo
        character diag
        integer n
        integer k
        double precision ab
        integer ldab
        double precision work
        EXTERNAL dlantb
        double precision dlantb
        output = dlantb(norm, uplo, diag, n, k, ab, ldab, work)
        return
        end