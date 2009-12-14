        SUBROUTINE cdlascl(type,
     $   kl,
     $   ku,
     $   cfrom,
     $   cto,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   info)
c
c       lapack_dlascl.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  type
        INTEGER  kl
        INTEGER  ku
        DOUBLE PRECISION  cfrom
        DOUBLE PRECISION  cto
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  info

        CALL fdlascl(type,
     $   kl,
     $   ku,
     $   cfrom,
     $   cto,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   info)
        RETURN
        END
