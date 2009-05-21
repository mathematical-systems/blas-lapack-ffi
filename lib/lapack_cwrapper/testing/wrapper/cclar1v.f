        SUBROUTINE cclar1v(n,
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
c       lapack_clar1v.c
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
        REAL  sigma
        REAL  l(*)
        REAL  d(*)
        REAL  ld(*)
        REAL  lld(*)
        REAL  gersch(*)
        COMPLEX  z(*)
        REAL  ztz
        REAL  mingma
        INTEGER  r
        INTEGER  isuppz(*)
        REAL  work(*)

        CALL fclar1v(n,
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
