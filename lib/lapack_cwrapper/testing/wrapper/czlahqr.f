        SUBROUTINE czlahqr(wantt,
     $   wantz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   w,
     $   iloz,
     $   ihiz,
     $   z,
     $   ldz,
     $   info)
c
c       lapack_zlahqr.c
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
        COMPLEX*16  h(*)
        INTEGER  ldh
        COMPLEX*16  w(*)
        INTEGER  iloz
        INTEGER  ihiz
        COMPLEX*16  z(*)
        INTEGER  ldz
        INTEGER  info

        CALL fzlahqr(wantt,
     $   wantz,
     $   n,
     $   ilo,
     $   ihi,
     $   h,
     $   ldh,
     $   w,
     $   iloz,
     $   ihiz,
     $   z,
     $   ldz,
     $   info)
        RETURN
        END
