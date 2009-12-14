c	slangesub.f
c
c	This program is a fortran wrapper for slange
c
        subroutine slangesub(output,
     $  norm,
     $  m,
     $  n,
     $  a,
     $  lda,
     $  work)
        real output
        character norm
        integer m
        integer n
        real a
        integer lda
        real work
        EXTERNAL slange
        real slange
        output = slange(norm, m, n, a, lda, work)
        return
        end