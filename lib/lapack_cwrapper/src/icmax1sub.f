c	icmax1sub.f
c
c	This program is a fortran wrapper for icmax1
c
        subroutine icmax1sub(output,
     $  n,
     $  cx,
     $  incx)
        integer output
        integer n
        complex cx
        integer incx
        EXTERNAL icmax1
        integer icmax1
        output = icmax1(n, cx, incx)
        return
        end