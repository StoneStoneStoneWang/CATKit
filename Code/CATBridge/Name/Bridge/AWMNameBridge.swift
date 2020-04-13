//
//  AWMNameBridge.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/28.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import AWMBase
import AWMHud
import AWMBean
import RxCocoa
import AWMCache
import RxSwift

@objc(AWMNameActionType)
public enum AWMNameActionType: Int ,Codable {
    
    case name = 0
    
    case back = 1
}

public typealias AWMNameAction = (_ action: AWMNameActionType ) -> ()

@objc (AWMNameBridge)
public final class AWMNameBridge: AWMBaseBridge {
    
    var viewModel: AWMNameViewModel!
    
    let nickname: BehaviorRelay<String> = BehaviorRelay<String>(value: AWMUserInfoCache.default.userBean.nickname)
}

extension AWMNameBridge {
    
    @objc public func createName(_ vc: AWMBaseViewController ,nameAction: @escaping AWMNameAction ) {
        
        if let completeItem = vc.navigationItem.rightBarButtonItem?.customView as? UIButton ,let name = vc.view.viewWithTag(201) as? UITextField ,let backItem = vc.navigationItem.leftBarButtonItem?.customView as? UIButton{
            
            let inputs = AWMNameViewModel.WLInput(orignal: nickname.asDriver(),
                                                       updated: name.rx.text.orEmpty.asDriver(),
                                                       completTaps: completeItem.rx.tap.asSignal())
            
            name.text = nickname.value
            
            viewModel = AWMNameViewModel(inputs)
            
            viewModel
                .output
                .completeEnabled
                .drive(completeItem.rx.isEnabled)
                .disposed(by: disposed)
            
            viewModel
                .output
                .completing
                .drive(onNext: { (_) in
                    
                    name.resignFirstResponder()
                    
                    AWMHud.show(withStatus: "修改昵称中...")
                })
                .disposed(by: disposed)
            
            viewModel
                .output
                .completed
                .drive(onNext: { (result) in
                    
                    AWMHud.pop()
                    
                    switch result {
                    case let .updateUserInfoSucc(_, msg: msg):
                        
                        AWMHud.showInfo(msg)
                        
                        nameAction(.name)
                        
                    case let .failed(msg):
                        
                        AWMHud.showInfo(msg)
                    default: break
                        
                    }
                })
                .disposed(by: disposed)
            
            backItem
                .rx
                .tap
                .subscribe(onNext: { (_) in
                    
                    nameAction(.back)
                })
                .disposed(by: disposed)
        }
    }
}
