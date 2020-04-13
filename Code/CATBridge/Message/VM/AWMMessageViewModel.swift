//
//  AWMMessageViewModel.swift
//  AWMBridge
//
//  Created by 王磊 on 2020/4/13.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import WLBaseViewModel
import RxCocoa
import RxSwift
import WLReqKit
import WLBaseResult
import AWMApi
import AWMBean
import AWMRReq

struct AWMMessageViewModel: WLBaseViewModel {
    
    var input: WLInput
    
    var output: WLOutput
    
    struct WLInput {
        
        let modelSelect: ControlEvent<AWMAddressBean>
        
        let itemSelect: ControlEvent<IndexPath>
        
        let headerRefresh: Driver<Void>
        
        let itemAccessoryButtonTapped: Driver<IndexPath>
        
        let addItemTaps: Signal<Void>
    }
    
    struct WLOutput {
        
        let zip: Observable<(AWMAddressBean,IndexPath)>
        
        let tableData: BehaviorRelay<[AWMAddressBean]> = BehaviorRelay<[AWMAddressBean]>(value: [])
        
        let endHeaderRefreshing: Driver<WLBaseResult>
        
        let addItemed: Driver<Void>
        
        let itemAccessoryButtonTapped: Driver<IndexPath>
    }
    init(_ input: WLInput ,disposed: DisposeBag) {
        
        self.input = input
        
        let zip = Observable.zip(input.modelSelect,input.itemSelect)
        
        let headerRefreshData = input
            .headerRefresh
            .startWith(())
            .flatMapLatest({_ in
                return awmArrayResp(AWMApi.fetchAddress)
                    .mapArray(type: AWMAddressBean.self)
                    .map({ return $0.count > 0 ? WLBaseResult.fetchList($0) : WLBaseResult.empty })
                    .asDriver(onErrorRecover: { return Driver.just(WLBaseResult.failed(($0 as! WLBaseError).description.0)) })
            })
        
        let itemAccessoryButtonTapped: Driver<IndexPath> = input.itemAccessoryButtonTapped.map { $0 }
        
        let endHeaderRefreshing = headerRefreshData.map { $0 }
        
        let addItemed: Driver<Void> = input.addItemTaps.flatMap { Driver.just($0) }
        
        let output = WLOutput(zip: zip, endHeaderRefreshing: endHeaderRefreshing, addItemed: addItemed, itemAccessoryButtonTapped: itemAccessoryButtonTapped)
        
        headerRefreshData
            .drive(onNext: { (result) in
                
                switch result {
                case let .fetchList(items):
                    
                    output.tableData.accept(items as! [AWMAddressBean])
                    
                default: break
                }
            })
            .disposed(by: disposed)
        
        self.output = output
    }
}
extension AWMMessageViewModel {
    
    static func removeAddress(_ encode: String) -> Driver<WLBaseResult> {
        
        return awmVoidResp(AWMApi.deleteAddress(encode))
            .flatMapLatest({ return Driver.just(WLBaseResult.ok("移除成功")) })
            .asDriver(onErrorRecover: { return Driver.just(WLBaseResult.failed(($0 as! WLBaseError).description.0)) })
    }
}
