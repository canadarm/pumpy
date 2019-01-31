#include "pumpy.h"

__saveds
int main()
{ 
        if (!init_base())
                return (1);

        Write(Output(),"Computer\n",9); 

        close_base();
        return (RETURN_OK);
}
