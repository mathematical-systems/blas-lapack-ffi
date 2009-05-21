        SUBROUTINE cclartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
c
c       lapack_clartg.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX  f
        COMPLEX  g
        REAL  cs
        COMPLEX  sn
        COMPLEX  r

        CALL fclartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
        RETURN
        END
