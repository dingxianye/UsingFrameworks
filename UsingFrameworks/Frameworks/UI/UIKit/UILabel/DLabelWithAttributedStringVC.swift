//
//  DLabelWithAttributedStringVC.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DLabelWithAttributedStringVC: UIViewController {
    
    /************************ Attributes ************************
    @available(iOS 6.0, *)
    public let NSFontAttributeName: String // UIFont, default Helvetica(Neue) 12
    @available(iOS 6.0, *)
    public let NSParagraphStyleAttributeName: String // NSParagraphStyle, default defaultParagraphStyle
    @available(iOS 6.0, *)
    public let NSForegroundColorAttributeName: String // UIColor, default blackColor
    @available(iOS 6.0, *)
    public let NSBackgroundColorAttributeName: String // UIColor, default nil: no background
    @available(iOS 6.0, *)
    public let NSLigatureAttributeName: String // NSNumber containing integer, default 1: default ligatures, 0: no ligatures
    @available(iOS 6.0, *)
    public let NSKernAttributeName: String // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled.
    @available(iOS 6.0, *)
    public let NSStrikethroughStyleAttributeName: String // NSNumber containing integer, default 0: no strikethrough
    @available(iOS 6.0, *)
    public let NSUnderlineStyleAttributeName: String // NSNumber containing integer, default 0: no underline
    @available(iOS 6.0, *)
    public let NSStrokeColorAttributeName: String // UIColor, default nil: same as foreground color
    @available(iOS 6.0, *)
    public let NSStrokeWidthAttributeName: String // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
    @available(iOS 6.0, *)
    public let NSShadowAttributeName: String // NSShadow, default nil: no shadow
    @available(iOS 7.0, *)
    public let NSTextEffectAttributeName: String // NSString, default nil: no text effect
    
    @available(iOS 7.0, *)
    public let NSAttachmentAttributeName: String // NSTextAttachment, default nil
    @available(iOS 7.0, *)
    public let NSLinkAttributeName: String // NSURL (preferred) or NSString
    @available(iOS 7.0, *)
    public let NSBaselineOffsetAttributeName: String // NSNumber containing floating point value, in points; offset from baseline, default 0
    @available(iOS 7.0, *)
    public let NSUnderlineColorAttributeName: String // UIColor, default nil: same as foreground color
    @available(iOS 7.0, *)
    public let NSStrikethroughColorAttributeName: String // UIColor, default nil: same as foreground color
    @available(iOS 7.0, *)
    public let NSObliquenessAttributeName: String // NSNumber containing floating point value; skew to be applied to glyphs, default 0: no skew
    @available(iOS 7.0, *)
    public let NSExpansionAttributeName: String // NSNumber containing floating point value; log of expansion factor to be applied to glyphs, default 0: no expansion
    
    @available(iOS 7.0, *)
    public let NSWritingDirectionAttributeName: String // NSArray of NSNumbers representing the nested levels of writing direction overrides as defined by Unicode LRE, RLE, LRO, and RLO characters.  The control characters can be obtained by masking NSWritingDirection and NSWritingDirectionFormatType values.  LRE: NSWritingDirectionLeftToRight|NSWritingDirectionEmbedding, RLE: NSWritingDirectionRightToLeft|NSWritingDirectionEmbedding, LRO: NSWritingDirectionLeftToRight|NSWritingDirectionOverride, RLO: NSWritingDirectionRightToLeft|NSWritingDirectionOverride,
    
    @available(iOS 6.0, *)
    public let NSVerticalGlyphFormAttributeName: String // An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
    
    // This defines currently supported values for NSUnderlineStyleAttributeName and NSStrikethroughStyleAttributeName. NSUnderlineStyle*, NSUnderlinePattern*, and NSUnderlineByWord are or'ed together to produce an underline style.
    ************************ Attribute values ************************/
    
    
    
    // MARK: NSFontAttributeName      字体
    func fontAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 20), text: "YES, "))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 16), text: "就要和外面那些"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.boldSystemFont(ofSize: 22), text: "妖艳贱货"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 26), text: "看起来"))
        mutAttributedString.append(self.attributedString(attributeName: NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 30), text: "不一样！！！"))  // FIXME: italic Chinese
        
        return self.prefixTitle(title: "NSFontAttributeName (字体)", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }
    
    // NSParagraphStyleAttributeName
    
    // MARK: NSForegroundColorAttributeName       前景色（文字颜色）
    func foregroundColorAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.red, text: "YES, "))
        mutAttributedString.append(self.attributedString(attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.blue, text: "就要和外面那些"))
        mutAttributedString.append(self.attributedString(attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.purple, text: "妖艳贱货"))
        mutAttributedString.append(self.attributedString(attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.green, text: "看起来"))
        mutAttributedString.append(self.attributedString(attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.orange, text: "不一样！！！"))
        
        return self.prefixTitle(title: "NSForegroundColorAttributeName (前景色)", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }
    
    // MARK: NSBackgroundColorAttributeName       背景色（底色）
    func backgroundColorAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.yellow, text: "YES, "))
        mutAttributedString.append(self.attributedString(attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.lightGray, text: "就要和外面那些"))
        mutAttributedString.append(self.attributedString(attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.orange, text: "妖艳贱货"))
        mutAttributedString.append(self.attributedString(attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.magenta, text: "看起来"))
        mutAttributedString.append(self.attributedString(attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.green, text: "不一样！！！"))
        
        return self.prefixTitle(title: "NSBackgroundColorAttributeName (背景色）", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }
    
    // NSLigatureAttributeName
    
    // MARK: NSKernAttributeName  字间距
    func kernAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 0), text: "这是默认字间距\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 5.5), text: "这是5.5的字间距\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 11), text: "这是11的字间距"))
        
        return self.prefixTitle(title: "NSKernAttributeName (字间距）", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }
    
    // MARK: NSStrikethroughStyleAttributeName    删除线
    func strikethroughStyleAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 0), text: "0就是没有删除线\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 1), text: "一条删除线\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 2), text: "两条删除线\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 3), text: "3条删除线\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 10), text: "10条删除线\n"))
        mutAttributedString.append(self.attributedString(attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSNumber.init(value: 100), text: "10条删除线"))
        
        return self.prefixTitle(title: "NSStrikethroughStyleAttributeName (删除线）", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }
    
    // MARK: NSUnderlineStyleAttributeName    下划线
    
    
    // MARK: NSStrokeColorAttributeName     文字轮廓颜色
    //       NSStrokeWidthAttributeName     文字轮廓宽度
    func strokeColorStrokeWidthAttributeNameAttributedString() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        mutAttributedString.append(self.attributedString(attributes: [NSStrokeColorAttributeName: UIColor.red, NSStrokeWidthAttributeName: Float(1)], text: "文字轮廓宽度为 1\n"))
        mutAttributedString.append(self.attributedString(attributes: [NSStrokeColorAttributeName: UIColor.blue, NSStrokeWidthAttributeName: Float(4)], text: "文字轮廓宽度为 4\n"))
        mutAttributedString.append(self.attributedString(attributes: [NSStrokeColorAttributeName: UIColor.purple, NSStrokeWidthAttributeName: Float(8)], text: "文字轮廓宽度为 4\n"))
        mutAttributedString.append(self.attributedString(attributes: [NSStrokeColorAttributeName: UIColor.orange, NSStrokeWidthAttributeName: Float(16)], text: "文字轮廓宽度为 16"))
        
        return self.prefixTitle(title: "NSStrokeColorAttributeName (文字轮廓颜色)\nNSStrokeWidthAttributeName (文字轮廓宽度/粗细)", attributedString: mutAttributedString.copy() as! NSAttributedString)
    }

    // NSShadowAttributeName    阴影
    
    // NSTextEffectAttributeName
    
    // NSAttachmentAttributeName
    
    // NSLinkAttributeName
    
    // NSBaselineOffsetAttributeName
    
    // NSUnderlineColorAttributeName
    
    // NSStrikethroughColorAttributeName
    
    // NSObliquenessAttributeName
    
    // NSExpansionAttributeName
    
    // NSWritingDirectionAttributeName
    
    // NSVerticalGlyphFormAttributeName:
    
    
    
    
    
    
    
    
    // MARK: application support
    
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
    
    
    // MARK: util to construct NSAttributedString
    
    func attributedString(attributeName: String!, attributeValue: Any!, text: String!) -> NSAttributedString! {
        let attributes = [ attributeName: attributeValue ]
        return self.attributedString(attributes: attributes, text: text)
    }
    
    func attributedString(attributes: [String : Any]!, text: String!) -> NSAttributedString! {
        return NSAttributedString.init(string: text, attributes: attributes)
    }
    
    func prefixTitle(title: String!, attributedString: NSAttributedString!) -> NSAttributedString! {
        let attrTitle = self.attributedString(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.gray], text: title + "\n")
        let mutAttrTitle = attrTitle!.mutableCopy() as! NSMutableAttributedString
        mutAttrTitle.append(attributedString)
        return mutAttrTitle.copy() as! NSAttributedString
    }
    
    
    // MARK: table view data source
    
    func setupDataSource() {
        dataSource = [
            DXSimpleTableViewSectionInfo.init(clazzTitle: nil, cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.fontAttributeNameAttributedString())
                ]),
            DXSimpleTableViewSectionInfo.init(clazzTitle: nil, cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.foregroundColorAttributeNameAttributedString())
                ]),
            DXSimpleTableViewSectionInfo.init(clazzTitle: nil, cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.backgroundColorAttributeNameAttributedString())
                ]),
            DXSimpleTableViewSectionInfo.init(clazzTitle: nil, cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.strokeColorStrokeWidthAttributeNameAttributedString())
                ])
        ]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
