        SUBROUTINE cslags2(upper,
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
c       lapack_slags2.c
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
        REAL  a2
        REAL  a3
        REAL  b1
        REAL  b2
        REAL  b3
        REAL  csu
        REAL  snu
        REAL  csv
        REAL  snv
        REAL  csq
        REAL  snq

        CALL fslags2(upper,
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
