#
# Be sure to run `pod lib lint EasyTransitioning.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyTransitioning'
  s.version          = '0.1.1'
  s.summary          = 'Removing the boilerplate code associated with UIViewControllerAnimatedTransitioning'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Want to create custom transitions between view controllers without writing boilerplate code?
                       DESC

  s.homepage         = 'https://github.com/hweetty/EasyTransitioning'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jerry Yu' => 'hi@jerryyu.ca' }
  s.source           = { :git => 'https://github.com/hweetty/EasyTransitioning.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hweetty'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/**/*'

  # s.resource_bundles = {
  #   'EasyTransitioning' => ['EasyTransitioning/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
