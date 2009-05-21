c	ilaenvsub.f
c
c	This program is a fortran wrapper for ilaenv
c
        subroutine ilaenvsub(output,
     $  ispec,
     $  name,
     $  opts,
     $  n1,
     $  n2,
     $  n3,
     $  n4)
        integer output
        integer ispec
        character*(*) name
        character*(*) opts
        integer n1
        integer n2
        integer n3
        integer n4
        EXTERNAL ilaenv
        integer ilaenv
        output = ilaenv(ispec, name, opts, n1, n2, n3, n4)
        return
        end