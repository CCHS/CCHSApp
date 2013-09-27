//
//  PasswordHelpViewController.m
//  RollVikes
//
//  Created by Nick Petro on 9/6/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "PasswordHelpViewController.h"

@interface PasswordHelpViewController ()


@end

@implementation PasswordHelpViewController
@synthesize passHelpWeb;
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://passhelp.centralcatholichs.com/showLogin.cc"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [passHelpWeb loadRequest:req];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
