//
//  AWMAboutBridge.swift
//  AWMBridge
//
//  Created by three stone 王 on 2019/8/27.
//  Copyright © 2019 three stone 王. All rights reserved.
//

import Foundation
import AWMTable
import RxDataSources
import AWMCocoa

@objc (AWMAboutBridge)
public final class AWMAboutBridge: AWMBaseBridge {
    
    typealias Section = AWMSectionModel<(), AWMAboutType>
    
    var dataSource: RxTableViewSectionedReloadDataSource<Section>!
    
    var viewModel: AWMAboutViewModel!
}

extension AWMAboutBridge {
    
    @objc public func createAbout(_ vc: AWMTableNoLoadingViewController ,hasSpace: Bool) {
        
        let input = AWMAboutViewModel.WLInput(modelSelect: vc.tableView.rx.modelSelected(AWMAboutType.self),
                                              itemSelect: vc.tableView.rx.itemSelected,
                                              hasSpace: hasSpace)
        
        viewModel = AWMAboutViewModel(input)
        
        let dataSource = RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { ds, tv, ip, item in return vc.configTableViewCell(AWMAboutBean.createAbout(item, title: item.title, subTitle: item.subtitle), for: ip) })
        
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
            .subscribe(onNext: { (item,ip) in
                
                vc.tableView.deselectRow(at: ip, animated: true)
                
                vc.tableViewSelectData(AWMAboutBean.createAbout(item, title: item.title, subTitle: item.subtitle), for: ip)
            })
            .disposed(by: disposed)
        
        vc
            .tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposed)
    }
    
}
extension AWMAboutBridge: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let datasource = dataSource else { return 0}
        
        return datasource[indexPath].cellHeight
    }
}
