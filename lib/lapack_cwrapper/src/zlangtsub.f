c	zlangtsub.f
c
c	This program is a fortran wrapper for zlangt
c
        subroutine zlangtsub(output,
     $  norm,
     $  n,
     $  dl,
     $  d,
     $  du)
        double precision output
        character norm
        integer n
        complex*16 dl
        complex*16 d
        complex*16 du
        EXTERNAL zlangt
        double precision zlangt
        output = zlangt(norm, n, dl, d, du)
        return
        end