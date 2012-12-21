//
//  ForthViewController.h
//  TOMAMU
//
//  Created by 伊東 純平 on 12/06/18.
//  Copyright (c) 2012年 北海道情報大学. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForthViewController : UIViewController <UIActionSheetDelegate,UIWebViewDelegate>{
    
    IBOutlet UIWebView *Map;
    
}
- (IBAction)presentMenu:(id)sender;
@end
