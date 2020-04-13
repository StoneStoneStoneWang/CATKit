Pod::Spec.new do |spec|
  
  spec.name         = "CATContainer"
  spec.version      = "0.0.1"
  spec.summary      = "A Lib For 某些界面."
  spec.description  = <<-DESC
  CATContainer是欢迎界面
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
  
  # 翻译
  spec.subspec 'Welcome' do |welcome|
    
    welcome.source_files = "Code/CATContainer/Welcome/*.{h,m}"
    welcome.dependency 'CATConfig'
    welcome.dependency 'CATBridge/Welcome/Bridge'
    welcome.dependency 'SToolsKit'
    welcome.dependency 'Masonry'
  end
  
  # 协议 textview
  spec.subspec 'Protocol' do |protocol|
    
    protocol.source_files = "Code/CATContainer/Protocol/*.{h,m}"
    protocol.dependency 'CATConfig'
    protocol.dependency 'CATBridge/Protocol/Bridge'
    protocol.dependency 'SToolsKit'
    protocol.dependency 'Masonry'
  end
  # 协议 webview
  spec.subspec 'Privacy' do |privacy|
    
    privacy.source_files = "Code/CATContainer/Privacy/*.{h,m}"
    privacy.dependency 'CATConfig'
    privacy.dependency 'CATBridge/Protocol/Bridge'
    privacy.dependency 'SToolsKit'
    privacy.dependency 'Masonry'
  end
  
  # 登陆 login
  spec.subspec 'Login' do |login|
    
    login.source_files = "Code/CATContainer/Login/*.{h,m}"
    login.dependency 'CATConfig'
    login.dependency 'CATBridge/Login/Bridge'
    login.dependency 'Masonry'
    login.dependency 'CATTextField'
    login.dependency 'CATTransition'
  end
  
  # 注册 reg
  spec.subspec 'Reg' do |reg|
    
    reg.source_files = "Code/CATContainer/Reg/*.{h,m}"
    reg.dependency 'CATConfig'
    reg.dependency 'CATBridge/Reg/Bridge'
    reg.dependency 'Masonry'
    reg.dependency 'CATTextField'
    reg.dependency 'CATTransition'
  end
  
  # 密码 password
  spec.subspec 'Password' do |password|
    
    password.source_files = "Code/CATContainer/Password/*.{h,m}"
    password.dependency 'CATConfig'
    password.dependency 'CATBridge/Password/Bridge'
    password.dependency 'Masonry'
    password.dependency 'CATTextField'
    password.dependency 'CATTransition'
  end
  
  # 轮播 carousel
  spec.subspec 'Carousel' do |carousel|
    
    carousel.source_files = "Code/CATContainer/Carousel/*.{h,m}"
    carousel.dependency 'CATConfig'
    carousel.dependency 'CATBridge/Carousel/Bridge'
    carousel.dependency 'Masonry'
    carousel.dependency 'CATCollection'
  end
  
  # 轮播 banner
  spec.subspec 'Banner' do |banner|
    
    banner.source_files = "Code/CATContainer/Banner/*.{h,m}"
    banner.dependency 'CATConfig'
    banner.dependency 'CATBridge/Carousel/Bridge'
    banner.dependency 'Masonry'
    banner.dependency 'CATCollection'
    banner.dependency 'SDWebImage'
  end
  
  # 设置 setting
  spec.subspec 'Setting' do |setting|
    
    setting.source_files = "Code/CATContainer/Setting/*.{h,m}"
    setting.dependency 'CATConfig'
    setting.dependency 'CATBridge/Setting/Bridge'
    setting.dependency 'Masonry'
    setting.dependency 'CATTable'
    setting.dependency 'SDWebImage'
  end
  
  # 关于我们 about
  spec.subspec 'About' do |about|
    
    about.source_files = "Code/CATContainer/About/*.{h,m}"
    about.dependency 'CATConfig'
    about.dependency 'CATBridge/About/Bridge'
    about.dependency 'Masonry'
    about.dependency 'CATTable'
  end
  
  # 意见建议 feedBack
  spec.subspec 'FeedBack' do |feedBack|
    
    feedBack.source_files = "Code/CATContainer/FeedBack/*.{h,m}"
    feedBack.dependency 'CATConfig'
    feedBack.dependency 'CATBridge/FeedBack/Bridge'
    feedBack.dependency 'Masonry'
    feedBack.dependency 'CATTransition'
    feedBack.dependency 'JXTAlertManager'
    feedBack.dependency 'CATTextField'
  end
  
  # 昵称 Name
  spec.subspec 'Name' do |name|
    
    name.source_files = "Code/CATContainer/Name/*.{h,m}"
    name.dependency 'CATConfig'
    name.dependency 'CATBridge/Name/Bridge'
    name.dependency 'Masonry'
    name.dependency 'CATTextField'
    name.dependency 'CATTransition'
  end
  
  # 个性签名 signature
  spec.subspec 'Signature' do |signature|
    
    signature.source_files = "Code/CATContainer/Signature/*.{h,m}"
    signature.dependency 'CATConfig'
    signature.dependency 'CATBridge/Signature/Bridge'
    signature.dependency 'Masonry'
    signature.dependency 'CATTransition'
  end
  
  # 个人中心 userinfo
  spec.subspec 'UserInfo' do |userInfo|
    userInfo.frameworks = 'UIKit', 'Foundation','CoreServices'
    userInfo.source_files = "Code/CATContainer/UserInfo/*.{h,m}"
    userInfo.dependency 'CATConfig'
    userInfo.dependency 'CATBridge/UserInfo/Bridge'
    userInfo.dependency 'Masonry'
    userInfo.dependency 'CATTable'
    userInfo.dependency 'ZDatePicker'
    userInfo.dependency 'SDWebImage'
    userInfo.dependency 'JXTAlertManager'
    userInfo.dependency 'WLToolsKit/Image'
  end
  
  # 意见建议 feedBack
  spec.subspec 'FeedBack' do |feedBack|
    
    feedBack.source_files = "Code/CATContainer/FeedBack/*.{h,m}"
    feedBack.dependency 'CATConfig'
    feedBack.dependency 'CATBridge/FeedBack/Bridge'
    feedBack.dependency 'Masonry'
    feedBack.dependency 'CATTransition'
    feedBack.dependency 'JXTAlertManager'
    feedBack.dependency 'CATTextField'
  end
  
  #  # 黑名单 black
  #  spec.subspec 'Black' do |black|
  #
  #    black.source_files = "Code/CATContainer/Black/*.{h,m}"
  #    black.dependency 'CATConfig'
  #    black.dependency 'CATBridge/Black/Bridge'
  #    black.dependency 'Masonry'
  #    black.dependency 'CATTable'
  #    black.dependency 'SDWebImage'
  #    black.dependency 'JXTAlertManager'
  #  end
  #  # 关注 focus
  #  spec.subspec 'Focus' do |focus|
  #
  #    focus.source_files = "Code/CATContainer/Focus/*.{h,m}"
  #    focus.dependency 'CATConfig'
  #    focus.dependency 'CATBridge/Focus/Bridge'
  #    focus.dependency 'Masonry'
  #    focus.dependency 'CATTable'
  #    focus.dependency 'SDWebImage'
  #    focus.dependency 'JXTAlertManager'
  #  end
  
  #  # 举报 举报
  #  spec.subspec 'Report' do |report|
  #
  #    report.source_files = "Code/CATContainer/Report/*.{h,m}"
  #    report.dependency 'CATConfig'
  #    report.dependency 'CATBridge/Report/Bridge'
  #    report.dependency 'Masonry'
  #    report.dependency 'CATTable'
  #    report.dependency 'JXTAlertManager'
  #  end
  
  
  # 地址 address
  spec.subspec 'Address' do |address|
    
    address.source_files = "Code/CATContainer/Address/*.{h,m}"
    address.dependency 'CATConfig'
    address.dependency 'CATBridge/Address/Bridge'
    address.dependency 'Masonry'
    address.dependency 'CATTable'
    address.dependency 'JXTAlertManager'
  end
  # 地址 area
  spec.subspec 'Area' do |area|
    
    area.source_files = "Code/CATContainer/Area/*.{h,m}"
    area.dependency 'CATConfig'
    area.dependency 'CATBridge/Area/Bridge'
    area.dependency 'Masonry'
    area.dependency 'CATTable'
    area.dependency 'CATCollection'
    area.dependency 'JXTAlertManager'
  end
  
  # 地址 地图
  spec.subspec 'CATAMapViewController' do |amap|
    amap.vendored_frameworks = 'Framework/CATAMapViewController/CATAMapViewController.framework'
    amap.dependency 'CATTransition'
    amap.dependency 'CATAMap'
    amap.dependency 'CATReq'
  end
  
end
