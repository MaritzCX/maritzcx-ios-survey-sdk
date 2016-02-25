# MaritzCX iOS Survey SDK

![MaritzCX icon](http://www.maritzcx.com/wp-content/themes/allegiance/images/logo.png)


## Overview
***
**MaritzCX iOS Survey SDK**, the best thing ever.

## Setup
***
MaritzCX iOS Survey SDK supports the following versions of software:

* Xcode 7 and later
* iOS 8 and later

### CocoaPods

1. The MaritzCX iOS Survey SDK can be installed using [CocoaPods](http://cocoapods.org/). Install CocoaPods by running the command:

		$ sudo gem install cocoapods
		$ pod setup
	
2. Add the pod to your **Podfile**

		source 'https://github.com/CocoaPods/Specs.git'
		
		pod 'MaritzCXMobileSurveys'

3. Install the pod

		$ pod install
		
## Update the SDK to a Newer Version
***
### CocoaPods

1. Update the pod by running the command:
		
		$ pod update

## iOS 9 Apps
***

With the release of iOS 9, Apple now enforces [App Transport Security (ATS)](https://developer.apple.com/library/prerelease/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html). The endpoint that serves a survey does not yet conform to ATS. To ensure iOS 9 apps can successfully connect to a survey, you’ll need to configure them to interact properly with Apple’s ATS by adding these properties to your **info.plist** file:

	<key>NSAppTransportSecurity</key>
    <dict>
    	<key>NSExceptionDomains</key>
		<dict>
			<key>**DOMAIN OF THE SURVEY**</key>
			<dict>
				<key>NSThirdPartyExceptionMinimumTLSVersion</key>
				<string>TLSv1.0</string>
				<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
		</dict>
    </dict>

## Getting Started
***

### MCXSurveyView

You can use the *MCXSurveyView* class to embed a survey in your app.  

Use the *loadSurvey:surveyURL* method to load a survey.  

Set the *delegate* property to an object conforming to the *MCXSurveyViewDelegate* protocol if you want to track when a respondent pages through a survey or submits a survey.  


**Setting the Delegate**

  delegate *Property*  
  
- Declaration  
	
		@property (assign) id <MCXSurveyViewDelegate> delegate;  
		
- The delegate is sent messages as a respondent interacts with a survey

**Loading a Survey**

  loadSurvey:surveyURL:  
  
- Declaration

		- (void)loadSurvey:(NSString *)surveyURL  
		
- Parameters

	Name | Description
	-----------: | :-----------
	surveyURL         | The URL to the survey you wish to load in the survey view       

### MCXSurveyViewDelegate

The *MCXSurveyViewDelegate* protocol defines methods that a delegate of a *MCXSurveyView* object can optionaly implement to intervene when a survey is paged or submitted.  

**Survey Paging**

  surveyView:surveyDidPageNext:
  
- Declaration

		- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPageNext:(int)page;

- Parameters

	Name | Description
	-----------: | :-----------
	surveyView         | The survey view that has been paged
	page				| The page number of the survey the user is viewing after the survey has been paged

surveyView:surveyDidPagePrev:
  
- Declaration

		- (void)surveyView:(MCXSurveyView *)surveyView surveyDidPagePrev:(int)page;

- Parameters

	Name | Description
	-----------: | :-----------
	surveyView         | The survey view that has been paged
	page				| The page number of the survey the user is viewing after the survey has been paged
	
surveyDidSubmit:
  
- Declaration

		- (void)surveyDidSubmit;












