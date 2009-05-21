        SUBROUTINE cdlaeda(n,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   q,
     $   qptr,
     $   z,
     $   ztemp,
     $   info)
c
c       lapack_dlaeda.c
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
        INTEGER  tlvls
        INTEGER  curlvl
        INTEGER  curpbm
        INTEGER  prmptr(*)
        INTEGER  perm(*)
        INTEGER  givptr(*)
        INTEGER  givcol(*)
        DOUBLE PRECISION  givnum(*)
        DOUBLE PRECISION  q(*)
        INTEGER  qptr(*)
        DOUBLE PRECISION  z(*)
        DOUBLE PRECISION  ztemp(*)
        INTEGER  info

        CALL fdlaeda(n,
     $   tlvls,
     $   curlvl,
     $   curpbm,
     $   prmptr,
     $   perm,
     $   givptr,
     $   givcol,
     $   givnum,
     $   q,
     $   qptr,
     $   z,
     $   ztemp,
     $   info)
        RETURN
        END
