c	lsamensub.f
c
c	This program is a fortran wrapper for lsamen
c
        subroutine lsamensub(output,
     $  n,
     $  ca,
     $  cb)
        logical output
        integer n
        character*(*) ca
        character*(*) cb
        EXTERNAL lsamen
        logical lsamen
        output = lsamen(n, ca, cb)
        return
        end