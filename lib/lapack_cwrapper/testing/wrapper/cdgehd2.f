        SUBROUTINE cdgehd2(n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
c
c       lapack_dgehd2.c
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
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdgehd2(n,
     $   ilo,
     $   ihi,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
