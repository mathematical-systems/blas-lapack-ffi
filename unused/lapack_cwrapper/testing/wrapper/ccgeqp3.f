        SUBROUTINE ccgeqp3(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_cgeqp3.c
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
        INTEGER  jpvt(*)
        COMPLEX  tau(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcgeqp3(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
