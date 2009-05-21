c	cladivsub.f
c
c	This program is a fortran wrapper for cladiv
c
        subroutine cladivsub(output,
     $  x,
     $  y)
        complex output
        complex x
        complex y
        EXTERNAL cladiv
        complex cladiv
        output = cladiv(x, y)
        return
        end