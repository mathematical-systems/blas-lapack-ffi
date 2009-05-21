        SUBROUTINE cclahqr(wantt,
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
c       lapack_clahqr.c
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
        COMPLEX  h(*)
        INTEGER  ldh
        COMPLEX  w(*)
        INTEGER  iloz
        INTEGER  ihiz
        COMPLEX  z(*)
        INTEGER  ldz
        INTEGER  info

        CALL fclahqr(wantt,
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
