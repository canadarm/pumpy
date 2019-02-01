/* defs for sequencer model */

#ifndef _SEQ_H
#define _SEQ_H

#include "pumpy.h"

#ifndef _SEQ_GLOBAL
#define _SEQ_GLOBAL extern

#define seqlen 16

struct seq {
        BYTE state[4][seqlen];
        BYTE cur; 
        BYTE pos;
};

_SEQ_GLOBAL struct seq seq;

void init_seq();

#endif /* SEQ_H */
