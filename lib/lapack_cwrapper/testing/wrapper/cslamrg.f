        SUBROUTINE cslamrg(n1,
     $   n2,
     $   a,
     $   strd1,
     $   strd2,
     $   index)
c
c       lapack_slamrg.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n1
        INTEGER  n2
        REAL  a(*)
        INTEGER  strd1
        INTEGER  strd2
        INTEGER  index(*)

        CALL fslamrg(n1,
     $   n2,
     $   a,
     $   strd1,
     $   strd2,
     $   index)
        RETURN
        END
