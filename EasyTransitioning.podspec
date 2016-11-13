Pod::Spec.new do |s|
  s.name             = 'EasyTransitioning'
  s.version          = '0.2.0'
  s.summary          = 'Removing the boilerplate code associated with UIViewControllerAnimatedTransitioning'
  s.description      = <<-DESC
Make UIViewControllerAnimatedTransitioning better
                       DESC

  s.homepage         = 'https://github.com/hweetty/EasyTransitioning'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jerry Yu' => 'hi@jerryyu.ca' }
  s.social_media_url = 'https://twitter.com/hweetty'

  s.requires_arc     = true
  s.source           = { :git => 'https://github.com/hweetty/EasyTransitioning.git', :tag => s.version.to_s }
  s.source_files     = 'EasyTransitioning/Classes/**/*'
  s.ios.deployment_target = '8.0'

end
