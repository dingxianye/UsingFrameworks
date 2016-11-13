//
//  DXSimpleTableViewCellInfo.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DXSimpleTableViewCellInfo {
    
    var titleText: String?
    var titleAttributedText: NSAttributedString?
    var detailText: String?
    var selectedBlock: (()->())?
    
    convenience init(titleText: String!) {
        self.init(titleText: titleText, detailText: nil, selectedBlock: nil)
    }
    
    convenience init(titleText: String!, selectedBlock: (()->())!) {
        self.init(titleText: titleText, detailText: nil, selectedBlock: selectedBlock)
    }
    
    convenience init(titleText: String!, detailText: String?, selectedBlock: (()->())?) {
        self.init(titleText: titleText, titleAttributedText: nil, detailText: nil, selectedBlock: selectedBlock)
    }
    
    convenience init(titleAttributedText: NSAttributedString!) {
        self.init(titleAttributedText: titleAttributedText, detailText: nil)
    }
    
    convenience init(titleAttributedText: NSAttributedString!, detailText: String!) {
        self.init(titleText: nil, titleAttributedText: titleAttributedText, detailText: detailText, selectedBlock: nil)
    }
    
    convenience init(titleAttributedText: NSAttributedString!, detailText: String!, selectedBlock: (()->())!) {
        self.init(titleText: nil, titleAttributedText: titleAttributedText, detailText: detailText, selectedBlock: selectedBlock)
    }
    
    init(titleText: String?, titleAttributedText: NSAttributedString?, detailText: String?, selectedBlock: (()->())?) {
        self.titleText = titleText
        self.titleAttributedText = titleAttributedText
        self.detailText = detailText
        self.selectedBlock = selectedBlock
    }
}
