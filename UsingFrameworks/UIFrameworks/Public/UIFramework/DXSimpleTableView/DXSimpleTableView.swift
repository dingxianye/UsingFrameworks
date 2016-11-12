//
//  DXSimpleTableView.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

// This is a very simple data driven TableView
// You can get a powerfull data driven TableView from https://github.com/caoping/CPDataDrivenLayout

class DXSimpleTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var sectionInfos: Array<DXSimpleTableViewSectionInfo>!
    
    
    init(frame: CGRect, style: UITableViewStyle, sectionInfos: Array<DXSimpleTableViewSectionInfo>!) {
        
        super.init(frame: frame, style: style)
        
        self.sectionInfos = sectionInfos
        self.delegate = self
        self.dataSource = self
        
        self.rowHeight = 44;
        self.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - TableView Delegate & DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionInfos.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = sectionInfos[section]
        return sectionInfo.cellInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionInfo = sectionInfos[indexPath.section]
        let cellInfo = sectionInfo.cellInfos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cellInfo.titleText
        cell.detailTextLabel?.text = cellInfo.detailText
        cell.accessoryType = .none
        if cellInfo.selectedBlock != nil {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = sectionInfos[section]
        return sectionInfo.clazzTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section < sectionInfos.count {
        
            let sectionInfo = sectionInfos[indexPath.section]
            
            if indexPath.row < sectionInfo.cellInfos.count {
            
                let cellInfo = sectionInfo.cellInfos[indexPath.row]
                
                if cellInfo.selectedBlock != nil {
                    cellInfo.selectedBlock!()
                }
                
            }
        }
    }

}
