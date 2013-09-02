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
- (void)viewDidLoad
{
    [super viewDidLoad];
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
    
    NSURL *url3 = [NSURL URLWithString:fullIDurl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url3];
    [barcodeWeb loadRequest:req];

	// Do any additional setup after loading the view.
    

/*    NSString *result = nil;
    
    // Determine "<div>" location
    NSRange divRange = [string rangeOfString:@"<div>" options:NSCaseInsensitiveSearch];
    if (divRange.location != NSNotFound)
    {
        // Determine "</div>" location according to "<div>" location
        NSRange endDivRange;
        
        endDivRange.location = divRange.length + divRange.location;
        endDivRange.length   = [string length] - endDivRange.location;
        endDivRange = [string rangeOfString:@"</div>" options:NSCaseInsensitiveSearch range:endDivRange];
        
        if (endDivRange.location != NSNotFound)
        {
            // Tags found: retrieve string between them
            divRange.location += divRange.length;
            divRange.length = endDivRange.location - divRange.location;
            
            result = [string substringWithRange:divRange];
            NSLog(@"%@",result);
        }
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    NSUserDefaults *standardUserEnID = [NSUserDefaults standardUserDefaults];
    NSString *EnIDnumber = @"";
    if (standardUserEnID)
        EnIDnumber = [standardUserEnID objectForKey:@"EnID"];
    NSMutableString *idXMLurl = [NSMutableString stringWithString:@"http://ccas.centralcatholic.private/CCHSID.aspx?sid="];
    [idXMLurl appendString:EnIDnumber];
    NSURL *url4 = [NSURL URLWithString:idXMLurl];
    NSURLRequest *req2 = [NSURLRequest requestWithURL:url4];
    NSLog(@"%@",idXMLurl);
    [idXMLwebview loadRequest:req2];

    NSString *html = [idXMLwebview stringByEvaluatingJavaScriptFromString:@"document.body.outerHTML"];
    NSString *string = html;
    NSLog(@"%@",string);
}
@end
