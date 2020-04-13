//
//  AWMAreaHeaderBridge.swift
//  ZBombBridge
//
//  Created by three stone 王 on 2020/3/19.
//  Copyright © 2020 three stone 王. All rights reserved.
//

import Foundation
import AWMCollection
import RxCocoa
import RxSwift
import RxDataSources
import AWMCocoa


@objc (AWMAreaHeaderBridge)
public final class AWMAreaHeaderBridge: AWMBaseBridge {
    
    var viewModel: AWMAreaHeaderViewModel!
    
    typealias Section = AWMSectionModel<(), AWMAreaHeaderBean>
    
    var dataSource: RxCollectionViewSectionedReloadDataSource<Section>!
}
// MARK: skip item 101 pagecontrol 102
extension AWMAreaHeaderBridge {
    
    @objc public func createAreaHeader(_ vc: AWMCollectionNoLoadingViewController) {
        
        let input = AWMAreaHeaderViewModel.WLInput(modelSelect: vc.collectionView.rx.modelSelected(AWMAreaHeaderBean.self),
                                                 itemSelect: vc.collectionView.rx.itemSelected)
        
        viewModel = AWMAreaHeaderViewModel(input, disposed: disposed)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<Section>(
            configureCell: { ds, cv, ip, item in return vc.configCollectionViewCell(item, for: ip) })
        
        self.dataSource = dataSource
        
        viewModel
            .output
            .tableData
            .asObservable()
            .map({ [Section(model: (), items: $0)] })
            .bind(to: vc.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposed)
        
        viewModel
            .output
            .zip
            .subscribe(onNext: { (area,ip) in
                
                vc.collectionView.deselectItem(at: ip, animated: true)
                
                vc.collectionViewSelectData(area, for: ip)
            })
            .disposed(by: disposed)
    }
    
    @objc public func addheader(_ header: AWMAreaHeaderBean) {
        
        var values = viewModel.output.tableData.value
        
        values += [header]
        
        viewModel.output.tableData.accept(values)
    }
    
    @objc public func fetchHeaderCount() -> Int {
        
        return viewModel.output.tableData.value.count
    }
    @objc public func removeHeader(_ header: AWMAreaHeaderBean) {
        
        var values = viewModel.output.tableData.value
        
        if let idx = values.firstIndex(where: {  $0 == header }) {
            values.remove(at: idx)
        }
        viewModel.output.tableData.accept(values)
    }
}
