c	dlangbsub.f
c
c	This program is a fortran wrapper for dlangb
c
        subroutine dlangbsub(output,
     $  norm,
     $  n,
     $  kl,
     $  ku,
     $  ab,
     $  ldab,
     $  work)
        double precision output
        character norm
        integer n
        integer kl
        integer ku
        double precision ab
        integer ldab
        double precision work
        EXTERNAL dlangb
        double precision dlangb
        output = dlangb(norm, n, kl, ku, ab, ldab, work)
        return
        end