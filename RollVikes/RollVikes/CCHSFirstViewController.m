//
//  CCHSFirstViewController.m
//  RollVikes
//
//  Created by Joseph Allen on 6/14/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSFirstViewController.h"

@interface CCHSFirstViewController ()

@end

@implementation CCHSFirstViewController
@synthesize loading;

- (void)viewDidLoad
{
    [_webDisplay2 setHidden:YES];
    NSURL *url = [NSURL URLWithString:@"http://ccas.centralcatholichs.com/dailybulletinscrubber.aspx"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webDisplay setHidden:NO];
    [_webDisplay loadRequest:req];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentController:(id)sender {
    if (_segmentController.selectedSegmentIndex==0) {
        [_webDisplay2 setHidden:YES];
        NSURL *url = [NSURL URLWithString:@"http://ccas.centralcatholichs.com/dailybulletinscrubber.aspx"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [_webDisplay setHidden:NO];
        [_webDisplay loadRequest:req];
    }
    if (_segmentController.selectedSegmentIndex==1) {
        [_webDisplay2 setHidden:YES];
        NSDate *now = [NSDate date];
        NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
        NSArray *arr = [strDate componentsSeparatedByString:@" "];
        NSString *str; str = [arr objectAtIndex:0];

        NSArray *dateArr = [str componentsSeparatedByString:@"-"];
        NSString *date = [dateArr objectAtIndex:2];
        NSString *month = [dateArr objectAtIndex:1];
        NSString *year = [dateArr objectAtIndex:0];
        NSMutableString *useConvert = [NSMutableString stringWithString:@""];
        [useConvert appendFormat:@"%@",month];
        [useConvert appendFormat:@"%@",date];
        [useConvert appendFormat:@"%@",year];
        NSMutableString *useForURL = [NSMutableString stringWithString:@""];
        for (int x=0,y=1;x<8;x++){
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"0"]){
                [useForURL appendString:@"X"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"1"]){
                [useForURL appendString:@"C"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"2"]){
                [useForURL appendString:@"Q"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"3"]){
                [useForURL appendString:@"F"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"4"]){
                [useForURL appendString:@"E"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"5"]){
                [useForURL appendString:@"S"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"6"]){
                [useForURL appendString:@"P"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"7"]){
                [useForURL appendString:@"I"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"8"]){
                [useForURL appendString:@"Z"];
            }
            if ([[useConvert substringWithRange:NSMakeRange(x, y)] isEqualToString:@"9"]){
                [useForURL appendString:@"G"];
            }
        }
        NSString *urlPartOne =@"http://ccas.centralcatholic.private/cancellations.aspx?CCS=";
        NSMutableString *wholeURL = [NSMutableString stringWithString:urlPartOne];
        [wholeURL appendString:useForURL];
        
        //NSLog(wholeURL);  -for testing purposes-
        
        NSURL *url = [NSURL URLWithString:wholeURL];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        
        Reachability *reachability = [Reachability reachabilityWithHostName:wholeURL];
        NetworkStatus status = [reachability currentReachabilityStatus];
        if (!status) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Error"
                        message:@"You must be connected to the internet via a Central Catholic wifi to access this feature."
            delegate:nil
            cancelButtonTitle:@"OK"
            otherButtonTitles:nil];
            [alert show];
        }
        [_webDisplay setHidden:NO];
        [_webDisplay loadRequest:req];
    }
    if (_segmentController.selectedSegmentIndex==2) {
        [_webDisplay setHidden:YES];
        NSURL *url = [NSURL URLWithString:@"http://ccas.centralcatholichs.com/cchstwitter.html"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [_webDisplay2 setHidden:NO];
        [_webDisplay2 loadRequest:req];
    }
}

@end