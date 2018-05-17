#
# Be sure to run `pod lib lint SASScrolletSegment.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SASScrolletSegment'
  s.version          = '0.1.0'
  s.summary          = 'Scrolling segments controller with underline'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Scrolling segments controller with underline.I created the project, because I did not find an analog with a dynamic text length in Scrolling segments'

  s.homepage         = 'https://github.com/lestadNew/SASScrolletSegment'
  #s.screenshots     = 'https://drive.google.com/file/d/1mfs4G859f4TQ8QcqgpOR4nqsZBzI3G-a/view?usp=sharing'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lestadNew' => 'topor.9090@gmail.com' }
  s.source           = { :git => 'https://github.com/lestadNew/SASScrolletSegment.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SASScrolletSegment/Classes/*'
  
  s.resource_bundles = {
      #   'SASScrolletSegment' => ['SASScrolletSegment/Assets/*.png']
      'SASScrolletSegment' => ['SASScrolletSegment/Classes/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
