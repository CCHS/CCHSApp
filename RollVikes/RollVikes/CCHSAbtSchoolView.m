//
//  CCHSAbtSchoolView.m
//  RollVikes
//
//  Created by Nick Petro on 7/6/13.
//  Copyright (c) 2013 CCHS. All rights reserved.
//

#import "CCHSAbtSchoolView.h"

@interface CCHSAbtSchoolView ()

@end

@implementation CCHSAbtSchoolView

- (void)viewDidLoad
{
    [_overview setHidden:NO];
    [_history setHidden:YES];
    [_docs setHidden:YES];
    [_brothers setHidden:YES];
    //[_overview superview];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentController2:(id)sender {
    if (_segmentController2.selectedSegmentIndex==0) {
        [_overview setHidden:NO];
        [_history setHidden:YES];
        [_docs setHidden:YES];
        [_brothers setHidden:YES];
    }
    if (_segmentController2.selectedSegmentIndex==1) {
        [_overview setHidden:YES];
        [_history setHidden:NO];
        [_docs setHidden:YES];
        [_brothers setHidden:YES];
    }
    if (_segmentController2.selectedSegmentIndex==2) {
        [_overview setHidden:YES];
        [_history setHidden:YES];
        [_docs setHidden:NO];
        [_brothers setHidden:YES];
    }
    if (_segmentController2.selectedSegmentIndex==3) {
        [_overview setHidden:YES];
        [_history setHidden:YES];
        [_docs setHidden:YES];
        [_brothers setHidden:NO];
    }


}
@end
