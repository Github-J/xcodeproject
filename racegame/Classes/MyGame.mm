//
//  MyGame.mm
//  racegame
//

#import "MyGame.h"


@implementation MyGame
@synthesize myCar, checkPoints, nextCheckPointId, lapId, currentLapTime, fastestLapTime;

- (id)init{
	if (self = [super init]){
		//ここに初期化用のコードを記述します
		
		//チェックポイントを生成します
		checkPoints = new MyCheckPoint*[CHECK_POINT_COUNT];
		checkPoints[0] = new MyCheckPoint(0.75f, -0.5f, 0.2f);
		checkPoints[1] = new MyCheckPoint(0.4f, 0.25f, 0.2f);
		checkPoints[2] = new MyCheckPoint(0.0f, 0.9f, 0.2f);
		checkPoints[3] = new MyCheckPoint(-0.85f, 0.5f, 0.2f);
		checkPoints[4] = new MyCheckPoint(-0.3f, 0.3f, 0.2f);
		checkPoints[5] = new MyCheckPoint(-0.9f, -0.2f, 0.2f);
		checkPoints[6] = new MyCheckPoint(-0.8f, -0.9f, 0.2f);
		checkPoints[7] = new MyCheckPoint(0.0f, -0.9f, 0.2f);
		
		//MyCarクラスのインスタンスを作成します
		myCar = new MyCar(checkPoints[CHECK_POINT_COUNT-1]->x, 
						  checkPoints[CHECK_POINT_COUNT-1]->y, 
						  0.0f, 0.05f);
		
		nextCheckPointId = 0;	//最初に目指すチェックポイントは0番目です
		lapId = 1;	//周回数は1です
		
		currentLapStartTime = [[NSDate date] retain];
		currentLapTime = 0.0f;
		fastestLapTime = 999.999f;
	}
	return self;
}

/*
 * アクセルボタン、左右旋回ボタンが押された時に
 * 車のアクセル／左右旋回の状態を更新します
 */
- (void) accelButtonTouchedDown:(id)sender{
	myCar->accelFlag = YES;
}
- (void) accelButtonTouchedUp:(id)sender{
	myCar->accelFlag = NO;
}
- (void) leftButtonTouchedDown:(id)sender{
	myCar->turnLeftFlag = YES;
}
- (void) leftButtonTouchedUp:(id)sender{
	myCar->turnLeftFlag = NO;
}
- (void) rightButtonTouchedDown:(id)sender{
	myCar->turnRightFlag = YES;
}
- (void) rightButtonTouchedUp:(id)sender{
	myCar->turnRightFlag = NO;
}

- (void)update{
	//現在時刻とラップ開始時刻の差から、現在のラップタイムを計算します
	currentLapTime = -[currentLapStartTime timeIntervalSinceNow];
	
	//車の位置を更新します
	myCar->update();
	
	//チェックポイントの通過を調べます
	float dX = myCar->x - checkPoints[nextCheckPointId]->x;
	float dY = myCar->y - checkPoints[nextCheckPointId]->y;
	float squareDistance = dX * dX + dY * dY;	//ここでは計算速度を優先するため、二乗で計算します(P.242参照)
	
	//車がチェックポイントの範囲にいるかを判定します
	if (squareDistance <= pow(checkPoints[nextCheckPointId]->radius, 2.0)){
		nextCheckPointId++;	//次に通過すべきチェックポイントを設定します
		
		//最後のチェックポイントを通過したら、最初のチェックポイントに戻します
		if (nextCheckPointId >= CHECK_POINT_COUNT){
			nextCheckPointId = 0;
			lapId++;	//周回数を1増やします
			
			//ファステストラップを更新します
			if (currentLapTime < fastestLapTime) fastestLapTime = currentLapTime;
			
			//新しいラップの開始時刻を記録します
			[currentLapStartTime release];
			currentLapStartTime = [[NSDate date] retain];
		}
	}
}
@end
