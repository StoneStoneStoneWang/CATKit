//
//  AWMAreaJson.swift
//  AWMBridge
//
//  Created by 王磊 on 2020/4/10.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation

@objc (AWMAreaJson)
public final class AWMAreaJson: AWMBaseBridge { }

extension AWMAreaJson {
    @objc (fetchAreas)
    public func fetchAreas() {
        
        AWMAreaManager
            .default
            .fetchAreas()
            .drive(onNext: { (result) in
                
                
            })
            .disposed(by: disposed)
    }
}
