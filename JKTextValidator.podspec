#
#  Be sure to run `pod spec lint JKTextValidator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "JKTextValidator"
  s.version      = "1.0.2"
  s.summary      = "Class cluster for Text Validators in iOS, such as Email address, Chinese mobile phone number, etc..."
  s.description  = <<-DESC
                   A longer description of JKTextValidator in Markdown format.
                   * A simple class cluster for Text Validators in iOS, such as Email address, Chinese mobile phone number, etc...
                   DESC

  s.homepage     = "https://github.com/JasonWorking/TextValidator"
  s.license      = "MIT"
  s.author             = { "JasonWorking" => "331314708@qq.com" }
  s.social_media_url   = "http://twitter.com/iDev_Jason"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/JasonWorking/TextValidator.git", :tag => "1.0.2" }
  s.source_files  = "*.{h,m}"
  s.framework  = "Foundation"
  s.requires_arc = true

end
