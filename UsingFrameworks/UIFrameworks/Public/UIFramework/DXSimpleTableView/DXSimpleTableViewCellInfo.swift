//
//  DXSimpleTableViewCellInfo.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DXSimpleTableViewCellInfo {
    
    var titleText: String!
    var detailText: String?
    var selectedBlock: (()->())?
    
    convenience init(titleText: String!) {
        self.init(titleText: titleText, detailText:nil, selectedBlock: nil)
    }
    
    convenience init(titleText: String!, selectedBlock: (()->())!) {
        self.init(titleText: titleText, detailText:nil, selectedBlock: selectedBlock)
    }
    
    init(titleText: String!, detailText: String?, selectedBlock: (()->())?) {
        self.titleText = titleText
        self.detailText = detailText
        self.selectedBlock = selectedBlock
    }
    
}
