//
//  CCHSThirdViewController.m
//  RollVikes
//
//  Created by Nick Petro on 7/4/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSThirdViewController.h"

@interface CCHSThirdViewController ()

@end

@implementation CCHSThirdViewController
@synthesize barcodeWeb;
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *standardUserID = [NSUserDefaults standardUserDefaults];
    NSString *IDnumber = @"";
    if (standardUserID)
        IDnumber = [standardUserID objectForKey:@"ID"];
    NSString *IdUrlpt1 = @"http://www.barcodesinc.com/generator/image.php?code=";
    NSString *IdUrlpt2 = @"&style=197&type=C128B&width=200&height=50&xres=1&font=3";
    NSMutableString *fullIDurl = [NSMutableString stringWithString:@""];
    [fullIDurl appendString:IdUrlpt1];
    [fullIDurl appendString:IDnumber];
    [fullIDurl appendString:IdUrlpt2];
    
    NSURL *url3 = [NSURL URLWithString:fullIDurl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url3];
    [barcodeWeb loadRequest:req];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
