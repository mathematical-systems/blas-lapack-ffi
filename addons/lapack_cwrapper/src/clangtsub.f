c	clangtsub.f
c
c	This program is a fortran wrapper for clangt
c
        subroutine clangtsub(output,
     $  norm,
     $  n,
     $  dl,
     $  d,
     $  du)
        real output
        character norm
        integer n
        complex dl
        complex d
        complex du
        EXTERNAL clangt
        real clangt
        output = clangt(norm, n, dl, d, du)
        return
        end