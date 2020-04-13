//
//  AWMProfileViewModel.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/27.
//  Copyright © 2019 three stone 王. All rights reserved.
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

@objc public final class AWMProfileBean: NSObject {
    
    @objc public var type: AWMProfileType = .space
    
    @objc public var title: String = ""
    
    @objc public static func createProfile(_ type: AWMProfileType ,title: String) -> AWMProfileBean {
        
        let profile = AWMProfileBean()
        
        profile.type = type
        
        profile.title = title
        
        return profile
    }
    
    static public func createProfileTypes(_ hasSpace: Bool) -> [AWMProfileBean] {
        
        var result: [AWMProfileBean] = []
        
        if hasSpace {
            
            for item in AWMProfileType.spaceTypes {
                
                result += [AWMProfileBean.createProfile(item, title: item.title)]
            }
            
        } else {
            
            for item in AWMProfileType.types {
                
                result += [AWMProfileBean.createProfile(item, title: item.title)]
            }
        }
        
        return result
    }
    private override init() {
        
    }
}

@objc (AWMProfileType)
public enum AWMProfileType : Int{
    
    case about
    
    case userInfo
    
    case setting
    
    case contactUS
    
    case privacy
    
    case focus
    
    case space
    
    case myCircle
    
    case order
    
    case address
    
    case characters
    
    case feedBack
    
    case favor
}

extension AWMProfileType {
    
    static var spaceTypes: [AWMProfileType] {
        
        if AWMConfigure.fetchPType() == .flower {
            
            return [.space,userInfo,.order,.address,.favor,.space,.contactUS,.privacy,.about,.space,.feedBack,.setting]
        }
        
        return [.space,userInfo,.space,.contactUS,.privacy,.about,.space,.feedBack,.setting]
        
    }
    
    static var types: [AWMProfileType] {
        
        if AWMConfigure.fetchPType() == .flower {
            
            return [userInfo,.order,.address,.favor,.contactUS,.privacy,.about,.feedBack,.setting]
        }
        return [userInfo,.contactUS,.privacy,.about,.feedBack,.setting]
    }
    
    var cellHeight: CGFloat {
        
        switch self {
        case .space: return 10
            
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
            
        case .address: return "地址管理"
            
        case .order: return "订单管理"
            
        case .characters: return "角色信息"
            
        case .feedBack: return "意见建议"
            
        case .favor: return "我的收藏"
            
        default: return ""
            
        }
    }
}

struct AWMProfileViewModel: WLBaseViewModel {
    
    var input: WLInput
    
    var output: WLOutput
    
    struct WLInput {
        
        let modelSelect: ControlEvent<AWMProfileBean>
        
        let itemSelect: ControlEvent<IndexPath>
        
        let hasSpace: Bool
    }
    
    struct WLOutput {
        
        let zip: Observable<(AWMProfileBean,IndexPath)>
        
        let tableData: BehaviorRelay<[AWMProfileBean]> = BehaviorRelay<[AWMProfileBean]>(value: [])
        
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
        
        self.output.tableData.accept(AWMProfileBean.createProfileTypes(input.hasSpace))
    }
}

