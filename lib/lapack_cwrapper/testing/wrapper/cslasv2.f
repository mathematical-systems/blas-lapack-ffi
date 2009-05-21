        SUBROUTINE cslasv2(f,
     $   g,
     $   h,
     $   ssmin,
     $   ssmax,
     $   snl,
     $   csl,
     $   snr,
     $   csr)
c
c       lapack_slasv2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        REAL  f
        REAL  g
        REAL  h
        REAL  ssmin
        REAL  ssmax
        REAL  snl
        REAL  csl
        REAL  snr
        REAL  csr

        CALL fslasv2(f,
     $   g,
     $   h,
     $   ssmin,
     $   ssmax,
     $   snl,
     $   csl,
     $   snr,
     $   csr)
        RETURN
        END
