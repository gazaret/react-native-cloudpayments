#
#  Be sure to run `pod spec lint RNCloudPayments.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "RNCloudPayments"
  spec.version      = "1.1.0"
  spec.summary      = "React Native library for using CloudPayments SDK"
  spec.description  = "React Native library for using CloudPayments SDK"
  spec.homepage     = "https://github.com/gazaret/react-native-cloudpayments"

  spec.license      = { :type => "MIT" }

  spec.author             = { "Nikolay Polukhin" => "polu-hin@mail.ru" }

  spec.platform     = :ios
  spec.ios.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/gazaret/react-native-cloudpayments.git", :tag => "#{spec.version}" }

  spec.source_files  = "RNCloudPayments", "ios/**/*.{h,m}"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true

  # spec.dependency "SDK-iOS"
end
