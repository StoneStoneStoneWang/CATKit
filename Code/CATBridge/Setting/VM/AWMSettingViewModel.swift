//
//  AWMSettingViewModel.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/26.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import WLBaseViewModel
import RxCocoa
import RxSwift
import AWMCache
import AWMSign

@objc public final class AWMSettingBean: NSObject {
    
    @objc public var type: AWMSettingType = .space
    
    @objc public var title: String = ""
    
    @objc public var subTitle: String = ""
    
    @objc public static func createSetting(_ type: AWMSettingType ,title: String ,sub: String) -> AWMSettingBean {
        
        let setting = AWMSettingBean()
        
        setting.type = type
        
        setting.title = title
        
        setting.subTitle = sub
        
        return setting
    }
    
    static func createTabledata(_ hasspace: Bool ) -> [AWMSettingBean] {
        
        var result: [AWMSettingBean] = []
        
        if hasspace {
            
            for item in AWMSettingType.spaceTypes {
                
                result += [AWMSettingBean.createSetting(item, title: item.title, sub: "")]
            }
            
        } else {
            
            for item in AWMSettingType.types {
                
                result += [AWMSettingBean.createSetting(item, title: item.title, sub: "")]
            }
        }
        
        return result
    }
    private override init() { }
}

@objc (AWMSettingType)
public enum AWMSettingType: Int {
    
    case pwd  = 0 // 未登录
    
    case password = 1// 已登录
    
    case logout = 2
    
    case clear = 3
    
    case push = 4
    
    case space = 5
    
    case black = 6
}

extension AWMSettingType {
    
    static var spaceTypes: [AWMSettingType] {
        
        if AWMAccountCache.default.isLogin() {
            
            if AWMConfigure.fetchPType() == .flower {
                
                return [.space,.password,.space,.clear,.push,.space,.logout]
            }
        }
        return [.space,.pwd,.space,.clear,.push]
    }
    static var types: [AWMSettingType] {
        
        if AWMAccountCache.default.isLogin() {
            
            if AWMConfigure.fetchPType() == .flower {
                
                return [.password,.black,.clear,.push,.logout]
            }
        }
        
        return [.pwd,.clear,.push]
    }
    
    
    public var title: String {
        
        switch self {
            
        case .pwd: return "忘记密码"
            
        case .password: return "修改密码"
            
        case .logout: return "退出登录"
            
        case .clear: return "清理缓存"
            
        case .push: return "推送设置"
            
        case .black: return "黑名单"
            
        default: return ""
            
        }
    }
    
    var cellHeight: CGFloat {
        
        switch self {
        case .space: return 10
            
        default: return 55
        }
    }
}

public struct AWMSettingViewModel: WLBaseViewModel {
    
    public var input: WLInput
    
    public var output: WLOutput
    
    public struct WLInput {
        
        let modelSelect: ControlEvent<AWMSettingBean>
        
        let itemSelect: ControlEvent<IndexPath>
        
        let hasSpace: Bool
    }
    public struct WLOutput {
        
        let zip: Observable<(AWMSettingBean,IndexPath)>
        
        let tableData: BehaviorRelay<[AWMSettingBean]> = BehaviorRelay<[AWMSettingBean]>(value: [])
    }
    
    init(_ input: WLInput) {
        
        self.input = input
        
        let zip = Observable.zip(input.modelSelect,input.itemSelect)
        
        self.output = WLOutput(zip: zip)
        
        self.output.tableData.accept(AWMSettingBean.createTabledata(input.hasSpace))
    }
}

