        SUBROUTINE cdgebal(job,
     $   n,
     $   a,
     $   lda,
     $   ilo,
     $   ihi,
     $   scale,
     $   info)
c
c       lapack_dgebal.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  job
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  scale(*)
        INTEGER  info

        CALL fdgebal(job,
     $   n,
     $   a,
     $   lda,
     $   ilo,
     $   ihi,
     $   scale,
     $   info)
        RETURN
        END
