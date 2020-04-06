Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "BoosterIOS"
s.summary = "BoosterIOS"
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Ali Can Ozkara" => "alican.ozkara@efectura.com" }
s.homepage = "https://github.com/efectura/BoosterIOS"
s.source = { :git => "https://github.com/efectura/BoosterIOS.git",
             :tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files = "Booster/**/*"
s.exclude_files = "Booster/**/*.plist"
s.swift_version = '5.0'
s.ios.deployment_target  = '11.0'

end
