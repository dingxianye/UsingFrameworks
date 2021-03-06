//
//  DXMainViewController.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/6.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DXMainViewController : UIViewController {
    
    var tableView: DXSimpleTableView!
    var contentInfos: Array<DXSimpleTableViewSectionInfo>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Using Frameworks"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(DXMainViewController.share))
        
        self.setupData()
        
        tableView = DXSimpleTableView.init(frame: self.view.bounds, style: .grouped, sectionInfos: contentInfos)
        tableView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        self.view.addSubview(tableView)
    }
    
    
    func share() {
        
    }
    
    
    
    // MARK: Content Source
    
    func setupData() {
        contentInfos = [
        
            DXSimpleTableViewSectionInfo.init(
                clazzTitle: "UI Frameworks",
                cellInfos: [
                    DXSimpleTableViewCellInfo.init(titleText: "UIKit", selectedBlock: {
                        [weak self] ()->() in
                        let vc = DUIKitViewController.init()
                        vc.title = "UIKit"
                        self?.pushViewCtl(viewCtl: vc)
                    }),
                ]
            ),
            
            DXSimpleTableViewSectionInfo.init(
                clazzTitle: "About",
                cellInfos: [
                    DXSimpleTableViewCellInfo.init(titleText: "About Me", selectedBlock:
                        {
                            let alertView = UIAlertView.init(title: "About Using Frameworks", message: "Using Frameworks will help you to know more about using of iOS frameworks\n<a href=\"https://dingxianye.github.io/\">https://dingxianye.github.io/</a>", delegate: nil, cancelButtonTitle: "OK")
                            alertView.show()
                        }),
                    ]
            ),
            
            ]
    }
    
    
    func pushViewCtl(viewCtl: UIViewController!) {
        self.navigationController?.pushViewController(viewCtl, animated: true)
    }
}
