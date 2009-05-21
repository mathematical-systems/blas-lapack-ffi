c	lsamesub.f
c
c	This program is a fortran wrapper for lsame
c
        subroutine lsamesub(output,
     $  ca,
     $  cb)
        logical output
        character ca
        character cb
        EXTERNAL lsame
        logical lsame
        output = lsame(ca, cb)
        return
        end