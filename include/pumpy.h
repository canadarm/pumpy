#ifndef _PUMPY_H
#define _PUMPY_H

#define __NOLIBBASE__
#include <proto/exec.h>
#include <proto/dos.h>

#ifndef _GLOBAL
#define _GLOBAL extern
#endif

struct base 
{
        struct Library *sys;
        struct Library *dos;
};

_GLOBAL struct base base;

#endif /* _PUMPY_H */
