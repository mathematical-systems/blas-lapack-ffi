        SUBROUTINE cdgtcon(norm,
     $   n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_dgtcon.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        INTEGER  n
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  du2(*)
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgtcon(norm,
     $   n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
