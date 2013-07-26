//
//  CCHSMoreCentralLinkView.m
//  RollVikes
//
//  Created by Nick Petro on 7/5/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSMoreCentralLinkView.h"

@interface CCHSMoreCentralLinkView ()

@end

@implementation CCHSMoreCentralLinkView

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.centralcatholichs.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webDisplayCentral loadRequest:req];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
