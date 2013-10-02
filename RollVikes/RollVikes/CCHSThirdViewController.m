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
@synthesize idXMLwebview;
@synthesize IDimageView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    idXMLwebview.scrollView.delegate = idXMLwebview;
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
    NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
    NSString *EnIDnumber = @"";
    if (standardUserEnID)
        EnIDnumber = [standardUserEnID objectForKey:@"EnID"];
    NSMutableString *idXMLurl = [NSMutableString stringWithString:@"http://ccas.centralcatholic.private/CCHSID.aspx?sid="];
    [idXMLurl appendString:EnIDnumber];
    NSMutableString *imageurl =[NSMutableString stringWithString:@"http://ccas.centralcatholic.private/photos/"];
    [imageurl appendString:IDnumber];
    NSString *jpg = @".jpg";
    [imageurl appendString:jpg];
    //NSLog(@"%@",imageurl);
    NSURL * imageURL = [NSURL URLWithString:imageurl];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    [IDimageView setImage:image];
    NSURL *url4 = [NSURL URLWithString:idXMLurl];
    NSURLRequest *req2 = [NSURLRequest requestWithURL:url4];
    //NSLog(@"%@",idXMLurl);
    Reachability *reachability = [Reachability reachabilityWithHostName:idXMLurl];
    NetworkStatus status = [reachability currentReachabilityStatus];
    if (!status) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Update Error"
        message:@"This is a chached version of your ID information. You must be connected to the internet via a Central Catholic wifi for your ID to be updated and barcode to be shown."
        delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
        [alert show];
    }
    
    [idXMLwebview loadRequest:req2];
    [idXMLwebview.scrollView setZoomScale:0.75];
    NSURL *url3 = [NSURL URLWithString:fullIDurl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url3];
    if (status) {
        [barcodeWeb loadRequest:req];
        //NSLog(@"%@",fullIDurl);
        //barcodeWeb.scrollView.zoomScale = 1.90;  not working in iOS7
    }

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
