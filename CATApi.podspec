
Pod::Spec.new do |spec|
  
  spec.name         = "CATApi"
  spec.version      = "0.0.1"
  spec.summary      = "A Lib For Api."
  spec.description  = <<-DESC
  CATApi是请求接口的封装呢
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
  
  spec.source_files = "Code/CATApi/*.{swift}"
  
  spec.dependency 'CATSign'
  spec.dependency 'Alamofire'
  spec.dependency 'WLReqKit'
  spec.dependency 'WLToolsKit/Common'
  
end
