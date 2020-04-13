//
//  AWMUserCenterViewModel.swift
//  AWMBridge
//
//  Created by 王磊 on 2020/3/30.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import WLBaseViewModel
import RxCocoa
import RxSwift
import AWMBean
import AWMSign
import AWMApi
import AWMRReq
import AWMCache

@objc public final class AWMUserCenterBean: NSObject {
    
    @objc public var type: AWMUserCenterType = .userInfo
    
    @objc public var title: String = ""
    
    @objc public static func createUserCenter(_ type: AWMUserCenterType ,title: String) -> AWMUserCenterBean {
        
        let profile = AWMUserCenterBean()
        
        profile.type = type
        
        profile.title = title
        
        return profile
    }
    
    static public func createUserCenterTypes() -> [AWMUserCenterBean] {
        
        var result: [AWMUserCenterBean] = []
        
        for item in AWMUserCenterType.types {
            
            result += [AWMUserCenterBean.createUserCenter(item, title: item.title)]
        }
        
        return result
    }
    private override init() {
        
    }
}

@objc (AWMUserCenterType)
public enum AWMUserCenterType : Int{
    
    case about
    
    case userInfo
    
    case setting
    
    case contactUS
    
    case privacy
    
    case focus
    
    case myCircle
    
    case order
    
    case address
    
    case characters
    
    case feedBack
}

extension AWMUserCenterType {
    
    static var types: [AWMUserCenterType] {
        
        if AWMConfigure.fetchPType() == .flower {
            
            return [userInfo,.order,.address,.contactUS,.privacy,.about,.feedBack,.setting]
        }
        
        return [userInfo,.contactUS,.privacy,.about,.feedBack,.setting]
    }
    
    var cellHeight: CGFloat {
        
        switch self {
            
        default: return 55
        }
    }
    
    var title: String {
        
        switch self {
            
        case .about: return "关于我们"
            
        case .contactUS: return "联系我们"
            
        case .userInfo: return "用户资料"
            
        case .setting: return "设置"
            
        case .privacy: return "隐私政策"
            
        case .focus: return "我的关注"
            
        case .myCircle: return "我的发布"
            
        case .address: return "我的地址"
            
        case .order: return "订单管理"
            
        case .characters: return "角色信息"
            
        case .feedBack: return "意见建议"
        default: return ""
            
        }
    }
}

struct AWMUserCenterViewModel: WLBaseViewModel {
    
    var input: WLInput
    
    var output: WLOutput
    
    struct WLInput {
        
        let modelSelect: ControlEvent<AWMUserCenterBean>
        
        let itemSelect: ControlEvent<IndexPath>
    }
    
    struct WLOutput {
        
        let zip: Observable<(AWMUserCenterBean,IndexPath)>
        
        let tableData: BehaviorRelay<[AWMUserCenterBean]> = BehaviorRelay<[AWMUserCenterBean]>(value: [])
        
        let userInfo: Observable<AWMUserBean?>
    }
    init(_ input: WLInput ,disposed: DisposeBag) {
        
        self.input = input
        
        let userInfo: Observable<AWMUserBean?> = AWMUserInfoCache.default.rx.observe(AWMUserBean.self, "userBean")
        
        AWMUserInfoCache.default.userBean = AWMUserInfoCache.default.queryUser()
        
        awmDictResp(AWMApi.fetchProfile)
            .mapObject(type: AWMUserBean.self)
            .map({ AWMUserInfoCache.default.saveUser(data: $0) })
            .subscribe(onNext: { (_) in })
            .disposed(by: disposed)
        
        let zip = Observable.zip(input.modelSelect,input.itemSelect)
        
        self.output = WLOutput(zip: zip, userInfo: userInfo)
        
        self.output.tableData.accept(AWMUserCenterBean.createUserCenterTypes())
    }
}

