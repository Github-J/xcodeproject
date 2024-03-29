//
//  HelloWorldLayer.m
//  自己紹介
//
//  Created by 伊東 純平 on 12/04/22.
//  Copyright 北海道情報大学 2012年. All rights reserved.
//


// Import the interfaces
#import "AppMain.h"

// HelloWorldLayer implementation
@implementation AppMainLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AppMainLayer *layer = [AppMainLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
       
        
        
        image1 = [[CCSprite alloc]initWithFile:@"prezen.jpg"];
        image1.position = ccp(512,768/2);
        [self addChild:image1 z:80];
        
        image2 = [[CCSprite alloc]initWithFile:@"prezen2.jpg"];
        image2.position = ccp(512,768/2);
        [self addChild:image2 z:79];
        
        image3 = [[CCSprite alloc]initWithFile:@"prezen3.jpg"];
        image3.position = ccp(512,768/2);
        [self addChild:image3 z:78];
        
        image4 = [[CCSprite alloc]initWithFile:@"prezen4.jpg"];
        image4.position = ccp(512,768/2);
        [self addChild:image4 z:77];
        
        image5 = [[CCSprite alloc]initWithFile:@"prezen5.jpg"];
        image5.position = ccp(512,768/2);
        [self addChild:image5 z:76];
        
        image6 = [[CCSprite alloc]initWithFile:@"prezen6.jpg"];
        image6.position = ccp(512,768/2);
        [self addChild:image6 z:75];
        
        image7 = [[CCSprite alloc]initWithFile:@"prezen7.jpg"];
        image7.position = ccp(512,768/2);
        [self addChild:image7 z:74];
        
        image8 = [[CCSprite alloc]initWithFile:@"prezen8.jpg"];
        image8.position = ccp(512,768/2);
        [self addChild:image8 z:73];
        
        image9 = [[CCSprite alloc]initWithFile:@"prezen9.jpg"];
        image9.position = ccp(512,768/2);
        [self addChild:image9 z:72];
        
        image10 = [[CCSprite alloc]initWithFile:@"prezen10.jpg"];
        image10.position = ccp(512,768/2);
        [self addChild:image10 z:71];
        
        image11 = [[CCSprite alloc]initWithFile:@"prezen11.jpg"];
        image11.position = ccp(512,768/2);
        [self addChild:image11 z:70];
        
        image12 = [[CCSprite alloc]initWithFile:@"prezen12.jpg"];
        image12.position = ccp(512,768/2);
        [self addChild:image12 z:69];
        
        image13 = [[CCSprite alloc]initWithFile:@"prezen13.jpg"];
        image13.position = ccp(512,768/2);
        [self addChild:image13 z:68];
        
        
        teacher = [[CCSprite alloc]initWithFile:@"yasuda.png"]; //ポインター
        teacher.position = ccp(512,650);
        teacher.scale = 0.5f;
        [self addChild:teacher z:100];
        
//        midasi = [[CCSprite alloc]initWithFile:@"midasi.png"]; //スライド見出し
//        midasi.position = ccp(256/2,768/2);
//        [midasi setOpacity:128];
//        [self addChild:midasi z:80];
//        
//        slidemidasi = [[CCSprite alloc]initWithFile:@"prezen.jpg"]; //プレゼンの見出し用画像
//        slidemidasi.position = ccp(midasi.position.x,768/2);
//        slidemidasi.scale = 0.225f;
//        [self addChild:slidemidasi z:81];
//        
//        startGamen = [[CCSprite alloc]initWithFile:@"StartGamen.jpg"]; //スタート画面
//        startGamen.position = ccp(1024/2,768/2);
//        [self addChild:startGamen z:1000];
//        
//        tempchoose = [[CCSprite alloc]initWithFile:@"TempChoose.jpg"]; //テンプレート選択画面
//        tempchoose.position = ccp(10000,10000);
//        [self addChild:tempchoose z:1002];
//        
//        temp01demobutton = [CCMenuItemImage                           //temp01ボタン
//                                           itemFromNormalImage:@"temp01.jpg"
//                                           selectedImage:@"temp01.jpg"
//                                           
//                                           target:self
//                            selector:@selector(pressTemp01demo:)];
//        
//        CCMenu *temp01demo = [CCMenu menuWithItems:temp01demobutton, nil];
//        
//        
//        temp01demobutton.position = ccp(10000,10000);
//        temp01demobutton.scale = 0.20f;
//        [self addChild:temp01demo z:1003];
//                        
//        
//        
//        
//        NewSlidebutton = [CCMenuItemImage                           //NewSlideボタン
//                                  itemFromNormalImage:@"NewSlidebutton.png"
//                                           selectedImage:@"NewSlidebuttonOps.png"
//                                           
//                                  target:self
//                                  selector:@selector(pressNewSlideButton:)];
//        
//        CCMenu *NewSlide = [CCMenu menuWithItems:NewSlidebutton, nil];
//        
//        
//        NewSlidebutton.position = ccp(0,0);
//        [self addChild:NewSlide z:1001];
//        
//        
//        OpenSlidebutton = [CCMenuItemImage                           //OpenSlideボタン
//                                           itemFromNormalImage:@"OpenSlidebutton.png"
//                                           selectedImage:@"OpenSlidebuttonOps.png"
//                                           
//                                           target:self
//                                           selector:@selector(pressMenuNextbutton:)];
//        
//        CCMenu *OpenSlide = [CCMenu menuWithItems:OpenSlidebutton, nil];
//        
//        
//        OpenSlidebutton.position = ccp(0,-128);
//        [self addChild:OpenSlide z:1001];
//
//        
//        Settingbutton = [CCMenuItemImage                           //Settingボタン
//                                            itemFromNormalImage:@"Settingbutton.png"
//                                            selectedImage:@"SettingbuttonOps.png"
//                                            
//                                            target:self
//                                            selector:@selector(pressMenuNextbutton:)];
//        
//        CCMenu *Setting = [CCMenu menuWithItems:Settingbutton, nil];
//        
//        
//        Settingbutton.position = ccp(0,-256);
//        [self addChild:Setting z:1001];
        
        
        
        
        CCMenuItemImage *nextbutton = [CCMenuItemImage                           //NEXTボタン
                                  itemFromNormalImage:@"Ui_Next.png"
                                  selectedImage:@"Ui_Next_Push.png"
                                  target:self
                                  selector:@selector(pressMenuNextbutton:)];
        
        CCMenu *Rightmenu = [CCMenu menuWithItems:nextbutton, nil]; 
        
        
        
        nextbutton.position = ccp(440,-80);
        nextbutton.scale = 0.25f;
        
        [self addChild:Rightmenu z:100];
        
        
        
        CCMenuItemImage *backbutton = [CCMenuItemImage                           //BACKボタン
                                  itemFromNormalImage:@"Ui_Back.png"
                                  selectedImage:@"Ui_Back_Push.png"
                                  target:self
                                  selector:@selector(pressMenuBackbutton:)];
        
        CCMenu *Leftmenu = [CCMenu menuWithItems:backbutton, nil];
        
        
        
        backbutton.position = ccp(-440,-80);
        backbutton.scale = 0.25f;
        
        [self addChild:Leftmenu z:100];
    
        
        self.isTouchEnabled = YES;
		
	}
    
	return self;
}

- (void) pressTemp01demo :(id)sender
{
    
    
    tempchoose.position = ccp(10000,10000);
    temp01demobutton.position = ccp(10000,10000);
    
}

//- (void) pressNewSlideButton :(id)sender                //NewSlideボタンが押された時の処理
//{
//    
//    tempchoose.position = ccp(1024/2,768/2);            //テンプレート選択画面背景の移動
//    temp01demobutton.position = ccp(0,0);               //テンプレートのデモ移動
//    
//    
//}


- (void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self 
                                                        priority:0
                                              swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"%s", __func__);
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event  //ポインター処理
{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    [teacher stopAllActions];
    
    id ugoku = [CCMoveTo actionWithDuration:1.0f position:location];
    
    [teacher runAction:ugoku];
}

- (void)pressMenuNextbutton :(id)sender {
   

    change = change + 1;
    
    NSLog(@"change = %d",change);
    move = [CCMoveTo actionWithDuration:0.5f position:ccp(1436, 768/2)];
    move2 = [CCMoveTo actionWithDuration:0.5f position:ccp(1536, 768/2)];
    moving = [CCSequence actions: move, move2, nil];
   
    
    
    round = [CCRotateBy actionWithDuration:1 angle:180 * 2];
    
    
    
    [teacher runAction: round];
    
    if(change <= 0)
    {
        change = 0;
    }
    
    
    if(change >= 13)
    {
        change = 13;
    }
    
    if(change == 1){
    
        [image1 runAction: moving];
        
    }
    else if(change == 2){
        
        [image2 runAction: moving];
        
    }
    else if(change == 3){
        
        [image3 runAction: moving];
        
    }
    else if(change == 4){
        
        [image4 runAction: moving];
        
    }
    else if(change == 5){
        
        [image5 runAction: moving];
        
    }
    else if(change == 6){
        
        [image6 runAction: moving];
        
    }
    else if(change == 7){
        
        [image7 runAction: moving];
        
    }
    else if(change == 8){
        
        [image8 runAction: moving];
        
    }
    else if(change == 9){
        
        [image9 runAction: moving];
        
    }
    else if(change == 10){
        
        [image10 runAction: moving];
        
    }
    else if(change == 11){
        
        [image11 runAction: moving];
        
    }
    else if(change == 12){
        
        [image12 runAction: moving];
        
    }
    else if(change == 13){
        
        [image13 runAction: moving];
        
    }
}
- (void)pressMenuBackbutton :(id)sender {
    
    
    
    
    NSLog(@"change = %d",change);
    back = [CCMoveTo actionWithDuration:0.5f position:ccp(612, 768/2)];
    back2 = [CCMoveTo actionWithDuration:0.5f position:ccp(512, 768/2)];
    backing = [CCSequence actions: back, back2, nil];
    
    unround = [CCRotateBy actionWithDuration:1 angle:-180 * 2];
    
    
    
    [teacher runAction: unround];
    
    
    if(change == 1){
        
        [image1 runAction: backing];
        change = change - 1;
    
        
    }
    else if(change == 2){
        
        [image2 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 3){
        
        [image3 runAction: backing];
        change = change - 1;
         
         
    }
    else if(change == 4){
        
        [image4 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 5){
        
        [image5 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 6){
        
        [image6 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 7){
        
        [image7 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 8){
        
        [image8 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 9){
        
        [image9 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 10){
        
        [image10 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 11){
        
        [image11 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 12){
        
        [image12 runAction: backing];
        change = change - 1;
        
        
    }
    else if(change == 13){
        
        [image13 runAction: backing];
        change = change - 1;
        
        
    }









    
    
}



// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[move release];
    [image1 release];
    [image2 release];
    [image3 release];
    [startGamen release];
    [tempchoose release];
     [super dealloc];
    
}
@end
