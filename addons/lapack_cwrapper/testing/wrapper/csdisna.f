        SUBROUTINE csdisna(job,
     $   m,
     $   n,
     $   d,
     $   sep,
     $   info)
c
c       lapack_sdisna.c
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
        INTEGER  m
        INTEGER  n
        REAL  d(*)
        REAL  sep(*)
        INTEGER  info

        CALL fsdisna(job,
     $   m,
     $   n,
     $   d,
     $   sep,
     $   info)
        RETURN
        END
