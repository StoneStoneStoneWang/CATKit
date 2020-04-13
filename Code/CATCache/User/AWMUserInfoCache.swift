//
//  AWMUserInfoCache.swift
//  ZUserKit
//
//  Created by three stone 王 on 2019/3/15.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import AWMBean
import AWMYY

@objc (AWMUserInfoCache)
public final class AWMUserInfoCache: NSObject {
    @objc (shared)
    public static let `default`: AWMUserInfoCache = AWMUserInfoCache()
    
    private override init() {
        
        if let info = Bundle.main.infoDictionary {
            
            AWMYY.shared().createCache(info["CFBundleDisplayName"] as? String ?? "AWMUserInfoCache" )
        }
    }
    @objc (userBean)
    public dynamic var userBean: AWMUserBean = AWMUserBean()
}

extension AWMUserInfoCache {
    
    public func saveUser(data: AWMUserBean) -> AWMUserBean {
        
        if AWMAccountCache.default.uid != "" {
            
            AWMYY.shared().saveObj(data, withKey: "user_" + AWMAccountCache.default.uid)
            
            userBean = data
        }
        
        return data
    }
    
    public func queryUser() -> AWMUserBean  {
        
        if AWMAccountCache.default.uid != "" {
            
            if let user = AWMYY.shared().fetchObj("user_" + AWMAccountCache.default.uid) {
                
                userBean = user as! AWMUserBean
                
                return userBean
            }
        }
    
        return AWMUserBean()
    }
}
