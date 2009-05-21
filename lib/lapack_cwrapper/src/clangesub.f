c	clangesub.f
c
c	This program is a fortran wrapper for clange
c
        subroutine clangesub(output,
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
        complex a
        integer lda
        real work
        EXTERNAL clange
        real clange
        output = clange(norm, m, n, a, lda, work)
        return
        end