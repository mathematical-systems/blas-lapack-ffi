        INTEGER FUNCTION cilaenv(ispec,
     $   name,
     $   opts,
     $   n1,
     $   n2,
     $   n3,
     $   n4)
c
c       lapack_ilaenv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  ispec
        CHARACTER*(*) name
        CHARACTER*(*) opts
        INTEGER  n1
        INTEGER  n2
        INTEGER  n3
        INTEGER  n4

        EXTERNAL filaenv
        CALL filaenv(cilaenv, ispec,
     $   name,
     $   opts,
     $   n1,
     $   n2,
     $   n3,
     $   n4)
        RETURN
        END
