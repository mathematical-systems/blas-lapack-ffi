c	izmax1sub.f
c
c	This program is a fortran wrapper for izmax1
c
        subroutine izmax1sub(output,
     $  n,
     $  cx,
     $  incx)
        integer output
        integer n
        complex*16 cx
        integer incx
        EXTERNAL izmax1
        integer izmax1
        output = izmax1(n, cx, incx)
        return
        end