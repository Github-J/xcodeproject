//
//  racegameAppDelegate.h
//  racegame
//

#import <UIKit/UIKit.h>

@class EAGLView;

@interface racegameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;

@end

