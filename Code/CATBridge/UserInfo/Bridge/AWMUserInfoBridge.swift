//
//  AWMUserInfoBridge.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/28.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import AWMTable
import AWMHud
import AWMBean
import RxCocoa
import AWMCache
import RxSwift
import RxDataSources
import AWMCocoa
import AWMRReq
import AWMUpload

public typealias AWMUserInfoAction = () -> ()

@objc (AWMUserInfoBridge)
public final class AWMUserInfoBridge: AWMBaseBridge {
    
    typealias Section = AWMSectionModel<(), AWMUserInfoBean>
    
    var dataSource: RxTableViewSectionedReloadDataSource<Section>!
    
    var viewModel: AWMUserInfoViewModel!
    
    weak var vc: AWMTableNoLoadingViewController!
}

extension AWMUserInfoBridge {
    
    @objc public func createUserInfo(_ vc: AWMTableNoLoadingViewController ,hasSpace: Bool) {
        
        self.vc = vc
        
        let input = AWMUserInfoViewModel.WLInput(modelSelect: vc.tableView.rx.modelSelected(AWMUserInfoBean.self),
                                                 itemSelect: vc.tableView.rx.itemSelected,
                                                 hasSpace: hasSpace)
        
        viewModel = AWMUserInfoViewModel(input, disposed: disposed)
        
        let dataSource = RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { ds, tv, ip, item in return vc.configTableViewCell(item, for: ip)})
        
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
            .zip
            .subscribe(onNext: { (type,ip) in
                
                vc.tableView.deselectRow(at: ip, animated: true)
                
                vc.tableViewSelectData(type, for: ip)
            })
            .disposed(by: disposed)
        vc
            .tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposed)
    }
    
    @objc public func updateUserInfo(_ type: AWMUserInfoType,value: String ) {
        
        let values =  viewModel.output.tableData.value
        
        if let idx = values.firstIndex(where: { $0.type == type}) {
            
            self.vc.tableView.reloadRows(at: [IndexPath(row: idx, section: 0)], with: .fade)
        }
    }
    
    @objc public func updateUserInfo(type: AWMUserInfoType,value: String,action: @escaping AWMUserInfoAction) {
        
        AWMHud.show(withStatus: "修改\(type.title)中...")
        
        AWMUserInfoViewModel
            .updateUserInfo(type: type, value: value)
            .drive(onNext: { (result) in
                
                AWMHud.pop()
                switch result {
                    
                case .ok(_):
                    
                    action()
                    
                    AWMHud.showInfo(type == .header ? "上传头像成功" : "修改\(type.title)成功")
                    
                case .failed(let msg): AWMHud.showInfo(msg)
                default: break
                }
            })
            .disposed(by: disposed)
    }
    @objc public func updateHeader(_ data: Data ,action: @escaping AWMUserInfoAction) {
        
        AWMHud.show(withStatus: "上传头像中...")
        
        AWMUserInfoViewModel
            .fetchAliToken()
            .drive(onNext: { (result) in
                
                switch result {
                case .fetchSomeObject(let obj):
                    
                    DispatchQueue.global().async {
                        
                        awmUploadImgResp(data, file: "headerImg", param: obj as! AWMALCredentialsBean)
                            .subscribe(onNext: { [weak self] (value) in
                                
                                guard let `self` = self else { return }
                                
                                DispatchQueue.main.async {
                                    
                                    self.updateUserInfo(type: AWMUserInfoType.header, value: value, action: action)
                                }
                                
                                }, onError: { (error) in
                                    
                                    AWMHud.pop()
                                    
                                    AWMHud.showInfo("上传头像失败")
                            })
                            .disposed(by: self.disposed)
                    }
                    
                case let .failed(msg):
                    
                    AWMHud.pop()
                    
                    AWMHud.showInfo(msg)
                    
                default: break
                    
                }
            })
            .disposed(by: disposed)
    }
}
extension AWMUserInfoBridge: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let datasource = dataSource else { return 0}
        
        return datasource[indexPath].type.cellHeight
    }
}
