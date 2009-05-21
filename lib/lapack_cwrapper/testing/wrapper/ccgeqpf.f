        SUBROUTINE ccgeqpf(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_cgeqpf.c
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
        REAL  rwork(*)
        INTEGER  info

        CALL fcgeqpf(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
