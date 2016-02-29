#
# Be sure to run `pod lib lint MaritzCXMobileSurveys.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MaritzCXMobileSurveys"
  s.version          = "0.1.1"
  s.summary          = "MaritzCX iOS Survey SDK."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
This SDK allows an iOS developer to host a MaritzCX survey inside an iOS app.
                       DESC

  s.homepage         = "https://github.com/MaritzCX/maritzcx-ios-survey-sdk"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mike Perry" => "mike.perry@maritzcx.com" }
  s.source           = { :git => "https://github.com/MaritzCX/maritzcx-ios-survey-sdk.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MaritzCX'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
  s.resource_bundles = {
    'MaritzCXMobileSurveys' => ['Pod/**/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
