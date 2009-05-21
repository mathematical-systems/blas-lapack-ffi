        SUBROUTINE cdlatdf(ijob,
     $   n,
     $   z,
     $   ldz,
     $   rhs,
     $   rdsum,
     $   rdscal,
     $   ipiv,
     $   jpiv)
c
c       lapack_dlatdf.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  ijob
        INTEGER  n
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  rhs(*)
        DOUBLE PRECISION  rdsum
        DOUBLE PRECISION  rdscal
        INTEGER  ipiv(*)
        INTEGER  jpiv(*)

        CALL fdlatdf(ijob,
     $   n,
     $   z,
     $   ldz,
     $   rhs,
     $   rdsum,
     $   rdscal,
     $   ipiv,
     $   jpiv)
        RETURN
        END
