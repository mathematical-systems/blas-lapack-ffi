        SUBROUTINE ccgesvd(jobu,
     $   jobvt,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_cgesvd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobu
        CHARACTER  jobvt
        INTEGER  m
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        REAL  s(*)
        COMPLEX  u(*)
        INTEGER  ldu
        COMPLEX  vt(*)
        INTEGER  ldvt
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcgesvd(jobu,
     $   jobvt,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   s,
     $   u,
     $   ldu,
     $   vt,
     $   ldvt,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
