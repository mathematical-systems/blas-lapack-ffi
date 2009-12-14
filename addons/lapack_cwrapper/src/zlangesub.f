c	zlangesub.f
c
c	This program is a fortran wrapper for zlange
c
        subroutine zlangesub(output,
     $  norm,
     $  m,
     $  n,
     $  a,
     $  lda,
     $  work)
        double precision output
        character norm
        integer m
        integer n
        complex*16 a
        integer lda
        double precision work
        EXTERNAL zlange
        double precision zlange
        output = zlange(norm, m, n, a, lda, work)
        return
        end