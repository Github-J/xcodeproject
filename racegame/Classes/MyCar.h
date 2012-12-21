/*
 *  MyCar.h
 *  racegame
 *
 */

class MyCar{
public:
	float x,y;	//座標
	float powerX, powerY;	//かかっている力（慣性力）
	float angle;	//方向
	float radius;	//車のサイズ(半径)
	BOOL turnLeftFlag, turnRightFlag;	//左右旋回のフラグ
	BOOL accelFlag;	//アクセルのフラグ
	
	MyCar(float x, float y, float angle, float radius);	//コンストラクタ
	void update();	//左右旋回、移動させます
};