#ifndef _PUMPY_H
#define _PUMPY_H

#define __NOLIBBASE__
#include <proto/exec.h>
#include <proto/dos.h>

#ifndef _BASE_GLOBAL
#define _BASE_GLOBAL extern
#endif

struct _base_ptrs 
{
        struct Library *sys;
        struct Library *dos;
};

long init_base();

_BASE_GLOBAL struct _base_ptrs base;

#endif /* _PUMPY_H */
