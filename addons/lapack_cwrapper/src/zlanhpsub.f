c	zlanhpsub.f
c
c	This program is a fortran wrapper for zlanhp
c
        subroutine zlanhpsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  ap,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        complex*16 ap
        double precision work
        EXTERNAL zlanhp
        double precision zlanhp
        output = zlanhp(norm, uplo, n, ap, work)
        return
        end