        SUBROUTINE cslaqge(m,
     $   n,
     $   a,
     $   lda,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
c
c       lapack_slaqge.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  r(*)
        REAL  c(*)
        REAL  rowcnd
        REAL  colcnd
        REAL  amax
        CHARACTER  equed

        CALL fslaqge(m,
     $   n,
     $   a,
     $   lda,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
        RETURN
        END
