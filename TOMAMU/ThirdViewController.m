//
//  ThirdViewController.m
//  TOMAMU
//
//  Created by 伊東 純平 on 12/06/18.
//  Copyright (c) 2012年 北海道情報大学. All rights reserved.
//

#import "ThirdViewController.h"


@implementation ThirdViewController



- (void)viewDidLoad
{
    [Twitter loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://goo.gl/maps/e8eT"]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end