        SUBROUTINE czgebak(job,
     $   side,
     $   n,
     $   ilo,
     $   ihi,
     $   scale,
     $   m,
     $   v,
     $   ldv,
     $   info)
c
c       lapack_zgebak.c
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
        CHARACTER  side
        INTEGER  n
        INTEGER  ilo
        INTEGER  ihi
        DOUBLE PRECISION  scale(*)
        INTEGER  m
        COMPLEX*16  v(*)
        INTEGER  ldv
        INTEGER  info

        CALL fzgebak(job,
     $   side,
     $   n,
     $   ilo,
     $   ihi,
     $   scale,
     $   m,
     $   v,
     $   ldv,
     $   info)
        RETURN
        END
