//
//  MyGame.h
//  racegame
//

#import <Foundation/Foundation.h>
#import "MyCar.h"
#import "MyCheckPoint.h"

#define CHECK_POINT_COUNT 8

@interface MyGame : NSObject {
	MyCar* myCar;
	MyCheckPoint **checkPoints;	//チェックポイント
	int nextCheckPointId;	//次のチェックポイントのID
	int lapId;	//周回番号
	NSDate* currentLapStartTime;	//現在のラップの開始時刻
	float currentLapTime;	//現在のラップの経過時間
	float fastestLapTime;
}
@property (readonly) MyCar *myCar;
@property (readonly) MyCheckPoint **checkPoints;
@property (readonly) int nextCheckPointId, lapId;
@property (readonly) float currentLapTime, fastestLapTime;
- (void) accelButtonTouchedDown:(id)sender;
- (void) accelButtonTouchedUp:(id)sender;
- (void) leftButtonTouchedDown:(id)sender;
- (void) leftButtonTouchedUp:(id)sender;
- (void) rightButtonTouchedDown:(id)sender;
- (void) rightButtonTouchedUp:(id)sender;
- (void) update;
@end
