c	clanhtsub.f
c
c	This program is a fortran wrapper for clanht
c
        subroutine clanhtsub(output,
     $  norm,
     $  n,
     $  d,
     $  e)
        real output
        character norm
        integer n
        real d
        complex e
        EXTERNAL clanht
        real clanht
        output = clanht(norm, n, d, e)
        return
        end