        SUBROUTINE cdgebrd(m,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgebrd.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  tauq(*)
        DOUBLE PRECISION  taup(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgebrd(m,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
