c	zlantbsub.f
c
c	This program is a fortran wrapper for zlantb
c
        subroutine zlantbsub(output,
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
        complex*16 ab
        integer ldab
        double precision work
        EXTERNAL zlantb
        double precision zlantb
        output = zlantb(norm, uplo, diag, n, k, ab, ldab, work)
        return
        end