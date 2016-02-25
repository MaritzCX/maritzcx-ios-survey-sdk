//
//  MCXViewController.h
//  MaritzCXMobileSurveys
//
//  Created by Mike Perry on 01/25/2016.
//  Copyright (c) 2016 Mike Perry. All rights reserved.
//

@import UIKit;
#import "MCXSurveyView.h"

@interface MCXViewController : UIViewController <MCXSurveyViewDelegate>

@property (weak, nonatomic) IBOutlet MCXSurveyView *surveyView;
@property (weak, nonatomic) IBOutlet UITextField *surveyURL;

- (IBAction)loadSurvey:(id)sender;

@end
