c	zlansbsub.f
c
c	This program is a fortran wrapper for zlansb
c
        subroutine zlansbsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  k,
     $  ab,
     $  ldab,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        integer k
        complex*16 ab
        integer ldab
        double precision work
        EXTERNAL zlansb
        double precision zlansb
        output = zlansb(norm, uplo, n, k, ab, ldab, work)
        return
        end