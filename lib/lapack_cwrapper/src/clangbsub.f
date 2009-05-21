c	clangbsub.f
c
c	This program is a fortran wrapper for clangb
c
        subroutine clangbsub(output,
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
        complex ab
        integer ldab
        real work
        EXTERNAL clangb
        real clangb
        output = clangb(norm, n, kl, ku, ab, ldab, work)
        return
        end