        SUBROUTINE csgeevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
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
     $   iwork,
     $   info)
c
c       lapack_sgeevx.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  wr(*)
        REAL  wi(*)
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        REAL  scale(*)
        REAL  abnrm
        REAL  rconde(*)
        REAL  rcondv(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fsgeevx(balanc,
     $   jobvl,
     $   jobvr,
     $   sense,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
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
     $   iwork,
     $   info)
        RETURN
        END
