c	dlanstsub.f
c
c	This program is a fortran wrapper for dlanst
c
        subroutine dlanstsub(output,
     $  norm,
     $  n,
     $  d,
     $  e)
        double precision output
        character norm
        integer n
        double precision d
        double precision e
        EXTERNAL dlanst
        double precision dlanst
        output = dlanst(norm, n, d, e)
        return
        end