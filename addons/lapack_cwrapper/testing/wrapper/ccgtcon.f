        SUBROUTINE ccgtcon(norm,
     $   n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
c
c       lapack_cgtcon.c
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
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)
        COMPLEX  du2(*)
        INTEGER  ipiv(*)
        REAL  anorm
        REAL  rcond
        COMPLEX  work(*)
        INTEGER  info

        CALL fcgtcon(norm,
     $   n,
     $   dl,
     $   d,
     $   du,
     $   du2,
     $   ipiv,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
        RETURN
        END
