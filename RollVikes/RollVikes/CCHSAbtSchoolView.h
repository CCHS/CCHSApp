//
//  CCHSAbtSchoolView.h
//  RollVikes
//
//  Created by Nick Petro on 7/6/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCHSAbtSchoolView : UIViewController
- (IBAction)segmentController2:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController2;
@property (weak, nonatomic) IBOutlet UITextView *overview;
@property (weak, nonatomic) IBOutlet UITextView *history;
@property (weak, nonatomic) IBOutlet UITextView *docs;
@property (weak, nonatomic) IBOutlet UITextView *brothers;

@end
