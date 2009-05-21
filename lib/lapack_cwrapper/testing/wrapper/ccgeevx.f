        SUBROUTINE ccgeevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   ilo,
     $   ihi,
     $   scale,
     $   abnrm,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_cgeevx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  balanc
        CHARACTER  jobvl
        CHARACTER  jobvr
        CHARACTER  sense
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  w(*)
        COMPLEX  vl(*)
        INTEGER  ldvl
        COMPLEX  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        REAL  scale(*)
        REAL  abnrm
        REAL  rconde(*)
        REAL  rcondv(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcgeevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   ilo,
     $   ihi,
     $   scale,
     $   abnrm,
     $   rconde,
     $   rcondv,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
