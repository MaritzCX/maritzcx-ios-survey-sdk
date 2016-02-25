//
//  MCXSurveyView.m
//  Pods
//
//  Created by Mike Perry on 2/1/16.
//
//

#import "MCXSurveyView.h"

@implementation MCXSurveyView

@synthesize delegate = _delegate;

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        _delegate = nil;
        NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"MaritzCXMobileSurveys" ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        [bundle loadNibNamed:@"MCXSurveyView" owner:self options:nil];

        self.bounds = self.view.bounds;
        
        [self addSubview:self.view];
        //[self stretchToSuperView:self.view];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        _delegate = nil;
        NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"MaritzCXMobileSurveys" ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        [bundle loadNibNamed:@"MCXSurveyView" owner:self options:nil];

        self.bounds = self.view.bounds;
        
        [self addSubview:self.view];
    }
    return self;
}

- (void)loadSurvey:(NSString *)surveyURL
{
    if(surveyURL != (id)[NSNull null] && surveyURL.length > 0) {
        if(![surveyURL localizedCaseInsensitiveContainsString:@"origin=mobileapp"]) {
            surveyURL = [surveyURL stringByAppendingString:@"&origin=mobileapp"];
        }
        
        NSURL *url = [NSURL URLWithString:surveyURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        
        //self.webView.scalesPageToFit = NO;
        self.webView.delegate = self;
        
        [self.webView loadRequest:urlRequest];    }
}

- (BOOL)webView:(UIWebView *)webView2
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {

    NSURLComponents *components = [NSURLComponents componentsWithURL:[request URL] resolvingAgainstBaseURL:NO];
    NSString *host = [components host];
    
    if ([[host lowercaseString] isEqualToString:@"mcxmobileappsurvey"]) {
        NSString *path = [components path];
        NSArray *args = [components queryItems];
        NSArray *pathSegments = [path componentsSeparatedByString:@"/"];
        
        NSString *function = (NSString*)[pathSegments objectAtIndex:1];
        
        [self handleCall:function args:args];
        
        return NO;
    }
    
    return YES;
}

- (void)handleCall:(NSString*)functionName args:(NSArray*)args
{
    if ([functionName isEqualToString:@"next"]) {
        
        if ([args count]!=1) {
            NSLog(@"next event needs exactly 1 argument!");
            return;
        }

        NSURLQueryItem *queryItem = [args objectAtIndex:0];
        
        [self.delegate surveyView:self surveyDidPageNext:[queryItem.value intValue]];
        
    } else if ([functionName isEqualToString:@"back"]) {
        
        if ([args count]!=1) {
            NSLog(@"back event needs exactly 1 argument!");
            return;
        }
        
        NSURLQueryItem *queryItem = [args objectAtIndex:0];
        [self.delegate surveyView:self surveyDidPagePrev:[queryItem.value intValue]];
        
    } else if ([functionName isEqualToString:@"submit"]) {
        
        [self.delegate surveyDidSubmit];
        
    } else {
        NSLog(@"Unimplemented method '%@'",functionName);
    }
}


@end
