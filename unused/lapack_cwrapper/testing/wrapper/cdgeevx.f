        SUBROUTINE cdgeevx(balanc,
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
c       lapack_dgeevx.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  scale(*)
        DOUBLE PRECISION  abnrm
        DOUBLE PRECISION  rconde(*)
        DOUBLE PRECISION  rcondv(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgeevx(balanc,
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
