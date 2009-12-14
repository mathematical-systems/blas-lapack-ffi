c	dsecndsub.f
c
c	This program is a fortran wrapper for dsecnd
c
        subroutine dsecndsub(output)
        double precision output
        EXTERNAL dsecnd
        double precision dsecnd
        output = dsecnd()
        return
        end