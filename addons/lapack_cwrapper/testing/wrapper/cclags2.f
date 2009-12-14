        SUBROUTINE cclags2(upper,
     $   a1,
     $   a2,
     $   a3,
     $   b1,
     $   b2,
     $   b3,
     $   csu,
     $   snu,
     $   csv,
     $   snv,
     $   csq,
     $   snq)
c
c       lapack_clags2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  upper
        REAL  a1
        COMPLEX  a2
        REAL  a3
        REAL  b1
        COMPLEX  b2
        REAL  b3
        REAL  csu
        COMPLEX  snu
        REAL  csv
        COMPLEX  snv
        REAL  csq
        COMPLEX  snq

        CALL fclags2(upper,
     $   a1,
     $   a2,
     $   a3,
     $   b1,
     $   b2,
     $   b3,
     $   csu,
     $   snu,
     $   csv,
     $   snv,
     $   csq,
     $   snq)
        RETURN
        END
