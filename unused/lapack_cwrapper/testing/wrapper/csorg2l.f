        SUBROUTINE csorg2l(m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
c
c       lapack_sorg2l.c
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
        INTEGER  k
        REAL  a(*)
        INTEGER  lda
        REAL  tau(*)
        REAL  work(*)
        INTEGER  info

        CALL fsorg2l(m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
