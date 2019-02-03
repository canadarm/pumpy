        incdir "/opt/ndk/include/asm/"
        include "hardware/custom.i"
        include "exec/types.i"
        include "exec/io.i"
        include "devices/inputevent.i"

        ; apparently we have problems linking from C if this section
        ; is different from main's - probably just need some magic on the
        ; c declaration to avoid PC-relative calls.
        xdef    _input_handler

        cnop    0,4
_input_handler:
        move.l  a0,d0
        rts
  

