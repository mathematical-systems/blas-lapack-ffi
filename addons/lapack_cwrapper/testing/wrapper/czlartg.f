        SUBROUTINE czlartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
c
c       lapack_zlartg.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        COMPLEX*16  f
        COMPLEX*16  g
        DOUBLE PRECISION  cs
        COMPLEX*16  sn
        COMPLEX*16  r

        CALL fzlartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
        RETURN
        END
