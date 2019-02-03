#ifndef _PUMPY_H
#define _PUMPY_H

#ifdef MINSTART
#define __NOLIBBASE__
#endif
#include <proto/exec.h>
#include <proto/dos.h>

#ifndef _GLOBAL
#define _GLOBAL extern
#endif

/* library has explicit dependencies on these names */
#ifdef MINSTART
_GLOBAL struct Library * DOSBase;
_GLOBAL struct Library * SYSBase;
#endif

/* sequencer state */
#define _nsteps 16
#define _ntracks 4
typedef BYTE sequence[_nsteps];
struct seq {
        sequence track[_ntracks]; /* note info */
        BYTE map[_ntracks];       /* sound mapping */
        BYTE pos;
        BYTE on;
        BYTE rate;
};

_GLOBAL struct seq seq;

#endif /* _PUMPY_H */
