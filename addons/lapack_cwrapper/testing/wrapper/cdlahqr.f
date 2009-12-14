        SUBROUTINE cdlahqr(wantt,
     $   wantz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   iloz,
     $   ihiz,
     $   z,
     $   ldz,
     $   info)
c
c       lapack_dlahqr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  wantt
        LOGICAL  wantz
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  h(*)
        INTEGER  ldh
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        INTEGER  iloz
        INTEGER  ihiz
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        INTEGER  info

        CALL fdlahqr(wantt,
     $   wantz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   wr,
     $   wi,
     $   iloz,
     $   ihiz,
     $   z,
     $   ldz,
     $   info)
        RETURN
        END
