c	scsum1sub.f
c
c	This program is a fortran wrapper for scsum1
c
        subroutine scsum1sub(output,
     $  n,
     $  cx,
     $  incx)
        real output
        integer n
        complex cx
        integer incx
        EXTERNAL scsum1
        real scsum1
        output = scsum1(n, cx, incx)
        return
        end