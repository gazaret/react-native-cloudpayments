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

  spec.dependency "React"
  spec.dependency "SDK-iOS"
  
end
