c	slangbsub.f
c
c	This program is a fortran wrapper for slangb
c
        subroutine slangbsub(output,
     $  norm,
     $  n,
     $  kl,
     $  ku,
     $  ab,
     $  ldab,
     $  work)
        real output
        character norm
        integer n
        integer kl
        integer ku
        real ab
        integer ldab
        real work
        EXTERNAL slangb
        real slangb
        output = slangb(norm, n, kl, ku, ab, ldab, work)
        return
        end