#
#  Be sure to run `pod spec lint XMNTabbed.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "XMNTabbed"
  s.version      = "0.0.1"
  s.summary      = "自适应布局的标签排列空间,可以自定义各个标签大小,内容,文本"
  s.homepage     = "https://github.com/ws00801526/XMNTabbedViewExample"
  s.license      = "MIT"
  s.author             = { "XMFraker" => "3057600441@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ws00801526/XMNTabbedViewExample.git", :tag => "#{s.version}" }
  s.source_files  = "XMNTabbedFramework/*.{h,m}"
  s.requires_arc = true
end
