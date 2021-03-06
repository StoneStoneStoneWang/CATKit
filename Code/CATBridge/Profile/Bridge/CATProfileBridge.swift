//
//  CATProfileBridge.swift
//  CATBridge
//
//  Created by three stone 王 on 2019/8/27.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import CATTable
import RxDataSources
import CATCocoa
import CATCache
import RxCocoa
import RxSwift
import CATBean
import RxGesture

@objc(CATProfileActionType)
public enum CATProfileActionType: Int ,Codable {
    
    case header
    
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
    
    case unLogin
    
    case feedBack
    
    case favor
}

public typealias CATProfileAction = (_ action: CATProfileActionType ) -> ()

private var key: Void?

extension CATTableHeaderView {
    
    @objc public var user: CATUserBean? {
        get {
            return objc_getAssociatedObject(self, &key) as? CATUserBean
        }
        set{
            objc_setAssociatedObject(self, &key,newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension Reactive where Base: CATTableHeaderView {
    
    var user: Binder<CATUserBean?> {
        
        return Binder(base) { view, user in
            
            view.user = user
        }
    }
}

@objc (CATProfileBridge)
public final class CATProfileBridge: CATBaseBridge {
    
    typealias Section = CATSectionModel<(), CATProfileBean>
    
    var dataSource: RxTableViewSectionedReloadDataSource<Section>!
    
    var viewModel: CATProfileViewModel!
    
    weak var vc: CATTableNoLoadingViewController!
}

extension CATProfileBridge {
    
    @objc public func createProfile(_ vc: CATTableNoLoadingViewController,hasSpace: Bool,profileAction:@escaping CATProfileAction) {
        
        let input = CATProfileViewModel.WLInput(modelSelect: vc.tableView.rx.modelSelected(CATProfileBean.self),
                                              itemSelect: vc.tableView.rx.itemSelected,
                                              hasSpace: hasSpace)
        
        viewModel = CATProfileViewModel(input, disposed: disposed)
        
        let dataSource = RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { ds, tv, ip, item in return vc.configTableViewCell(item, for: ip)  })
        
        viewModel
            .output
            .tableData
            .asDriver()
            .map({ [Section(model: (), items: $0)]  })
            .drive(vc.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposed)
        
        self.dataSource = dataSource
        
        viewModel
            .output
            .userInfo
            .bind(to: vc.headerView.rx.user)
            .disposed(by: disposed)
        
        viewModel
            .output
            .zip
            .subscribe(onNext: {(type,ip) in
                
                vc.tableView.deselectRow(at: ip, animated: true)
                
                let isLogin = CATAccountCache.default.isLogin()
                
                switch type.type {
                case .setting: profileAction(.setting)
                    
                case .privacy: profileAction(.privacy)
                case .about: profileAction(.about)
                    
                case .userInfo: profileAction(isLogin ? .userInfo : .unLogin)
                case .address: profileAction(isLogin ? .address : .unLogin)
                case .order: profileAction(isLogin ? .order : .unLogin)
                case .focus: profileAction(isLogin ? .focus : .unLogin)
                case .characters: profileAction(isLogin ? .characters : .unLogin)
                case .myCircle: profileAction(isLogin ? .myCircle : .unLogin)
                case .feedBack: profileAction(.feedBack)
                case .favor: profileAction(isLogin ? .favor : .unLogin)
                case .contactUS:
                    
                    vc.tableViewSelectData(type, for: ip)
                    
                default:
                    break
                }
            })
            .disposed(by: disposed)
        vc
            .tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposed)
        
        vc
            .headerView
            .rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { (_) in
                
                let isLogin = CATAccountCache.default.isLogin()
                
                profileAction(isLogin ? .header : .unLogin)
            
            })
            .disposed(by: disposed)
    }
}

extension CATProfileBridge: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let datasource = dataSource else { return 0}
        
        return datasource[indexPath].type.cellHeight
    }
}
