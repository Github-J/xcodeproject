/*
 *  ParticleSystem.h
 *
 * 「OpenGLで作るiPhone SDKゲームプログラミング」(ISBN-10: 4844328085)
 * 第三章で作成する、シンプルなパーティクルシステムです。
 */
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "Particle.h"

class ParticleSystem {
private:
	Particle** particle;
	int capacity;
public:
	ParticleSystem(int capacity, int particleLifeSpan);
	~ParticleSystem();
	//指定した座標に任意のサイズのパーティクルを発生させます
	void add(float x, float y, float size, float  moveX, float moveY);	
	void draw(GLuint texture);				//使用中のパーティクルを全て描画します
	void update();							//使用中のパーティクルを更新します
};