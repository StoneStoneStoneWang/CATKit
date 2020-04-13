//
//  AWMAreaHeaderViewModel.swift
//  ZBombBridge
//
//  Created by three stone 王 on 2020/3/19.
//  Copyright © 2020 three stone 王. All rights reserved.
//

import Foundation
import WLBaseViewModel
import RxCocoa
import RxSwift
import AWMBean

@objc (AWMAreaHeaderBean)
public class AWMAreaHeaderBean: NSObject {
    
    @objc public var isSelected: Bool = false
    
    @objc public var areaBean: AWMAreaBean!
}


struct AWMAreaHeaderViewModel: WLBaseViewModel {
    
    var input: WLInput
    
    var output: WLOutput
    
    struct WLInput {
        
        let modelSelect: ControlEvent<AWMAreaHeaderBean>
        
        let itemSelect: ControlEvent<IndexPath>
    }
    
    struct WLOutput {
        
        let zip: Observable<(AWMAreaHeaderBean,IndexPath)>
        
        let tableData: BehaviorRelay<[AWMAreaHeaderBean]> = BehaviorRelay<[AWMAreaHeaderBean]>(value: [])
    }
    init(_ input: WLInput ,disposed: DisposeBag) {
        
        self.input = input
        
        let zip = Observable.zip(input.modelSelect,input.itemSelect)
        
        let output = WLOutput(zip: zip)
        
        self.output = output
    }
}
