c	dlansbsub.f
c
c	This program is a fortran wrapper for dlansb
c
        subroutine dlansbsub(output,
     $  norm,
     $  uplo,
     $  n,
     $  k,
     $  ab,
     $  ldab,
     $  work)
        double precision output
        character norm
        character uplo
        integer n
        integer k
        double precision ab
        integer ldab
        double precision work
        EXTERNAL dlansb
        double precision dlansb
        output = dlansb(norm, uplo, n, k, ab, ldab, work)
        return
        end