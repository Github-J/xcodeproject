//
//  EAGLView.m
//  racegame
//

#import "EAGLView.h"

#import "ES1Renderer.h"

@implementation EAGLView

@synthesize animating;
@dynamic animationFrameInterval;

// You must implement this method
+ (Class) layerClass
{
    return [CAEAGLLayer class];
}

//The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id) initWithCoder:(NSCoder*)coder
{    
    if ((self = [super initWithCoder:coder]))
	{
        // Get the layer
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
        
        eaglLayer.opaque = TRUE;
        eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
		
			renderer = [[ES1Renderer alloc] init];
			
			if (!renderer)
			{
				[self release];
				return nil;
			}
		
        
		animating = FALSE;
		displayLinkSupported = FALSE;
		animationFrameInterval = 1;
		displayLink = nil;
		animationTimer = nil;
		
		// A system version of 3.1 or greater is required to use CADisplayLink. The NSTimer
		// class is used as fallback when it isn't available.
		NSString *reqSysVer = @"3.1";
		NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
		if ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending)
			displayLinkSupported = TRUE;
		
		//MyGameのインスタンスを作成し、currentGameがそれを参照するようにします
		currentGame = [[MyGame alloc] init];
		renderer.currentGame = currentGame;	//レンダラーからも参照できるようにします
		
		//ユーザインターフェイスを作成します
		UIButton *leftButton, *rightButton, *accelButton;
		
		//左右旋回のボタンを設置します
		leftButton = [[UIButton alloc] 
					  initWithFrame:CGRectMake(0.0f, 220.0f, 100.0f, 100.0f)];
		[leftButton setBackgroundImage:
					[UIImage imageNamed:@"leftbutton.png"]
					forState:UIControlStateNormal & UIControlStateHighlighted];
		[leftButton addTarget:currentGame action:@selector(leftButtonTouchedDown:) forControlEvents:UIControlEventTouchDown];
		[leftButton addTarget:currentGame action:@selector(leftButtonTouchedUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
		[self addSubview:leftButton];
		
		rightButton = [[UIButton alloc] 
					  initWithFrame:CGRectMake(100.0f, 220.0f, 100.0f, 100.0f)];
		[rightButton setBackgroundImage:
		 [UIImage imageNamed:@"rightbutton.png"]
							  forState:UIControlStateNormal & UIControlStateHighlighted];
		[rightButton addTarget:currentGame action:@selector(rightButtonTouchedDown:) forControlEvents:UIControlEventTouchDown];
		[rightButton addTarget:currentGame action:@selector(rightButtonTouchedUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
		[self addSubview:rightButton];
		
		//アクセルボタンを設置します
		accelButton = [[UIButton alloc] 
					  initWithFrame:CGRectMake(380.0f, 270.0f, 100.0f, 50.0f)];
		[accelButton setBackgroundImage:
		 [UIImage imageNamed:@"accelbutton.png"]
							  forState:UIControlStateNormal & UIControlStateHighlighted];
		[accelButton addTarget:currentGame action:@selector(accelButtonTouchedDown:) forControlEvents:UIControlEventTouchDown];
		[accelButton addTarget:currentGame action:@selector(accelButtonTouchedUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
		[self addSubview:accelButton];
    }
	
    return self;
}

- (void) drawView:(id)sender
{
	[currentGame update];	//画面を描画する前にゲームを更新します
    [renderer render];		//画面を描画します
}

- (void) layoutSubviews
{
	[renderer resizeFromLayer:(CAEAGLLayer*)self.layer];
    [self drawView:nil];
}

- (NSInteger) animationFrameInterval
{
	return animationFrameInterval;
}

- (void) setAnimationFrameInterval:(NSInteger)frameInterval
{
	// Frame interval defines how many display frames must pass between each time the
	// display link fires. The display link will only fire 30 times a second when the
	// frame internal is two on a display that refreshes 60 times a second. The default
	// frame interval setting of one will fire 60 times a second when the display refreshes
	// at 60 times a second. A frame interval setting of less than one results in undefined
	// behavior.
	if (frameInterval >= 1)
	{
		animationFrameInterval = frameInterval;
		
		if (animating)
		{
			[self stopAnimation];
			[self startAnimation];
		}
	}
}

- (void) startAnimation
{
	if (!animating)
	{
		if (displayLinkSupported)
		{
			// CADisplayLink is API new to iPhone SDK 3.1. Compiling against earlier versions will result in a warning, but can be dismissed
			// if the system version runtime check for CADisplayLink exists in -initWithCoder:. The runtime check ensures this code will
			// not be called in system versions earlier than 3.1.

			displayLink = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(drawView:)];
			[displayLink setFrameInterval:animationFrameInterval];
			[displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
		}
		else
			animationTimer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)((1.0 / 60.0) * animationFrameInterval) target:self selector:@selector(drawView:) userInfo:nil repeats:TRUE];
		
		animating = TRUE;
	}
}

- (void)stopAnimation
{
	if (animating)
	{
		if (displayLinkSupported)
		{
			[displayLink invalidate];
			displayLink = nil;
		}
		else
		{
			[animationTimer invalidate];
			animationTimer = nil;
		}
		
		animating = FALSE;
	}
}

- (void) dealloc
{
    [renderer release];
	
    [super dealloc];
}

@end
