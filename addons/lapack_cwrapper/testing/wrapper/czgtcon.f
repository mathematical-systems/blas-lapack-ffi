        SUBROUTINE czgtcon(norm,
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
c       lapack_zgtcon.c
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
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)
        COMPLEX*16  du2(*)
        INTEGER  ipiv(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzgtcon(norm,
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
