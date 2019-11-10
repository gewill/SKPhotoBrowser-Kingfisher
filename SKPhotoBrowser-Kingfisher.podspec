#
# Be sure to run `pod lib lint SKPhotoBrowser-Kingfisher.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SKPhotoBrowser-Kingfisher"
  s.version          = "2.1.0"
  s.summary          = "Use SKPhotoBrowser, download and cache  image by Kingfisher."
  s.description  = <<-EOS
    Use SKPhotoBrowser, download and cache image by Kingfisher.
    Instructions on how to use it are in
    [the README](https://github.com/gewill/SKPhotoBrowser-Kingfisher).
  EOS
  s.homepage     = "https://github.com/gewill/SKPhotoBrowser-Kingfisher"
  s.license      = { :type => "MIT", :file => "License" }
  s.author           = { "Ge Will" => "531sunlight@gmail.com" }
  s.source           = { :git => "https://github.com/gewill/SKPhotoBrowser-Kingfisher.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/BoJack_D'

  s.swift_version = "4.2"
  s.swift_versions = ['4.0', '4.2', '5.0']

  s.ios.deployment_target = '10.0'
  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Source/*.swift"
    ss.dependency "Kingfisher", "~> 5.9.0"
    ss.dependency "SKPhotoBrowser", "~> 6.1.0"
    ss.framework  = "UIKit"
  end
end
