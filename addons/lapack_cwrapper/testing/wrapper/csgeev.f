        SUBROUTINE csgeev(jobvl,
     $   jobvr,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_sgeev.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobvl
        CHARACTER  jobvr
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  wr(*)
        REAL  wi(*)
        REAL  vl(*)
        INTEGER  ldvl
        REAL  vr(*)
        INTEGER  ldvr
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsgeev(jobvl,
     $   jobvr,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
