//
//  AWMTableSectionBridge.swift
//  AWMBridge
//
//  Created by 王磊 on 2020/3/31.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import AWMTable
import RxCocoa
import RxSwift
import RxDataSources
import AWMCocoa

public typealias AWMTableSectionAction = (_ item: AWMTableRowBean ,_ ip: IndexPath) -> ()

@objc (AWMTableSectionBridge)
public final class AWMTableSectionBridge: AWMBaseBridge {
    
    var viewModel: AWMTableSectionViewModel!
    
    typealias Section = AWMSectionModel<AWMTableSectionBean, AWMTableRowBean>
    
    var dataSource: RxTableViewSectionedReloadDataSource<Section>!
    
    var vc: AWMTableNoLoadingViewController!
    
}

extension AWMTableSectionBridge {
    
    @objc public func createTableSection(_ vc: AWMTableNoLoadingViewController ,sections: [AWMTableSectionBean],sectionAction: @escaping AWMTableSectionAction ) {
        
        self.vc = vc
        
        let input = AWMTableSectionViewModel.WLInput(modelSelect: vc.tableView.rx.modelSelected(AWMTableRowBean.self),
                                                     itemSelect: vc.tableView.rx.itemSelected,
                                                     sections: sections)
        
        viewModel = AWMTableSectionViewModel(input)
        
        let dataSource = RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { ds, tv, ip, item in return vc.configTableViewCell(item, for: ip) },
            titleForHeaderInSection: { ds ,section in return self.viewModel.output.tableData.value[section].title})
        
        self.dataSource = dataSource
        
        viewModel
            .output
            .tableData
            .map({ $0.map({ Section(model: $0, items: $0.items) }) })
            .bind(to: vc.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposed)
        
        viewModel
            .output
            .zip
            .subscribe(onNext: { (item,ip) in
                
                sectionAction(item, ip)
            })
            .disposed(by: disposed)
        
        vc.tableView.rx.setDelegate(self).disposed(by: disposed)
        
    }
}
extension AWMTableSectionBridge: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let dataSource = dataSource else { return 0}
        
        return vc.caculate(forCell: dataSource[indexPath], for: indexPath)
    }
}
