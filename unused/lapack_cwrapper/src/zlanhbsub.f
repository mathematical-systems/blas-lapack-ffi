c	zlanhbsub.f
c
c	This program is a fortran wrapper for zlanhb
c
        subroutine zlanhbsub(output,
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
        EXTERNAL zlanhb
        double precision zlanhb
        output = zlanhb(norm, uplo, n, k, ab, ldab, work)
        return
        end