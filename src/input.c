#include "pumpy.h"
#include "devices/input.h"
#include "clib/debug_protos.h"

/* input stuff based on exec device IO for now? */

/* interface idea: */
/* 1234 - select track 
 * enter/space - start/stop
 * qwertyui - toggle first 8
 * asdfghjk - toggle last 8
 * shift+numbers - do things to notes on track
 * shift+qwertys - add, not toggle
 * ctrl+qwertys - delete, not toggle
 * <> - toggle inst
 * also may want to add tie/hold, accent 
 * and also want exit, maybe ctrl+z or ctrl+c
 * and tempo, maybe shift+<>
 */

struct Interrupt *handler;
struct MsgPort *port;
struct IOStdReq *req;
#define ioreq ((struct IORequest *)req)

struct input 
{
        int key; /* temp */
};
struct input input;

extern void input_handler();

long 
input_init() 
{
        port = CreateMsgPort ();
        req = CreateIORequest (port, sizeof(struct IOStdReq));

        if (OpenDevice ("input.device", 0, ioreq, 0))
        {
                DeleteIORequest (req);
                DeleteMsgPort (port);
                return 0;
        }

        handler = AllocMem (sizeof(struct Interrupt), MEMF_PUBLIC|MEMF_CLEAR);

        handler->is_Code = (VOID (*)) input_handler;
        handler->is_Data = (APTR) &input;
        handler->is_Node.ln_Pri = 100;
        handler->is_Node.ln_Name = "input_handler";
 
        req->io_Data = (APTR) handler;
        req->io_Command = IND_ADDHANDLER;
        DoIO (ioreq);
        return 1;
}

void
input_close()
{
        req->io_Data = (APTR) handler;
        req->io_Command = IND_REMHANDLER;
        DoIO (ioreq);
/*
        if (!(CheckIO (ioreq)))
                AbortIO(ioreq);
        WaitIO(ioreq); 
*/
        CloseDevice(ioreq);
        DeleteIORequest (req);
        DeleteMsgPort (port);
        FreeMem (handler, sizeof(struct Interrupt));
}
