Pod::Spec.new do |spec|
  
  spec.name         = "CATCache"
  spec.version      = "0.0.1"
  spec.summary      = "A Lib For cache."
  spec.description  = <<-DESC
  CATCache是user 和account 的封装
  DESC
  
  spec.homepage     = "https://github.com/StoneStoneStoneWang/CATKit.git"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  
  spec.swift_version = '5.0'
  
  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  spec.static_framework = true
  
  spec.frameworks = 'UIKit', 'Foundation'
  
  spec.source = { :git => "https://github.com/StoneStoneStoneWang/CATKit.git", :tag => "#{spec.version}" }
  
  spec.subspec 'Account' do |account|
    account.source_files = "Code/CATCache/Account/*.{swift}"
    account.dependency 'CATBean/Account'
  end
  
  spec.subspec 'User' do |user|
    user.source_files = "Code/CATCache/User/*.{swift}"
    user.dependency 'CATBean/User'
    user.dependency 'CATYY'
    user.dependency 'CATCache/Account'
  end
  
end
