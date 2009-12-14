        SUBROUTINE cslartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
c
c       lapack_slartg.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        REAL  f
        REAL  g
        REAL  cs
        REAL  sn
        REAL  r

        CALL fslartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
        RETURN
        END
