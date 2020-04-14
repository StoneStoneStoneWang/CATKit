//
//  CATMessageBean.swift
//  CATBean
//
//  Created by 王磊 on 2020/4/14.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import ObjectMapper
import RxDataSources

@objc (CATMessageBean)
public final class CATMessageBean: NSObject,Mappable,IdentifiableType {
    
    public var identity: String = ""
    
    public typealias Identity = String
    
    required public init?(map: Map) { }
    
    @objc public override init() { }
    
    public func mapping(map: Map) {
        
        intime  <- map["intime"]
        
        encoded  <- map["encoded"]
        
        identity  <- map["encoded"]
        
        dect  <- map["dect"]
        
        isread  <- map["isread"]
        
        usEncoded  <- map["usEncoded"]
        
        mid  <- map["id"]
    }
    
    @objc public var intime: Int = Int.max
    
    @objc public var dect: String = ""
    
    @objc public var encoded: String = ""

    @objc public var isread: Bool = false
    
    @objc public var usEncoded: String = ""
    
    @objc public var mid: Int = 0
}

