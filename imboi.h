/*imboi.h - Immediate UI for MacOS


*/

#ifndef _IMBOI_H
#define _IMBOI_H
#include <stdint.h>

struct Window;
typedef struct Window Window;

Window* createWindow(char *title);
void getEvent(struct Window *window);
uint32_t __drawLabel(struct Window *window, char *title, int line, char *file);
 void removeItem(void *view);

#define CreateWindow createWindow
#define create_window createWindow
#define GetEvent getEvent
#define get_event getEvent
#define drawLabel(window, title) __drawLabel(window, title, __LINE__, __FILE__)
#define DrawLabel drawLabel
#define draw_label drawLabel
#define RemoveItem removeItem
#define remove_item removeItem

#endif
