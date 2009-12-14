        SUBROUTINE czlags2(upper,
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
c       lapack_zlags2.c
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
        COMPLEX*16  a2
        DOUBLE PRECISION  a3
        DOUBLE PRECISION  b1
        COMPLEX*16  b2
        DOUBLE PRECISION  b3
        DOUBLE PRECISION  csu
        COMPLEX*16  snu
        DOUBLE PRECISION  csv
        COMPLEX*16  snv
        DOUBLE PRECISION  csq
        COMPLEX*16  snq

        CALL fzlags2(upper,
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
