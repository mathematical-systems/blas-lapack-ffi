        SUBROUTINE cssygv(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   w,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ssygv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  b(*)
        INTEGER  ldb
        REAL  w(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fssygv(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   w,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
