#define _GLOBAL 
#include "pumpy.h"

/* display controls */
void display_init ();
void display_update ();
void display_close ();

/* input controls */
long input_init ();
void input_close ();

__saveds
int main()
{ 
        SYSBase = *((struct Library **)4l); 
        DOSBase = OpenLibrary ("dos.library", 0l); 

        /* start up all modules */
        input_init ();
        display_init ();

        /* close all modules */
        input_close();

        return (RETURN_OK);
}
