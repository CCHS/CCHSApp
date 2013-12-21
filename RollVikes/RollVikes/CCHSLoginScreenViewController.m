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
@synthesize message2;
@synthesize errorMessage;
@synthesize loginAuthentication;
@synthesize originalCenter;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [errorMessage setHidden:YES];
    [message2 setHidden:YES];
    num=1;
    registeredCredentials = [[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:nil] forKeys:[NSArray arrayWithObjects:nil]];
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
    self.view.center = CGPointMake(self.originalCenter.x,originalCenter.y);
    //230
    [UIView commitAnimations];
}
- (IBAction)backgroundTouched2:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
}
- (IBAction)enter:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.center = CGPointMake(self.originalCenter.x,originalCenter.y);
    //230
    [UIView commitAnimations];
}
- (IBAction)enter2:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
}

//=========================================


- (IBAction)loginButton:(id)sender {
    NSString *usernameHold = username.text;
    //NSString *usernameHold4Encryption = username.text;
    NSString *secretKey = @"86A52E51C54E55F846A48C487E4A4565";
    NSString *passwordHold = password.text;
    if (([usernameHold length]==0)||([passwordHold length]==0)) {
        [errorMessage setHidden:NO];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error"
         message:@"Please enter a valid login combination."
         delegate:nil
         cancelButtonTitle:@"Retry"
         otherButtonTitles:nil];
        [alert show];
    }
    
    //=========================================
    NSMutableString *encryptedID = [NSMutableString stringWithString:@""];
    //NSString *encryptedUser = [usernameHold4Encryption AES256EncryptWithKey:secretKey];
    //NSLog(@"%@",encryptedUser);
    NSString *encryptedPass = [passwordHold AES256EncryptWithKey:secretKey];
    //NSLog(@"%@",encryptedPass);
    //=========================================
    //for testing
    //NSString *decryptedUser = [encryptedUser AES256DecryptWithKey:secretKey];
    //NSLog(@"%@",decryptedUser);
    //=========================================
    
    NSString *host=@"www.centralcatholichs.com";
    NSMutableString *login = [NSMutableString stringWithString:@"http://moodle.centralcatholichs.com/cchs_app_php/adLDAP/src/ldap.php?user="];
    [login appendString:username.text];
    NSString *loginpt2 = @"&password=";
    [login appendString:loginpt2];
    [login appendString:encryptedPass];
    //NSLog(@"%@",login);
   NSURL *loginurl = [NSURL URLWithString:login];
    NSURLRequest *req2 = [NSURLRequest requestWithURL:loginurl];
   [loginAuthentication loadRequest:req2];
    
    Reachability *reachability = [Reachability reachabilityWithHostName:host];
    NetworkStatus status = [reachability currentReachabilityStatus];
    //NSLog(@"%u",status);
        
    NSString *html = [loginAuthentication stringByEvaluatingJavaScriptFromString:@"document.body.textContent"];
    NSString *stringWithText = @"Failed.";
    stringWithText = html;
    NSMutableString *stringWithIDNumber = [NSMutableString stringWithFormat:@""];
    //NSLog(@"%@",stringWithText);
    int len = [stringWithText length];
    NSString *loginNo = @"Failed.";
    NSString *serverError = @"Unable to search LDAP server";
    //If user logged in perviously and has stored data in the dictionary
    if ([[registeredCredentials objectForKey:username.text]isEqualToString:password.text]) {
        [stringWithText stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        //If connected to the internet too
        if (status&&(![stringWithText isEqualToString:loginNo])&&(![stringWithText length]==0)){
            for (int x=0,y=1;x<len;x++){
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"0"]){
                    [encryptedID appendString:@"X"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"1"]){
                    [encryptedID appendString:@"C"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"2"]){
                    [encryptedID appendString:@"Q"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"3"]){
                    [encryptedID appendString:@"F"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"4"]){
                    [encryptedID appendString:@"E"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"5"]){
                    [encryptedID appendString:@"S"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"6"]){
                    [encryptedID appendString:@"P"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"7"]){
                    [encryptedID appendString:@"I"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"8"]){
                    [encryptedID appendString:@"Z"];
                }
                if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"9"]){
                    [encryptedID appendString:@"G"];
                }
            }
            for (int x=0,y=1;x<len;x++){
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"X"]){
                    [stringWithIDNumber appendString:@"0"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"C"]){
                    [stringWithIDNumber appendString:@"1"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"Q"]){
                    [stringWithIDNumber appendString:@"2"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"F"]){
                    [stringWithIDNumber appendString:@"3"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"E"]){
                    [stringWithIDNumber appendString:@"4"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"S"]){
                    [stringWithIDNumber appendString:@"5"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"P"]){
                    [stringWithIDNumber appendString:@"6"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"I"]){
                    [stringWithIDNumber appendString:@"7"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"Z"]){
                    [stringWithIDNumber appendString:@"8"];
                }
                if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"G"]){
                    [stringWithIDNumber appendString:@"9"];
                }
            }
            NSUserDefaults *standardUserUsername = [NSUserDefaults standardUserDefaults];
            if (standardUserUsername) {
                [standardUserUsername setObject:[NSString stringWithString:usernameHold] forKey:@"username"];
                [standardUserUsername synchronize];
            }
            NSUserDefaults *standardUserID = [NSUserDefaults standardUserDefaults];
            if (standardUserID) {
                [standardUserID setObject:[NSString stringWithString:stringWithIDNumber] forKey:@"ID"];
                [standardUserID synchronize];
            }
            NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
            if (standardUserEnID) {
                [standardUserEnID setObject:[NSString stringWithString:encryptedID] forKey:@"EnID"];
                [standardUserEnID synchronize];
            }
            //NSLog(@"hello credentials then status");
            [self performSegueWithIdentifier:@"loginSegue" sender:sender];
        }
        //if not connected to the internet
        else {
            //NSLog(@"hello credentials only");
            [self performSegueWithIdentifier:@"loginSegue" sender:sender];
        }
    }
    //If connected to the internet (Most common login condition)
    if (status&&(![stringWithText isEqualToString:loginNo])&&(![stringWithText isEqualToString:serverError])&&(![stringWithText length]==0)) {
        [registeredCredentials setObject:password.text forKey:username.text];
        [stringWithText stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        for (int x=0,y=1;x<len;x++){
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"0"]){
                [encryptedID appendString:@"X"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"1"]){
                [encryptedID appendString:@"C"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"2"]){
                [encryptedID appendString:@"Q"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"3"]){
                [encryptedID appendString:@"F"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"4"]){
                [encryptedID appendString:@"E"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"5"]){
                [encryptedID appendString:@"S"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"6"]){
                [encryptedID appendString:@"P"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"7"]){
                [encryptedID appendString:@"I"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"8"]){
                [encryptedID appendString:@"Z"];
            }
            if ([[stringWithText substringWithRange:NSMakeRange(x, y)] isEqualToString:@"9"]){
                [encryptedID appendString:@"G"];
            }
        }
        for (int x=0,y=1;x<len;x++){
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"X"]){
                [stringWithIDNumber appendString:@"0"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"C"]){
                [stringWithIDNumber appendString:@"1"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"Q"]){
                [stringWithIDNumber appendString:@"2"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"F"]){
                [stringWithIDNumber appendString:@"3"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"E"]){
                [stringWithIDNumber appendString:@"4"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"S"]){
                [stringWithIDNumber appendString:@"5"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"P"]){
                [stringWithIDNumber appendString:@"6"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"I"]){
                [stringWithIDNumber appendString:@"7"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"Z"]){
                [stringWithIDNumber appendString:@"8"];
            }
            if ([[encryptedID substringWithRange:NSMakeRange(x, y)] isEqualToString:@"G"]){
                [stringWithIDNumber appendString:@"9"];
            }
        }
        NSUserDefaults *standardUserUsername = [NSUserDefaults standardUserDefaults];
        if (standardUserUsername) {
            [standardUserUsername setObject:[NSString stringWithString:usernameHold] forKey:@"username"];
            [standardUserUsername synchronize];
        }
        NSUserDefaults *standardUserID = [NSUserDefaults standardUserDefaults];
        if (standardUserID) {
            [standardUserID setObject:[NSString stringWithString:stringWithIDNumber] forKey:@"ID"];
            [standardUserID synchronize];
        }
        NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
        if (standardUserEnID) {
            [standardUserEnID setObject:[NSString stringWithString:encryptedID] forKey:@"EnID"];
            [standardUserEnID synchronize];
        }
        //NSLog(@"hello status only");
        [self performSegueWithIdentifier:@"loginSegue" sender:sender];
    }
    //If unsuccessful login
    else {
        //NSLog(@"sorry");
        //Temporary fix for double login bug
        if (num<3){
            [message2 setHidden:NO];
            num++;
        }
        //Actual invalid login and sets appropriate error message visible
        else{
            num=3;
            [message2 setHidden:YES];
            [errorMessage setHidden:NO];
        }
    }

}
@end