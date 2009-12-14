        SUBROUTINE ccgelqf(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_cgelqf.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  tau(*)
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcgelqf(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
