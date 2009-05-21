        SUBROUTINE czlar1v(n,
     $   b1,
     $   bn,
     $   sigma,
     $   l,
     $   d,
     $   ld,
     $   lld,
     $   gersch,
     $   z,
     $   ztz,
     $   mingma,
     $   r,
     $   isuppz,
     $   work)
c
c       lapack_zlar1v.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        INTEGER  b1
        INTEGER  bn
        DOUBLE PRECISION  sigma
        DOUBLE PRECISION  l(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  ld(*)
        DOUBLE PRECISION  lld(*)
        DOUBLE PRECISION  gersch(*)
        COMPLEX*16  z(*)
        DOUBLE PRECISION  ztz
        DOUBLE PRECISION  mingma
        INTEGER  r
        INTEGER  isuppz(*)
        DOUBLE PRECISION  work(*)

        CALL fzlar1v(n,
     $   b1,
     $   bn,
     $   sigma,
     $   l,
     $   d,
     $   ld,
     $   lld,
     $   gersch,
     $   z,
     $   ztz,
     $   mingma,
     $   r,
     $   isuppz,
     $   work)
        RETURN
        END
