//
//  AWMProtocolBridge.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/25.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import AWMTextInner

@objc (AWMProtocolBridge)
public final class AWMProtocolBridge: AWMBaseBridge {
    
    public var viewModel: AWMProtocolViewModel!
}

extension AWMProtocolBridge {
    
    @objc public func createProtocol(_ vc: AWMTextInnerViewController) {
        
        let inputs = AWMProtocolViewModel.WLInput()
        
        viewModel = AWMProtocolViewModel(inputs)
        
        viewModel
            .output
            .contented
            .asObservable()
            .subscribe(onNext: {(value) in
                
                DispatchQueue.main.async {
                    
                    vc.awmLoadHtmlString(htmlString: value)
                }
                
            })
            .disposed(by: disposed)
    }
}
