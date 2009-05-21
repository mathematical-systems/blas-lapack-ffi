c	dlangesub.f
c
c	This program is a fortran wrapper for dlange
c
        subroutine dlangesub(output,
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
        double precision a
        integer lda
        double precision work
        EXTERNAL dlange
        double precision dlange
        output = dlange(norm, m, n, a, lda, work)
        return
        end