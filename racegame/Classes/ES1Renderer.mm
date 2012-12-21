//
//  ES1Renderer.m
//  racegame
//

#define randF() ((float)(rand() % 1001) * 0.001f)

#import "ES1Renderer.h"
#import "graphicUtil.h"

@implementation ES1Renderer
@synthesize currentGame;

// Create an ES 1.1 context
- (id) init
{
	if (self = [super init])
	{
		context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
        
        if (!context || ![EAGLContext setCurrentContext:context])
		{
            [self release];
            return nil;
        }
		
		// Create default framebuffer object. The backing will be allocated for the current layer in -resizeFromLayer
		glGenFramebuffersOES(1, &defaultFramebuffer);
		glGenRenderbuffersOES(1, &colorRenderbuffer);
		glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
		glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer);
		
		[self loadTextures];	//テクスチャを読み込みます
		
		//パーティクルシステムを生成します
		//パーティクルの最大数は100, 一つ一つのパーティクルの寿命は30フレームです
		particleSystem = new ParticleSystem(100, 30);
	}
	
	return self;
}

- (void) loadTextures{
	//ゲーム内で使用するテクスチャの元画像を読み込みます
	//本来はここでファイルが存在しなかった場合等に備えて
	//エラーチェックを行った方が安全ですが、
	//ここでは可読性を重視し省略しています
	
	carTexture = loadTexture(@"car.png");	//車のテクスチャを読み込みます
	courseTexture = loadTexture(@"course.png");
	checkPointTexture = loadTexture(@"checkpoint.png");
	numberTexture = loadTexture(@"number_texture.png");
	particleTexture = loadTexture(@"particle.png");
}
- (void) deleteTextures{
	glDeleteTextures(1, &carTexture);
	glDeleteTextures(1, &courseTexture);
	glDeleteTextures(1, &checkPointTexture);
	glDeleteTextures(1, &particleTexture);
}

- (void) render
{
    // This application only creates a single context which is already set current at this point.
	// This call is redundant, but needed if dealing with multiple contexts.
    [EAGLContext setCurrentContext:context];
    
	// This application only creates a single default framebuffer which is already bound at this point.
	// This call is redundant, but needed if dealing with multiple framebuffers.
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer);
    glViewport(0, 0, backingWidth, backingHeight);
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
	glOrthof(-1.5f, 1.5f, -1.0f, 1.0f, 0.5f, -0.5f);
    glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	
    glClearColor(0.1f, 0.1f, 0.1f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self renderMain];
    
	// This application only creates a single color renderbuffer which is already bound at this point.
	// This call is redundant, but needed if dealing with multiple renderbuffers.
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (void) renderMain{
	//現在の車の位置にパーティクルを発生させます
	float moveX = (randF() - 0.5f) * 0.002f;
	float moveY = (randF() - 0.5f) * 0.002f;
	particleSystem->add(currentGame.myCar->x, currentGame.myCar->y, 0.05f, moveX, moveY);
	
	//コースを描画します
	drawTexture(0.0f, 0.0f, 2.0f, 2.0f, 
				courseTexture, 255, 255, 255, 255);
	
	//パーティクルを描画します
	particleSystem->update();
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE);
	particleSystem->draw(particleTexture);
	glDisable(GL_BLEND);
	
	//チェックポイントを描画します
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	for(int i=0; i<CHECK_POINT_COUNT; i++){
		drawTexture(currentGame.checkPoints[i]->x, currentGame.checkPoints[i]->y, 
					currentGame.checkPoints[i]->radius * 2.0f,
					currentGame.checkPoints[i]->radius * 2.0f, 
					checkPointTexture, 255, 255, 255, 
					(i == currentGame.nextCheckPointId) ? 255: 128);
	}
	glDisable(GL_BLEND);
	
	//車を描画します
	glPushMatrix();
	glTranslatef(currentGame.myCar->x, currentGame.myCar->y, 0.0f);	//車の座標まで移動します
	glRotatef(currentGame.myCar->angle, 0.0f, 0.0f, 1.0f);
	glScalef(currentGame.myCar->radius, currentGame.myCar->radius, 1.0f);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	drawTexture(0.0f, 0.0f, 2.0f, 2.0f, carTexture, 255, 255, 255, 255);
	glDisable(GL_BLEND);
	glPopMatrix();
	
	//周回数を左上に描画します
	drawNumbers(-1.0f, 0.75f, 0.2f, 0.2f, numberTexture, currentGame.lapId, 2, 255, 255, 255, 255);
	
	//ラップタイムを右上に描画します
	int currentLapTimeSeconds = (int)floor(currentGame.currentLapTime);
	int currentLapTimeMilliSeconds = (int)floor(currentGame.currentLapTime * 1000.0f) % 1000;
	drawNumbers(0.95f, 0.95f, 0.1f, 0.1f, numberTexture, currentLapTimeSeconds, 3, 255, 255, 255, 255);
	drawNumbers(1.3f, 0.95f, 0.1f, 0.1f, numberTexture, currentLapTimeMilliSeconds, 3, 255, 255, 255, 255);
	
	//ファステスとラップタイムを右上に描画します
	int fastestLapTimeSeconds = (int)floor(currentGame.fastestLapTime);
	int fastestLapTimeMilliSeconds = (int)floor(currentGame.fastestLapTime * 1000.0f) % 1000;
	drawNumbers(0.95f, 0.75f, 0.1f, 0.1f, numberTexture, fastestLapTimeSeconds, 3, 255, 255, 255, 255);
	drawNumbers(1.3f, 0.75f, 0.1f, 0.1f, numberTexture, fastestLapTimeMilliSeconds, 3, 255, 255, 255, 255);
}

- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer
{	
	// Allocate color buffer backing based on the current layer size
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer);
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
	glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
	
    if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
	{
		NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }
    
    return YES;
}

- (void) dealloc
{
	// Tear down GL
	if (defaultFramebuffer)
	{
		glDeleteFramebuffersOES(1, &defaultFramebuffer);
		defaultFramebuffer = 0;
	}

	if (colorRenderbuffer)
	{
		glDeleteRenderbuffersOES(1, &colorRenderbuffer);
		colorRenderbuffer = 0;
	}
	
	// Tear down context
	if ([EAGLContext currentContext] == context)
        [EAGLContext setCurrentContext:nil];
	
	[context release];
	context = nil;
	
	[super dealloc];
}

@end
