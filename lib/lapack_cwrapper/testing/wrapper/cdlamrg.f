        SUBROUTINE cdlamrg(n1,
     $   n2,
     $   a,
     $   dtrd1,
     $   dtrd2,
     $   index)
c
c       lapack_dlamrg.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  dtrd1
        INTEGER  dtrd2
        INTEGER  index(*)

        CALL fdlamrg(n1,
     $   n2,
     $   a,
     $   dtrd1,
     $   dtrd2,
     $   index)
        RETURN
        END
