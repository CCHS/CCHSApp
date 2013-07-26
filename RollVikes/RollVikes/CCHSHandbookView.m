//
//  CCHSHandbookView.m
//  RollVikes
//
//  Created by Nick Petro on 7/6/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSHandbookView.h"

@interface CCHSHandbookView ()

@end

@implementation CCHSHandbookView

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://centralcatholichs.com/uploadedFiles/New_Site/Content/Academics/2010-2011%20Student%20Parent%20Handbook.pdf"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webDisplayHandbook loadRequest:req];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
