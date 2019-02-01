#define _GLOBAL 
#include "pumpy.h"
#include "ui.h"

/* library has explicit dependencies on these. */
struct Library * DOSBase;
struct Library * SYSBase;

__saveds
int main()
{ 
        base.sys = SYSBase = *((struct Library **)4l); 
        base.dos = DOSBase = OpenLibrary ("dos.library", 0l); 
        ui_init (Output ());

        CloseLibrary (base.dos);
        return (RETURN_OK);
}
