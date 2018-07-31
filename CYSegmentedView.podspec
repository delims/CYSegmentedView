#
#  Be sure to run `pod spec lint CYSegmentedView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "CYSegmentedView"
s.version      = "1.0.2"
s.license      = "MIT"
s.summary      = "A segmentedControl with vernier"

s.homepage     = "https://github.com/delims/CYSegmentedView"

s.source       = { :git => "https://github.com/delims/CYSegmentedView.git", :commit => "3a7b8b8" }
s.source       = { :git => "https://github.com/delims/CYSegmentedView.git", :tag => "#{s.version}" }

s.source_files = "CYSegmentedView/*.{h,m}"
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "7.0"
s.frameworks   = "UIKit", "Foundation"

# User
s.author             = { "delims" => "delims@qq.com" }
s.social_media_url   = "http://delims.github.io"

end
