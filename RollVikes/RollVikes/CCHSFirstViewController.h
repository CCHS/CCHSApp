//
//  CCHSFirstViewController.h
//  RollVikes
//
//  Created by Joseph Allen on 6/14/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCHSFirstViewController : UIViewController
- (IBAction)segmentController:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UIWebView *webDisplay;
@end
