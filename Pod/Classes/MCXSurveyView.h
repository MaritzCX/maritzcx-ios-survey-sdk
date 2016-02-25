//
//  MCXSurveyView.h
//  Pods
//
//  Created by Mike Perry on 2/1/16.
//
//

#import <UIKit/UIKit.h>

@class MCXSurveyView;

@protocol MCXSurveyViewDelegate
- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPageNext:(int)page;
- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPagePrev:(int)page;
- (void)surveyDidSubmit;
@end

@interface MCXSurveyView : UIView <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (assign) id <MCXSurveyViewDelegate> delegate;

- (void)loadSurvey:(NSString *)surveyURL;

@end
