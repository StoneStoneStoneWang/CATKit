//
//  AWMAreaManager.swift
//  ZBombBridge
//
//  Created by three stone 王 on 2020/3/19.
//  Copyright © 2020 three stone 王. All rights reserved.
//

import Foundation
import AWMBean
import AWMYY
import RxCocoa
import WLBaseResult
import RxSwift
import AWMReq
import WLReqKit
import AWMApi
import Alamofire
import AWMRReq

@objc (AWMAreaManager)
public class AWMAreaManager: NSObject {
    
    @objc (shared)
    public static let `default`: AWMAreaManager = AWMAreaManager()
    
    private override init() { }
    // 全部地区
    @objc public var allAreas: [AWMAreaBean] = []
}

extension AWMAreaManager {
    
      public func fetchAreas() -> Driver<WLBaseResult> {
        
        if allAreas.count > 0 {
            
            return Driver.just(WLBaseResult.fetchList(allAreas))
        } else {
            
            if isAreaFileExist() {
                
                let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
                
                let targetPath = cachePath + "/Areas"
                
                if let arr = NSArray(contentsOfFile: targetPath) {
                    
                    var mutable: [AWMAreaBean] = []
                    
                    for item in arr {
                        
                        mutable += [AWMAreaBean(JSON: item as! [String: Any])!]
                    }
                    
                    allAreas += mutable
                    
                    return Driver.just(WLBaseResult.fetchList(mutable))
                }
                
                return Driver.just(WLBaseResult.failed("获取本地数据失败!"))
            } else {
                
                return awmAreaResp(AWMApi.fetchAreaJson)
                    .map({ AWMAreaManager.default.saveArea($0) })
                    .map({ _ in WLBaseResult.fetchList(AWMAreaManager.default.allAreas)  })
                    .asDriver(onErrorRecover: { return Driver.just(WLBaseResult.failed(($0 as! WLBaseError).description.0)) })
            }
        }
    }
    
   @objc public func fetchSomeArea(_ id: Int)  -> AWMAreaBean {
        
        assert(allAreas.count > 0, "请先调用 fetchArea")
        
        var result: AWMAreaBean!
        
        for item in allAreas {
            
            if item.areaId == id {
                
                result = item
                
                break
            }
        }
        
        return result ?? AWMAreaBean()
    }
    
   @objc public func saveArea(_ areas: [Any]) -> [Any] {
        
        for item in areas {
            
            allAreas += [AWMAreaBean(JSON: item as! [String: Any])!]
        }
        
        let mutable = NSMutableArray()
        
        mutable.addObjects(from: areas)
        
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
        
        let targetPath = cachePath + "/Areas"
        
        mutable.write(toFile: targetPath, atomically: true)
        
        return areas
    }
    
    public func isAreaFileExist() -> Bool {
        
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
        
        let targetPath = cachePath + "/Areas"
        
        return FileManager.default.fileExists(atPath: targetPath)
    }
}
