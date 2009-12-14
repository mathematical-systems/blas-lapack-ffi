        SUBROUTINE cdlags2(upper,
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
c       lapack_dlags2.c
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
        DOUBLE PRECISION  a1
        DOUBLE PRECISION  a2
        DOUBLE PRECISION  a3
        DOUBLE PRECISION  b1
        DOUBLE PRECISION  b2
        DOUBLE PRECISION  b3
        DOUBLE PRECISION  csu
        DOUBLE PRECISION  snu
        DOUBLE PRECISION  csv
        DOUBLE PRECISION  snv
        DOUBLE PRECISION  csq
        DOUBLE PRECISION  snq

        CALL fdlags2(upper,
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
