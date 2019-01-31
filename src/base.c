#define _BASE_GLOBAL /* take ownership of globals */
#include "pumpy.h"

/* library has explicit dependencies on these. */
struct Library * DOSBase;
struct Library * SYSBase;

long init_base()
{
        base.sys = SYSBase = *((struct Library **)4l); 
        base.dos = DOSBase = OpenLibrary ("dos.library", 0l); 
        return (!!base.dos);      
}

void close_base() 
{
        if (!!base.dos) 
                CloseLibrary (base.dos);
}
