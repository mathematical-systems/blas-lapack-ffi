        SUBROUTINE czgebd2(m,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   work,
     $   info)
c
c       lapack_zgebd2.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  tauq(*)
        COMPLEX*16  taup(*)
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzgebd2(m,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tauq,
     $   taup,
     $   work,
     $   info)
        RETURN
        END
