//
//  CCHSLoginScreenViewController.m
//  RollVikes
//
//  Created by Nick Petro on 7/29/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSLoginScreenViewController.h"


@interface CCHSLoginScreenViewController ()

@end

@implementation CCHSLoginScreenViewController
@synthesize errorMessage;
@synthesize loginAuthentication;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [errorMessage setHidden:YES];
    registeredCredentials = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"1234567890",@"username", nil] forKeys:[NSArray arrayWithObjects:@"npetro14",@"password", nil]];
    self.originalCenter = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)moveView:(id)sender{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x,64);
    [UIView commitAnimations];
}
- (IBAction)backgroundTouched:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x,230);
    [UIView commitAnimations];
}
- (IBAction)enter:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x,230);
    [UIView commitAnimations];
}

- (IBAction)loginButton:(id)sender {
    NSString *usernameHold = username.text;
    NSString *passwordHold = password.text;
    NSString *loginInfoPt2 = @"&SID=";
    NSMutableString *loginInfo = [NSMutableString stringWithString:@"ccas.centralcatholic.private/appsecurity.aspx?un="];
    [loginInfo appendString:usernameHold];
    NSMutableString *encryptedID = [NSMutableString stringWithString:@""];
    for (int x=0,y=1;x<8;x++){
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"0"]){
            [encryptedID appendString:@"X"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"1"]){
            [encryptedID appendString:@"C"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"2"]){
            [encryptedID appendString:@"Q"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"3"]){
            [encryptedID appendString:@"F"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"4"]){
            [encryptedID appendString:@"E"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"5"]){
            [encryptedID appendString:@"S"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"6"]){
            [encryptedID appendString:@"P"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"7"]){
            [encryptedID appendString:@"I"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"8"]){
            [encryptedID appendString:@"Z"];
        }
        if ([[passwordHold substringWithRange:NSMakeRange(x, y)] isEqualToString:@"9"]){
            [encryptedID appendString:@"G"];
        }
    }
    [loginInfo appendString:loginInfoPt2];
    [loginInfo appendString:encryptedID];
   NSURL *loginurl = [NSURL URLWithString:loginInfo];
    NSURLRequest *req2 = [NSURLRequest requestWithURL:loginurl];
   [loginAuthentication loadRequest:req2];
    
    NSLog(@"%@",loginInfo); //- for testing purposes only
    

    
    
    if ([[registeredCredentials objectForKey:username.text]isEqualToString:password.text]) {
        NSUserDefaults *standardUserUsername = [NSUserDefaults standardUserDefaults];
        if (standardUserUsername) {
            [standardUserUsername setObject:[NSString stringWithString:username.text] forKey:@"username"];
            [standardUserUsername synchronize];
        }
        NSUserDefaults *standardUserID = [NSUserDefaults standardUserDefaults];
        if (standardUserID) {
            [standardUserID setObject:[NSString stringWithString:password.text] forKey:@"ID"];
            [standardUserID synchronize];
        }
        NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
        if (standardUserEnID) {
            [standardUserEnID setObject:[NSString stringWithString:encryptedID] forKey:@"EnID"];
            [standardUserEnID synchronize];
        }
        
        [self performSegueWithIdentifier:@"loginSegue" sender:sender];
    }
    else {
        [errorMessage setHidden:NO];
    }
    

}
@end