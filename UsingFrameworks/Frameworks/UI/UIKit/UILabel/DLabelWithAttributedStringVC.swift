//
//  DLabelWithAttributedStringVC.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DLabelWithAttributedStringVC: UIViewController {
    
    var tableView: DXSimpleTableView!
    var dataSource: Array<DXSimpleTableViewSectionInfo>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        setupDataSource()
        
        tableView = DXSimpleTableView.init(frame: self.view.bounds, style: UITableViewStyle.plain, sectionInfos: dataSource)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(tableView)
    }
    
    
    // MARK: attributedString demos
    
    func fontAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 20), text: "YES, "))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 16), text: "就要和外面那些"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.boldSystemFont(ofSize: 22), text: "妖艳贱货"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 26), text: "看起来"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 30), text: "不一样！！！"))  // FIXME: italic Chinese
        
        return mutAttributedString.copy() as! NSAttributedString
    }
    
//    NSForegroundColorAttributeName: UIColor.black,
//    NSBackgroundColorAttributeName: UIColor.yellow,
//    NSStrokeColorAttributeName: UIColor.orange,
//    NSStrokeWidthAttributeName: Float(1),
    
    
    // MARK: util to construct NSAttributedString
    
    func attributedString(attributeName: String!, attributeValue: Any!, text: String!) -> NSAttributedString! {
        let attributes = [ attributeName: attributeValue ]
        return NSAttributedString.init(string: text, attributes: attributes)
    }
    
    
    // MARK: table view data source
    
    func setupDataSource() {
        dataSource = [
            DXSimpleTableViewSectionInfo.init(clazzTitle: nil, cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.fontAttributeNameAttributedString(), detailText: "NSFontAttributeName visual effect")
            ])
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
