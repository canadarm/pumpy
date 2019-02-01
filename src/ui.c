#include "ui.h"

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

/* map sequence position to buffer column */
#define to_col(x) (1 + ((x) + (x)/4 + 1))
#define nsteps 16
#define ncols (nsteps + (nsteps/4) + 3)

#define _x4(x) __x4(x)
#define __x4(x) x,x,x,x
char cb[5][ncols] = 
{
        {c_cur,c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,_x4(c_sp),c_off,'\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'\n'},
        {c_sp,c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,_x4(c_off),c_bar,'\n'}
};

/* here's our output file handle. we write to 
 * it's position when passed in. */
BPTR out;
LONG pos;

void 
ui_init(BPTR f) 
{
        out = f;
        pos = Seek (f, 0, OFFSET_CURRENT);

        /* temp */ cb[1][0] = c_row;

        Write (out, cb, sizeof(cb));
}

void 
ui_update()
{
        Seek (out, pos, OFFSET_BEGINNING); 
        Write (out, cb, sizeof(cb));
}

