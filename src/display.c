#include "pumpy.h"

/* so this is going to be a buffer that is used
 * like a step sequencer display. ok 
 * so I guess just 16 bits with dividers around each 4
 * |....|....|....|....| = 21 + newline
 * and i guess space it out to 32 if that helps
 * and then we'll allow for a few tracks at once */

/* states for sequence entries */
#define c_on '*'
#define c_off '.'
#define c_hold '-'
#define c_bar '|'

/* states for actively edited row */
#define c_row '>'
#define c_sp ' '

/* states for play position */
#define c_cur '+'

/* numbers */
#define c_num(x) ('0'+(x))

/* map sequence position to buffer column */
/* cols = steps + dividers + cursor + inst num + newline = 24 */
#define ncols (_nsteps + (_nsteps/4) + 4)
#define track_pos 0
#define inst_pos (ncols-2)
#define to_col(x) (1 + ((x) + (x)/4 + 1))

#define _x4(x) __x4(x)
#define __x4(x) x,x,x,x
char cb[_ntracks+1][ncols] = 
{
        {c_cur,c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,c_sp,'\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'0','\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'0','\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'0','\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'0','\n'}
};

/* here's our output file handle. we write to 
 * it's position when passed in. */
BPTR out;
LONG pos;

void 
display_init() 
{
        out = Output ();
        pos = Seek (out, 0, OFFSET_CURRENT);

        /* temp */ cb[1][track_pos] = c_row;
        /* temp */ cb[1][inst_pos] = '1';

        Write (out, cb, sizeof(cb));
}

void 
display_update()
{
        Seek (out, pos, OFFSET_BEGINNING); 
        Write (out, cb, sizeof(cb));
}

