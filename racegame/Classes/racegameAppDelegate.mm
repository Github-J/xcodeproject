//
//  racegameAppDelegate.m
//  racegame
//

#import "racegameAppDelegate.h"
#import "EAGLView.h"

@implementation racegameAppDelegate

@synthesize window;
@synthesize glView;

- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	//1.アプリをランドスケープモードに設定します
	[[UIApplication sharedApplication] setStatusBarOrientation:
	 UIInterfaceOrientationLandscapeRight];
	
	//2.画面上のビュー(EAGLView)を90度回転させ、サイズを画面に合わせます
	UIScreen* screen = [UIScreen mainScreen];
	glView.bounds = CGRectMake(0.0f, 0.0f, screen.bounds.size.height,
							   screen.bounds.size.width);
	glView.transform = CGAffineTransformConcat(glView.transform,
				CGAffineTransformMakeRotation((M_PI * 90.0f / 180.0f)));
	
	//3.ステータスバーを非表示にします
	[[UIApplication sharedApplication] setStatusBarHidden:YES];
	
	[glView startAnimation];
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	[glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) dealloc
{
	[window release];
	[glView release];
	
	[super dealloc];
}

@end
