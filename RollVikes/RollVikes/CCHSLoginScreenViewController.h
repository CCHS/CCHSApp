//  CCHSLoginScreenViewController.h
//  RollVikes
//
//  Created by Nick Petro on 7/29/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CCHSLoginScreenViewController : UIViewController{
    NSDictionary *registeredCredentials;
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    

    
}

@property struct CGPoint originalCenter;
@property (weak, nonatomic) IBOutlet UITextView *errorMessage;
@property (weak, nonatomic) IBOutlet UIWebView *loginAuthentication;
- (IBAction)loginButton:(id)sender;
- (IBAction)backgroundTouched:(id)sender;
- (IBAction)enter:(id)sender;
- (IBAction)moveView:(id)sender;


@end
