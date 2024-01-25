#include <stdio.h>
#include "imboi.h"


int main(){
    struct Window *window = createWindow("hello Wolrd");
    while(1){
        drawLabel(window, "Hello World");
        getEvent(window);
    };
    return 0;
}
