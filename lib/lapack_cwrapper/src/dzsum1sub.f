c	dzsum1sub.f
c
c	This program is a fortran wrapper for dzsum1
c
        subroutine dzsum1sub(output,
     $  n,
     $  cx,
     $  incx)
        double precision output
        integer n
        complex*16 cx
        integer incx
        EXTERNAL dzsum1
        double precision dzsum1
        output = dzsum1(n, cx, incx)
        return
        end