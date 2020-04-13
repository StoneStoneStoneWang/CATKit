//
//  AWMCollectionSectionBridge.swift
//  AWMBridge
//
//  Created by 王磊 on 2020/3/31.
//  Copyright © 2020 王磊. All rights reserved.
//

import Foundation
import AWMCollection
import RxCocoa
import RxSwift
import RxDataSources
import AWMCocoa

public typealias AWMCollectionSectionAction = (_ item: AWMCollectionItemBean) -> ()

@objc (AWMCollectionSectionBridge)
public final class AWMCollectionSectionBridge: AWMBaseBridge {
    
    var viewModel: AWMCollectionSectionViewModel!
    
    typealias Section = AWMSectionModel<AWMCollectionSectionBean, AWMCollectionItemBean>
    
    var dataSource: RxCollectionViewSectionedReloadDataSource<Section>!
    
    var vc: AWMCollectionNoLoadingViewController!
    
}

// MARK: skip item 101 pagecontrol 102
extension AWMCollectionSectionBridge {
    
    @objc public func createCollectionSection(_ vc: AWMCollectionNoLoadingViewController ,sections: [AWMCollectionSectionBean],sectionAction: @escaping AWMCollectionSectionAction) {
        
        let input = AWMCollectionSectionViewModel.WLInput(modelSelect: vc.collectionView.rx.modelSelected(AWMCollectionItemBean.self),
                                                          itemSelect: vc.collectionView.rx.itemSelected,
                                                          sections: sections)
        
        viewModel = AWMCollectionSectionViewModel(input)
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<Section>(
            configureCell: { ds, cv, ip, item in return vc.configCollectionViewCell(item, for: ip) },
            configureSupplementaryView: { ds, cv, kind, ip in return vc.configCollectionViewHeader(self.viewModel.output.collectionData.value[ip.section], for: ip)})
        
        self.dataSource = dataSource
        
        viewModel
            .output
            .collectionData
            .map({ $0.map({ Section(model: $0, items: $0.items) }) })
            .bind(to: vc.collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposed)
        
        viewModel
            .output
            .zip
            .subscribe(onNext: { (item,ip) in

                sectionAction(item)
            })
            .disposed(by: disposed)
        
    }
    
    @objc public func fetchSingleData(_ ip: IndexPath) -> AWMCollectionItemBean! {
        
        guard let dataSource = dataSource else { return nil }
        
        return dataSource[ip]
    }
    
    @objc public func fetchCollectionDatas() -> [AWMCollectionItemBean] {
        
        guard let viewModel = viewModel else { return [] }
        
        var mutable: [AWMCollectionItemBean] = []
        
        for item in viewModel.output.collectionData.value {
            
            mutable += item.items
        }
        
        return mutable
    }
}
