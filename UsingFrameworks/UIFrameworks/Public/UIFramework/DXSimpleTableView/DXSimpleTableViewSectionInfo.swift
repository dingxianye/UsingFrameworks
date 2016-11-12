//
//  DXSimpleTableViewSectionInfo.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DXSimpleTableViewSectionInfo {

    var clazzTitle: String?
    var cellInfos: Array<DXSimpleTableViewCellInfo>!
    
    init(clazzTitle: String?, cellInfos: Array<DXSimpleTableViewCellInfo>!) {
        self.clazzTitle = clazzTitle
        self.cellInfos = cellInfos
    }
    
}
