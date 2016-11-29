//
//  DUIKitViewController.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/13.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DUIKitViewController: UIViewController {

    var tableView: DXSimpleTableView!
    var contentInfos: Array<DXSimpleTableViewSectionInfo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupData()
        
        tableView = DXSimpleTableView.init(frame: self.view.bounds, style: .grouped, sectionInfos: contentInfos)
        tableView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        self.view.addSubview(tableView)
    }
    
    
    // MARK: Content Source
    
    func setupData() {
        contentInfos = [
            
            DXSimpleTableViewSectionInfo.init(
                clazzTitle: "UILabel",
                cellInfos: [
                    DXSimpleTableViewCellInfo.init(titleText: "Attributed String", selectedBlock: {
                        [weak self] ()->() in
                        let vc = DLabelWithAttributedStringVC.init()
                        vc.title = "Attributed String"
                        self?.pushViewCtl(viewCtl: vc)
                    }),
                    ]
            ),
            
            DXSimpleTableViewSectionInfo.init(
                clazzTitle: "UITextView",
                cellInfos: [
                    DXSimpleTableViewCellInfo.init(titleText: "Rich Text View", selectedBlock: {
                        [weak self] ()->() in
                        let vc = DRichTextViewVC.init()
                        vc.title = "Rich Text View"
                        self?.pushViewCtl(viewCtl: vc)
                    }),
                    ]
            ),
            
            DXSimpleTableViewSectionInfo.init(
                clazzTitle: "Child View Controllers",
                cellInfos: [
                    DXSimpleTableViewCellInfo.init(titleText: "Beauty & Handsome", detailText: "Transition from one child view controller to another", selectedBlock: {
                        [weak self] ()->() in
                        let vc = UIStoryboard.init(name: "DDifferentPageVC", bundle: Bundle.init(for: DDifferentPageVC.classForCoder())).instantiateInitialViewController() as UIViewController!
                        vc!.title = "Beauty & Handsome"
                        self?.pushViewCtl(viewCtl: vc)
                    }),
                    ]
            ),
            
        ]
    }
    
    
    func pushViewCtl(viewCtl: UIViewController!) {
        self.navigationController?.pushViewController(viewCtl, animated: true)
    }

}
