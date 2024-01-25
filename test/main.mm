#import <Cocoa/Cocoa.h>

@interface CustomView : NSView
@end

@implementation CustomView : NSView {
}
    - (void)drawRect:(NSRect)aRect
    {
        NSLog(@"Hi");
        [super drawRect:aRect];
        [[NSColor redColor] set];
        NSRectFill(NSMakeRect(0, 0, 400, 400));
        // [super setNeedsDisplay];
    }
@end


int main(){
		NSApplication *application = [NSApplication sharedApplication];
        NSRect windowRect = NSMakeRect(500, 500, 400, 200);
        NSWindow *window = [[NSWindow alloc] initWithContentRect:windowRect
        /// NSWindowFullScreenButton is 7
                                                       styleMask:7 | NSWindowStyleMaskResizable
                                                         backing:NSBackingStoreBuffered
                                                           defer:NO];
        [window setTitle:@"Greetings"];
		[window makeKeyAndOrderFront:nil];
        while (1) {
        CustomView *view = [[CustomView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
        [[window contentView] addSubview:view];
        ;NSEvent *event;
			event = [application nextEventMatchingMask:NSEventMaskAny
                                              untilDate:[NSDate distantFuture]
                                                 inMode:NSDefaultRunLoopMode
                                                dequeue:YES];

            if (event) {
                // printf("(%d), %d\n", event.type, event);
                [application sendEvent:event];
            }
        }
}