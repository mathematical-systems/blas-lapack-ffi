        SUBROUTINE czgeevx(balanc,
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
c       lapack_zgeevx.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  w(*)
        COMPLEX*16  vl(*)
        INTEGER  ldvl
        COMPLEX*16  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  scale(*)
        DOUBLE PRECISION  abnrm
        DOUBLE PRECISION  rconde(*)
        DOUBLE PRECISION  rcondv(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzgeevx(balanc,
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
