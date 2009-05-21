c	zlangbsub.f
c
c	This program is a fortran wrapper for zlangb
c
        subroutine zlangbsub(output,
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
        complex*16 ab
        integer ldab
        double precision work
        EXTERNAL zlangb
        double precision zlangb
        output = zlangb(norm, n, kl, ku, ab, ldab, work)
        return
        end