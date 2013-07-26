//
//  CCHSMoreNavianceLink.m
//  RollVikes
//
//  Created by Nick Petro on 7/5/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSMoreNavianceLink.h"

@interface CCHSMoreNavianceLink ()

@end

@implementation CCHSMoreNavianceLink

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://connection.naviance.com/cchspa"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webDisplayNaviance loadRequest:req];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
