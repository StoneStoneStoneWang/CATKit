
Pod::Spec.new do |spec|
  
  spec.name         = "CATBean"
  spec.version      = "0.0.1"
  spec.summary      = "A Lib For Bean."
  spec.description  = <<-DESC
  CATBean是所有模型的封装
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
  
  spec.dependency 'ObjectMapper'
  
  spec.subspec 'Gender' do |gender|
    gender.source_files = "Code/CATBean/Gender/*.{swift}"
  end
  
  spec.subspec 'Account' do |account|
    account.source_files = "Code/CATBean/Account/*.{swift}"
  end
  
  spec.subspec 'User' do |user|
    user.source_files = "Code/CATBean/User/*.{swift}"
    user.dependency 'CATBean/Gender'
  end
  spec.subspec 'Black' do |black|
    black.source_files = "Code/CATBean/Black/*.{swift}"
    black.dependency 'CATBean/User'
    black.dependency 'RxDataSources'
  end
  spec.subspec 'Focus' do |focus|
    focus.source_files = "Code/CATBean/Focus/*.{swift}"
    focus.dependency 'CATBean/User'
    focus.dependency 'RxDataSources'
  end
  
  spec.subspec 'KeyValue' do |keyValue|
    keyValue.source_files = "Code/CATBean/KeyValue/*.{swift}"
    keyValue.dependency 'RxDataSources'
  end
  
  spec.subspec 'Circle' do |circle|
    circle.source_files = "Code/CATBean/Circle/*.{swift}"
    circle.dependency 'CATBean/KeyValue'
    circle.dependency 'CATBean/User'
    circle.dependency 'WLToolsKit/JsonCast'
  end
  
  spec.subspec 'Commodity' do |commodity|
    commodity.source_files = "Code/CATBean/Commodity/*.{swift}"
    commodity.dependency 'CATBean/KeyValue'
    commodity.dependency 'CATBean/User'
    commodity.dependency 'WLToolsKit/JsonCast'
  end
  spec.subspec 'Comment' do |comment|
    comment.source_files = "Code/CATBean/Comment/*.{swift}"
    comment.dependency 'CATBean/User'
    comment.dependency 'RxDataSources'
  end
  
  spec.subspec 'Area' do |area|
    area.source_files = "Code/CATBean/Area/*.{swift}"
    area.dependency 'RxDataSources'
  end
  
  spec.subspec 'Address' do |address|
    address.source_files = "Code/CATBean/Address/*.{swift}"
    address.dependency 'RxDataSources'
  end
  
end
