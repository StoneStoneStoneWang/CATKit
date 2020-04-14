Pod::Spec.new do |spec|
  
  spec.name         = "CATBridge"
  spec.version      = "0.0.1"
  spec.summary      = "A Lib For bridge."
  spec.description  = <<-DESC
  CATBridge是oc swift 转换的封装呢
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
  
  spec.subspec 'Base' do |base|
    base.source_files = "Code/CATBridge/Base/*.{swift}"
    base.dependency 'RxSwift'
  end
  
  #欢迎界面
  spec.subspec 'Welcome' do |welcome|
    
    welcome.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Welcome/VM/*.{swift}"
      vm.dependency 'WLToolsKit/Common'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
    end
    
    welcome.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Welcome/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Welcome/VM'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'CATCocoa/Button'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 协议
  spec.subspec 'Protocol' do |protocol|
    
    protocol.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Protocol/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATSign'
    end
    
    protocol.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Protocol/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Protocol/VM'
      bridge.dependency 'CATTextInner'
      bridge.dependency 'CATBridge/Base'
    end
  end
  # 协议
  spec.subspec 'Privacy' do |privacy|
    
    privacy.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Privacy/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATSign'
    end
    
    privacy.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Privacy/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Privacy/VM'
      bridge.dependency 'CATInner'
      bridge.dependency 'CATBridge/Base'
      
    end
  end
  
  # 登陆
  spec.subspec 'Login' do |login|
    
    login.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Login/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATCheck'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
    end
    
    login.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Login/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Login/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 注册/登陆
  spec.subspec 'Reg' do |reg|
    
    reg.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Reg/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATCheck'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
    end
    
    reg.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Reg/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Reg/VM'
      bridge.dependency 'CATCocoa/Button'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 密码
  spec.subspec 'Password' do |password|
    
    password.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Password/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATCheck'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
    end
    
    password.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Password/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Password/VM'
      bridge.dependency 'CATCocoa/Button'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 设置
  spec.subspec 'Setting' do |setting|
    
    setting.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Setting/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATCache/Account'
      vm.dependency 'CATSign'
    end
    
    setting.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Setting/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Setting/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'RxDataSources'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 关于我们
  spec.subspec 'About' do |about|
    
    about.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/About/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLToolsKit/String'
    end
    
    about.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/About/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/About/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'RxDataSources'
      bridge.dependency 'CATBridge/Base'
    end
  end
  # 昵称
  spec.subspec 'Name' do |name|
    
    name.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Name/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATCache/User'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLBaseResult'
    end
    
    name.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Name/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Name/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  # 个性签名
  spec.subspec 'Signature' do |signature|
    
    signature.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Signature/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATCache/User'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLBaseResult'
    end
    
    signature.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Signature/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Signature/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 我的资料
  spec.subspec 'UserInfo' do |userinfo|
    
    userinfo.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/UserInfo/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLBaseResult'
      vm.dependency 'CATCache/User'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
    end
    
    userinfo.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/UserInfo/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/UserInfo/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'RxDataSources'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 评论
  spec.subspec 'Comment' do |comment|
    
    comment.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Comment/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'CATBean/Comment'
      vm.dependency 'WLBaseResult'
      vm.dependency 'WLBaseViewModel'
    end
    
    comment.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Comment/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Comment/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
    end
  end
  # 举报
  spec.subspec 'Report' do |report|
    
    report.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Report/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'ObjectMapper'
      vm.dependency 'RxDataSources'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'WLBaseResult'
      vm.dependency 'WLBaseViewModel'
    end
    
    report.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Report/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Report/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'RxDataSources'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATHud'
    end
  end
  
  # 黑名单
  spec.subspec 'Black' do |black|
    
    black.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Black/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATBean/Black'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseResult'
    end
    
    black.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Black/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Black/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
    end
  end
  # 我的关注
  spec.subspec 'Focus' do |focus|
    
    focus.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Focus/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATBean/Focus'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseResult'
    end
    
    focus.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Focus/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Focus/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 翻译
  spec.subspec 'Translate' do |translate|
    
    translate.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Translate/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'ObjectMapper'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'WLBaseResult'
    end
    
    translate.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Translate/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Translate/VM'
      bridge.dependency 'CATTransition'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATHud'
    end
  end
  
  spec.subspec 'Video' do |video|
    
    video.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Video/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'WLBaseResult'
      vm.dependency 'WLBaseViewModel'
    end
    
    video.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Video/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Video/VM'
      bridge.dependency 'CATTransition'
      bridge.dependency 'CATCache/Account'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATHud'
    end
  end
  
  spec.subspec 'Profile' do |profile|
    
    profile.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Profile/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'CATCache/User'
      vm.dependency 'WLBaseResult'
      vm.dependency 'WLBaseViewModel'
    end
    
    profile.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Profile/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Profile/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCache/Account'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'RxGesture'
      bridge.dependency 'CATCocoa/SM'
    end
  end
  spec.subspec 'UserCenter' do |userCenter|
    
    userCenter.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/UserCenter/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'CATCache/User'
      vm.dependency 'WLBaseResult'
      vm.dependency 'WLBaseViewModel'
    end
    
    userCenter.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/UserCenter/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/UserCenter/VM'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATCache/Account'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'RxGesture'
      bridge.dependency 'CATCocoa/SM'
    end
  end
  # 个性签名
  spec.subspec 'FeedBack' do |feedBack|
    
    feedBack.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/FeedBack/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLBaseResult'
    end
    
    feedBack.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/FeedBack/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/FeedBack/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATBase'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # 评论 comment
  spec.subspec 'Comment' do |comment|
    
    comment.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Comment/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATBean/Comment'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseResult'
    end
    
    comment.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Comment/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Comment/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATBean/Circle'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
    end
  end
  
  # Collections 列表
  spec.subspec 'Collections' do |collections|
    
    collections.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Collections/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATBean/Circle'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseResult'
    end
    
    collections.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Collections/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Collections/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATCache/Account'
    end
  end
  
  # 黑名单
  spec.subspec 'Tables' do |tables|
    
    tables.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Tables/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATBean/Circle'
      vm.dependency 'CATRReq'
      vm.dependency 'CATApi'
      vm.dependency 'WLBaseResult'
    end
    
    tables.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Tables/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Tables/VM'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATCache/Account'
    end
  end
  
  # 轮播
  spec.subspec 'Carousel' do |welcome|
    
    welcome.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/Carousel/VM/*.{swift}"
      vm.dependency 'WLToolsKit/Common'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
      vm.dependency 'ObjectMapper'
    end
    
    welcome.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Carousel/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Carousel/VM'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'RxDataSources'
    end
  end
  
  # 1
  spec.subspec 'CollectionSection' do |cs|
    
    cs.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/CollectionSection/VM/*.{swift}"
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
    end
    
    cs.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/CollectionSection/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/CollectionSection/VM'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'RxDataSources'
    end
  end
  
  # 2
  spec.subspec 'TableSection' do |cs|
    
    cs.subspec 'VM' do |vm|
      vm.source_files = "Code/CATBridge/TableSection/VM/*.{swift}"
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'RxCocoa'
      vm.dependency 'RxSwift'
    end
    
    cs.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/TableSection/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/TableSection/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'RxDataSources'
    end
  end
  
  spec.subspec 'Area' do |area|
    
    area.subspec 'Manager' do |manager|
      
      manager.source_files = "Code/CATBridge/Area/Manager/*.{swift}"
      manager.dependency 'RxCocoa'
      manager.dependency 'WLBaseViewModel'
      manager.dependency 'CATApi'
      manager.dependency 'CATRReq'
      manager.dependency 'WLBaseResult'
      manager.dependency 'CATYY'
      manager.dependency 'CATBean/Area'
      manager.dependency 'CATRReq'
    end
    area.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Area/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'WLBaseResult'
      vm.dependency 'CATBean/Area'
    end
    
    area.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Area/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Area/VM'
      bridge.dependency 'CATBridge/Area/Manager'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATCocoa/SM'
    end
  end
  
  spec.subspec 'AreaJson' do |areaJson|
    
    areaJson.source_files = "Code/CATBridge/AreaJson/*.{swift}"
  end
  
  spec.subspec 'Address' do |address|
    
    address.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Address/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'ObjectMapper'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'WLBaseResult'
      vm.dependency 'CATBean/Area'
      vm.dependency 'CATBean/Address'
      vm.dependency 'WLToolsKit/String'
      
    end
    
    address.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Address/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Address/VM'
      bridge.dependency 'CATTable'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATHud'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/SM'
      bridge.dependency 'CATCocoa/Refresh'
    end
  end
  spec.subspec 'Message' do |message|
    
    message.subspec 'VM' do |vm|
      
      vm.source_files = "Code/CATBridge/Message/VM/*.{swift}"
      vm.dependency 'RxCocoa'
      vm.dependency 'WLBaseViewModel'
      vm.dependency 'CATApi'
      vm.dependency 'CATRReq'
      vm.dependency 'WLBaseResult'
      vm.dependency 'CATBean/Message'
      
    end
    
    message.subspec 'Bridge' do |bridge|
      bridge.source_files = "Code/CATBridge/Message/Bridge/*.{swift}"
      bridge.dependency 'CATBridge/Message/VM'
      bridge.dependency 'CATCollection'
      bridge.dependency 'CATBridge/Base'
      bridge.dependency 'CATCocoa/ASM'
      bridge.dependency 'CATCocoa/Refresh'
    end
  end
end
