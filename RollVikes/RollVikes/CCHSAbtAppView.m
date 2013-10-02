//
//  CCHSAbtAppView.m
//  RollVikes
//
//  Created by Nick Petro on 7/6/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSAbtAppView.h"

@interface CCHSAbtAppView ()

@end

@implementation CCHSAbtAppView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emailUsButton:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Comment, Suggestion, or Concern";
    // Email Content
    NSString *messageBody = @"App Development,";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"rollvikesappdevelopment@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];

    [self presentViewController:mc animated:YES completion:NULL];
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }

    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
