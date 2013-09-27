//
//  CCHSSecondViewController.m
//  RollVikes
//
//  Created by Joseph Allen on 6/14/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSSecondViewController.h"

@interface CCHSSecondViewController ()

@end

@implementation CCHSSecondViewController
@synthesize scheduleWebView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
    NSString *EnIDnumber = @"";
    if (standardUserEnID)
        EnIDnumber = [standardUserEnID objectForKey:@"EnID"];
    NSString *scheduleUrl = @"http://ccas.centralcatholic.private/studentschedule.aspx?SID=";
    NSMutableString *wholeScheduleUrl = [NSMutableString stringWithString:@""];
    [wholeScheduleUrl appendString:scheduleUrl];
    [wholeScheduleUrl appendString:EnIDnumber];
    
    NSURL *url = [NSURL URLWithString:wholeScheduleUrl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    Reachability *reachability = [Reachability reachabilityWithHostName:wholeScheduleUrl];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (!status) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update Error"
        message:@"This is a chached version of your schedule. You must be connected to the internet via a Central Catholic wifi for your schedule to be updated."
        delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
        [alert show];
    }
    [scheduleWebView loadRequest:req];
    //NSLog(@"%@",wholeScheduleUrl);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
