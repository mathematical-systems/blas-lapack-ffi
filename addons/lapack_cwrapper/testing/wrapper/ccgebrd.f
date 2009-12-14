        SUBROUTINE ccgebrd(m,
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
c       lapack_cgebrd.c
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
        REAL  d(*)
        REAL  e(*)
        COMPLEX  tauq(*)
        COMPLEX  taup(*)
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcgebrd(m,
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
