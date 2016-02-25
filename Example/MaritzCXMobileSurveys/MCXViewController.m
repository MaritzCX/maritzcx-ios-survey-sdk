//
//  MCXViewController.m
//  MaritzCXMobileSurveys
//
//  Created by Mike Perry on 01/25/2016.
//  Copyright (c) 2016 Mike Perry. All rights reserved.
//

#import "MCXViewController.h"
#import "MCXSurveyView.h"

@interface MCXViewController ()

@end

@implementation MCXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.surveyView.delegate = self;
}

- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPageNext:(int)page {
    NSString *message = [NSString stringWithFormat:@"!NEXT!: %ld",(long)page];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPagePrev:(int)page {
    NSString *message = [NSString stringWithFormat:@"!BACK!: %ld",(long)page];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (void)surveyDidSubmit {
    NSString *message = @"!SUBMIT!";
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadSurvey:(id)sender {
    // Survey URL
    NSString *url = self.surveyURL.text;
    
    /*
     //Add MCXSurveyView programatically
     MCXSurveyView *surveyView = [[MCXSurveyView alloc] init];
     surveyView.backgroundColor = [UIColor blueColor];
     [self.view addSubview:surveyView];
     
     surveyView.center = CGPointMake(100, 300);
     
     //Handle Auto Layout
     surveyView.translatesAutoresizingMaskIntoConstraints = NO;
     
     //Pin to bottom
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:surveyView
     attribute:NSLayoutAttributeBottom
     relatedBy:NSLayoutRelationEqual
     toItem:self.view
     attribute:NSLayoutAttributeBottom
     multiplier:1.0
     constant:0.0]];
     */

    //Load Survey into programatically loaded Survey View
    [self.surveyView loadSurvey:url];
    
    
    //Load Survey into NIB Survey View
    //[surveyView loadSurvey:url];
}
@end
