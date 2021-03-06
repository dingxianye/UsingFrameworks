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
        
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
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
    
    // FIXME: 这里tableView有个self-sizing的疑似bug，detailTextLabel多行显示的时候，height会计算少（http://stackoverflow.com/questions/28931295/self-sizing-dynamic-height-cells-in-ios-8-possible-without-custom-uitablevie），所以我还是得自行计算一下高度
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionInfo = sectionInfos[indexPath.section]
        let cellInfo = sectionInfo.cellInfos[indexPath.row]
        
        var cell: UITableViewCell!
        if let _ = cellInfo.detailText {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell-subtitle")
            if let _ = cell {
            } else {
                cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell-subtitle")
                cell.detailTextLabel?.textColor = UIColor.gray
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell-default")
            if let _ = cell {
            } else {
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell-default")
            }
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        
        if let _ = cellInfo.titleText {
            cell.textLabel?.text = cellInfo.titleText
        } else if let _ = cellInfo.titleAttributedText {
            cell.textLabel?.attributedText = cellInfo.titleAttributedText
        }
        
        if let _ = cellInfo.detailText {
            cell.detailTextLabel?.text = cellInfo.detailText
        }
        
        cell.accessoryType = .none
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if cellInfo.selectedBlock != nil {
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = UITableViewCellSelectionStyle.default
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
