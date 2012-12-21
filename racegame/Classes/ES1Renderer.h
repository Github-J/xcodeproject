//
//  ES1Renderer.h
//  racegame
//

#import "ESRenderer.h"
#import "MyGame.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#import "ParticleSystem.h"

@interface ES1Renderer : NSObject <ESRenderer>
{
@private
	EAGLContext *context;
	
	// The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	// The OpenGL names for the framebuffer and renderbuffer used to render to this view
	GLuint defaultFramebuffer, colorRenderbuffer;
	
	//テクスチャ
	GLuint carTexture;
	GLuint courseTexture;
	GLuint checkPointTexture;
	GLuint numberTexture;
	GLuint particleTexture;
	
	MyGame* currentGame;	//進行中のゲームを参照するための変数
	
	ParticleSystem *particleSystem;
}
@property (nonatomic, assign) MyGame* currentGame;
- (void) render;
- (void) renderMain;
- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer;
- (void) loadTextures;
- (void) deleteTextures;

@end
