#import <Cocoa/Cocoa.h>
#include <stdlib.h>

// TODO: Implement copy system

struct Window {
	NSWindow *window;
	NSApplication *application;
};

typedef struct Window Window;



extern "C" void getEvent(struct Window *window){
		NSEvent *event;
			event = [window->application nextEventMatchingMask:NSEventMaskAny
                                              untilDate:[NSDate distantFuture]
                                                 inMode:NSDefaultRunLoopMode
                                                dequeue:YES];

            if (event) {
                [window->application sendEvent:event];
            }
};


extern "C" struct Window *createWindow(char *title){
		struct Window *windowR;
        NSString *string = [NSString stringWithUTF8String:title];
		NSApplication *application = [NSApplication sharedApplication];
        NSRect windowRect = NSMakeRect(500, 500, 400, 200);
        NSWindow *window = [[NSWindow alloc] initWithContentRect:windowRect
        /// NSWindowFullScreenButton is 7
                                                       styleMask:7 | NSWindowStyleMaskResizable
                                                         backing:NSBackingStoreBuffered
                                                           defer:NO];
        [window setTitle:string];
		[window makeKeyAndOrderFront:nil];
    	windowR->window = window;
    	windowR->application = application;
		return windowR;
};

struct Id {
  uint32_t ide;
  NSView *view;
};
struct Id ids[500];
int idslen = 0;


// Returns a unique id of the label
extern "C" uint32_t __drawLabel(struct Window *window, char *title, int line, char *file){
  NSString *resText = [NSString stringWithUTF8String:title];
  NSTextField *textField = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
  [textField setStringValue:resText];
  [textField setEditable:0];
  [textField setBezeled:1];
  [textField setDrawsBackground:1];
  [textField setBackgroundColor:NSColor.clearColor];
  [[window->window contentView] addSubview:textField];
  uint32_t ide = arc4random_uniform(537);
  ide *= *title / line * *file;
  ide += *file * arc4random_uniform(970)-302;
  ide /= line;
  ids[idslen].ide = ide;
  ids[idslen].view = textField;
  idslen++;
  return ide;
};

