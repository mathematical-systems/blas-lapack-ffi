c	dlangtsub.f
c
c	This program is a fortran wrapper for dlangt
c
        subroutine dlangtsub(output,
     $  norm,
     $  n,
     $  dl,
     $  d,
     $  du)
        double precision output
        character norm
        integer n
        double precision dl
        double precision d
        double precision du
        EXTERNAL dlangt
        double precision dlangt
        output = dlangt(norm, n, dl, d, du)
        return
        end