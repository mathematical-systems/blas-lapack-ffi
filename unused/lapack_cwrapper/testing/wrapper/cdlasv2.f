        SUBROUTINE cdlasv2(f,
     $   g,
     $   h,
     $   ssmin,
     $   ssmax,
     $   snl,
     $   csl,
     $   snr,
     $   csr)
c
c       lapack_dlasv2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  f
        DOUBLE PRECISION  g
        DOUBLE PRECISION  h
        DOUBLE PRECISION  ssmin
        DOUBLE PRECISION  ssmax
        DOUBLE PRECISION  snl
        DOUBLE PRECISION  csl
        DOUBLE PRECISION  snr
        DOUBLE PRECISION  csr

        CALL fdlasv2(f,
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
