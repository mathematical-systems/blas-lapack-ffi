c	zlanhtsub.f
c
c	This program is a fortran wrapper for zlanht
c
        subroutine zlanhtsub(output,
     $  norm,
     $  n,
     $  d,
     $  e)
        double precision output
        character norm
        integer n
        double precision d
        complex*16 e
        EXTERNAL zlanht
        double precision zlanht
        output = zlanht(norm, n, d, e)
        return
        end