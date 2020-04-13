//
//  AWMAreaBridge.swift
//  ZBridge
//
//  Created by three stone 王 on 2020/3/13.
//  Copyright © 2020 three stone 王. All rights reserved.
//

import Foundation
import AWMCocoa
import RxDataSources
import AWMTable
import AWMBean

@objc (AWMAreaType)
public enum AWMAreaType: Int {
    
    case province
    
    case city
    
    case region
}

public typealias AWMAreaAction = (_ selectedArea: AWMAreaBean ,_ type: AWMAreaType ,_ hasNext: Bool) -> ()

@objc (AWMAreaBridge)
public final class AWMAreaBridge: AWMBaseBridge {
    
    var viewModel: AWMAreaViewModel!
    
    typealias Section = AWMSectionModel<(), AWMAreaBean>
    
    var dataSource: RxTableViewSectionedReloadDataSource<Section>!
    
    var type: AWMAreaType = .province
    
    var areas: [AWMAreaBean] = []
    
    var selectedArea: AWMAreaBean!
}

extension AWMAreaBridge {
    
    @objc public func createArea(_ vc: AWMTableNoLoadingViewController ,type: AWMAreaType,areaAction: @escaping AWMAreaAction) {
        
        self.type = type
        
        let input = AWMAreaViewModel.WLInput(areas: areas,
                                             modelSelect: vc.tableView.rx.modelSelected(AWMAreaBean.self),
                                             itemSelect: vc.tableView.rx.itemSelected)
        
        viewModel = AWMAreaViewModel(input, disposed: disposed)
        
        let dataSource = RxTableViewSectionedReloadDataSource<Section>(
            configureCell: { ds, tv, ip, item in return vc.configTableViewCell(item, for: ip)})
        
        self.dataSource = dataSource
        
        viewModel
            .output
            .tableData
            .asDriver()
            .map({ [Section(model: (), items: $0)]  })
            .drive(vc.tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposed)
        
        viewModel
            .output
            .zip
            .subscribe(onNext: { [unowned self](area,ip) in
                
                vc.tableView.deselectRow(at: ip, animated: true)
                
                let values = self.viewModel.output.tableData.value
                
                _ = values.map({ $0.isSelected = false })
                
                area.isSelected = true
                
                self.viewModel.output.tableData.accept(values)
                
                switch type {
                case .province: fallthrough
                case .region:
                    areaAction(area,type, true)
                case .city:
                    
                    areaAction(area,type, self.fetchRegions(area.areaId).count > 0)
                default:
                    break;
                }
            })
            .disposed(by: disposed)
        vc
            .tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposed)
        
        AWMAreaManager
            .default
            .fetchAreas()
            .drive(onNext: { [unowned self ](result) in
                
                switch result {
                case .fetchList(let list):
                    
                    var mutable: [AWMAreaBean] = []
                    
                    switch type {
                    case .province:
                        
                        mutable += self.fetchProvices(list as! [AWMAreaBean])
                    case .city:
                        
                        //                        mutable += self.fetchCitys(<#T##id: Int##Int#>)
                        break
                    case .region:
                        break
                        
                    }
                    
                    self.viewModel.output.tableData.accept(mutable)
                default:
                    break
                }
            })
            .disposed(by: disposed)
    }
    
    @objc public func fetchAreas() {
        
        AWMAreaManager
            .default
            .fetchAreas()
            .drive(onNext: { (result) in
                
                
            })
            .disposed(by: disposed)
    }
    
    @objc public func updateDatas(_ id: Int ,areas: [AWMAreaBean]) {
        
        switch type {
        case .city:
            
            self.viewModel.output.tableData.accept(self.fetchCitys(id))
            
        case .region:
            
            self.viewModel.output.tableData.accept(self.fetchRegions(id))
        case .province:
            
            self.viewModel.output.tableData.accept(self.fetchProvices(areas))
        }
    }
    @objc public func fetchProvice(pName: String) -> AWMAreaBean {
        
        let values = self.viewModel.output.tableData.value
        
        let idx = values.firstIndex(where: {  $0.name == pName })!
        
        return values[idx]
        
    }
    
    @objc public func fetchArea(id: Int) -> AWMAreaBean {
        
        return AWMAreaManager.default.fetchSomeArea(id)
        
    }
    @objc public func fetchIp(id: Int) -> IndexPath {
        
        let values = self.viewModel.output.tableData.value
        
        let idx = values.firstIndex(where: {  $0.areaId == id })!
        
        return IndexPath(row: idx, section: 0)
    }
    @objc public func fetchProvices(_ areas: [AWMAreaBean]) -> [AWMAreaBean] {
        
        var result: [AWMAreaBean] = []
        
        for item in areas {
            
            if item.arealevel == 1 {
                
                result += [item]
            }
        }
        return result
    }
    
    @objc public func fetchCitys(_ id: Int) -> [AWMAreaBean] {
        
        var result: [AWMAreaBean] = []
        
        for item in AWMAreaManager.default.allAreas {
            
            if item.arealevel == 2 {
                
                if item.pid == id {
                    
                    result += [item]
                }
            }
        }
        return result
    }
    
    @objc public func fetchRegions(_ id: Int) -> [AWMAreaBean] {
        
        var result: [AWMAreaBean] = []
        
        for item in AWMAreaManager.default.allAreas {
            
            if item.arealevel == 3 {
                
                if item.pid == id {
                    
                    result += [item]
                }
            }
        }
        return result
    }
}

extension AWMAreaBridge: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
}
