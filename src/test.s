        incdir "/opt/ndk/include/asm/"
        include "hardware/custom.i"

        ; apparently we have problems linking from C if this section
        ; is different from main's - probably just need some magic on the
        ; c declaration to avoid PC-relative calls.
        code
        xdef    _f
        cnop    0,4
_f:
        moveq   #0,d0
        rts
  

