//
//  DLabelWithAttributedStringVC.swift
//  UsingFrameworks
//
//  Created by Derek on 2016/11/7.
//  Copyright © 2016年 DXY. All rights reserved.
//

import UIKit

class DLabelWithAttributedStringVC: UIViewController {
    
    // MARK: application support
    
    var tableView: DXSimpleTableView!
    var dataSource: Array<DXSimpleTableViewSectionInfo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setupTableAndDataSource()
        
        let footerLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 100))
        footerLabel.textAlignment = .center
        footerLabel.autoresizingMask = [.flexibleWidth]
        footerLabel.font = UIFont.systemFont(ofSize: 12)
        footerLabel.textColor = UIColor.gray
        footerLabel.text = "想要更多美丽的Icon，可以在这里找：http://www.iconfont.cn/"
        self.tableView.tableFooterView = footerLabel
    }
    
    // MARK: table view and data source
    
    func setupTableAndDataSource() {
        dataSource = [
            
            // MARK: ------ Example of NSFontAttributeName ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSFontAttributeName（字体）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是font为 14 的文字", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 14))),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是font为 20 的文字", attributeName:NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 20))),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是font为 14 的 斜体 文字，中文有点问题", attributeName:NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 14))),  // FIXME: italic Chinese
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "I'm italicSystemFont of size 14, perfect!", attributeName:NSFontAttributeName, attributeValue: UIFont.italicSystemFont(ofSize: 14))),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我比他们都要粗，粗体 14", attributeName:NSFontAttributeName, attributeValue: UIFont.boldSystemFont(ofSize: 14))),
                ]),
            
            
            // MARK: ------ Example of NSForegroundColorAttributeName ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSForegroundColorAttributeName（文字颜色）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是 红色 的文字", attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.red)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是 蓝色 的文字", attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.blue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是 绿色 的文字", attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.green)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是 橙色 的文字", attributeName: NSForegroundColorAttributeName, attributeValue: UIColor.orange)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(textArray: [
                        "我就是",
                        "颜色",
                        "不一样的",
                        "烟火",
                    ], attributeArray: [
                        [NSForegroundColorAttributeName: UIColor.red],
                        [NSForegroundColorAttributeName: UIColor.purple],
                        [NSForegroundColorAttributeName: UIColor.brown],
                        [NSForegroundColorAttributeName: UIColor.magenta],
                    ])),
                ]),
            
            
            // MARK: ------ Example of NSBackgroundColorAttributeName(背景/底色) ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSBackgroundColorAttributeName（背景色）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我的底色是 红色 的", attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.red)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我的底色是 蓝色 的", attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.blue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我的底色是 绿色 的", attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.green)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我的底色是 橙色 的", attributeName: NSBackgroundColorAttributeName, attributeValue: UIColor.orange)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(textArray: [
                        "就和那些",
                        "妖艳贱货",
                        "看起来",
                        "不一样！！！",
                    ], attributeArray: [
                        [NSBackgroundColorAttributeName: UIColor.yellow],
                        [NSBackgroundColorAttributeName: UIColor.red],
                        [NSBackgroundColorAttributeName: UIColor.orange],
                        [NSBackgroundColorAttributeName: UIColor.magenta],
                        [NSBackgroundColorAttributeName: UIColor.green],
                    ])),
                ]),
            
            
            // MARK: ------ Example of NSStrokeColorAttributeName(文字轮廓颜色) & NSStrokeWidthAttributeName(文字轮廓宽度) ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSStrokeColorAttributeName & NSStrokeWidthAttributeName（文字轮廓颜色与文字轮廓宽度）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "红色 文字轮廓，宽度为 1", attributes: [NSStrokeColorAttributeName: UIColor.red, NSStrokeWidthAttributeName: Float(1)])),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "蓝色 文字轮廓，宽度为 4", attributes: [NSStrokeColorAttributeName: UIColor.blue, NSStrokeWidthAttributeName: Float(4)])),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "紫色 文字轮廓，宽度为 8", attributes: [NSStrokeColorAttributeName: UIColor.purple, NSStrokeWidthAttributeName: Float(8)])),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "橙色 文字轮廓，宽度为 1", attributes: [NSStrokeColorAttributeName: UIColor.orange, NSStrokeWidthAttributeName: Float(16)])),
                ]),
            
            
            // MARK: ------ Example of NSKernAttributeName(字间距) ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSKernAttributeName（文字水平间距）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "这是默认字间距", attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 0))),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "这是5.5的字间距", attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 5.5))),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "这是11的字间距", attributeName: NSKernAttributeName, attributeValue: NSNumber.init(value: 11))),
                ]),
            
            
            // MARK: ------ Example of NSStrikethroughStyleAttributeName(删除线) ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSStrikethroughStyleAttributeName（删除线）", cellInfos: [
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "没有删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleNone.rawValue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "1条 删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleSingle.rawValue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "2条 删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleDouble.rawValue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "1条 粗的 删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleThick.rawValue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "分词(空格无删除线)的 2条 删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleDouble.rawValue + NSUnderlineStyle.byWord.rawValue)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "分词(空格无删除线)的 2条 线段型 的删除线", attributeName: NSStrikethroughStyleAttributeName, attributeValue: NSUnderlineStyle.styleDouble.rawValue + NSUnderlineStyle.patternDash.rawValue + NSUnderlineStyle.byWord.rawValue)),
//                The value of this attribute is an NSNumber object containing an integer. This value indicates whether the text has a line through it and corresponds to one of the constants described in “Underline and Strikethrough Style Attributes”. The default value for this attribute is NSUnderlineStyleNone.
                ]),
            
            
            // MARK: ------ Example of NSAttachmentAttributeName ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "NSAttachmentAttributeName", cellInfos: [
                
                // Basic Use of Attachement
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedStringWithAttachmentDemo()),
                
                // More
                DXSimpleTableViewCellInfo.init(titleText: "更多Attachment内容，详见DRichTextViewVC", selectedBlock: {[weak self] in
                    self!.navigationController?.pushViewController(DRichTextViewVC.init(), animated: true)
                }),
                ]),
            
            
            // MARK: ------ Example of NSParagraphStyleAttributeName ------
            DXSimpleTableViewSectionInfo.init(clazzTitle: "Example of NSParagraphStyleAttributeName（段落格式）", cellInfos: [
                
                // Alignment
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是右对齐的文字", alignment: .right)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我是居中的文字", alignment: .center)),
                
                // Indent
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "First Line Head Indent（首行缩进）是我们在编辑文字时常用的格式，写过论文、排过版什么的朋友们应该是非常了解；设置 firstLineHeadIndent 后，可以看到文字段的首行出现了缩进，而后面几行均没有任何的缩进。", firstLineHeadIndent: 40, headIndent: 0, tailIndent: 0)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "* Head Intent（头缩进）是另一个行缩进的常用格式；看到首行的星号了吗？下面几行的行首都是自动缩进的，是因为设置了 headIntent，效果非常棒！注意：headIndent 只负责非首行的文字缩进，而首行的文字缩进由 firstLineHeadIndent 控制。", firstLineHeadIndent: 0, headIndent: 10, tailIndent: 0)),
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "我们还可以通过 tailIntent 属性来设置 Tail Intent（尾缩进），感觉平时用得不太多，应该是我写的论文什么的太少的原因吧。注意：tailIndent 值的正负，本段的值是 -40。",  firstLineHeadIndent: 40, headIndent: 0, tailIndent: -40)),
                
                // Spacing
                DXSimpleTableViewCellInfo.init(titleAttributedText: self.attributedString(text: "段落格式中，段前距（paragraphSpacingBefore）、行间距（lineSpacing）、段后距（paragraphSpacing）也是非常常用的格式属性，下面看文字演示：\n我说道：“爸爸，你走吧。”他望车外看了看，说：“我买几个橘子去。你就在此地，不要走动。”我看那边月台的栅栏外有几个卖东西的等着顾客。\n...\n我看见他戴着黑布小帽，穿着黑布大马褂，深青布棉袍，蹒跚地走到铁道边，慢慢探身下去，尚不大难。可是他穿过铁道，要爬上那边月台，就不容易了。他用两手攀着上面，两脚再向上缩；他肥胖的身子向左微倾，显出努力的样子。\n这时我看见他的背影，我的泪很快地流下来了。我赶紧拭干了泪。怕他看见，也怕别人看见。我再向外看时，他已抱了朱红的橘子往回走了。过铁道时，他先将橘子散放在地上，自己慢慢爬下，再抱起橘子走。\n...\n等他的背影混入来来往往的人里，再找不着了，我便进来坐下，我的眼泪又来了。\n摘自朱自清的《背影》中一段，相信很多同学都被要求背诵过，但为了演示效果，原谅我把一段割成了几段，就不要赏析这样分段有什么不妥了。",  paragraphSpacingBefore: 5, lineSpacing: 10, paragraphSpacing: 10)),
                
                // Other
                DXSimpleTableViewCellInfo.init(titleText: "除了上述几个属性以外，还有如\nlineHeightMultiple\nmaximumLineHeight\nminimumLineHeight\ntabStops\nlineBreakMode\nhyphenationFactor\nbaseWritingDirection\n可以自行尝试效果"),
                ]),
            
            
            
            
            
            
            
//            DXSimpleTableViewSectionInfo.init(clazzTitle: "NSLigatureAttributeName", cellInfos: [
//                DXSimpleTableViewCellInfo.init(titleAttributedText: self.ligatureAttributeNameAttributedString())
//                ]),
//            DXSimpleTableViewSectionInfo.init(clazzTitle: "NSLigatureAttributeName", cellInfos: [
//                DXSimpleTableViewCellInfo.init(titleAttributedText: self.ligatureAttributeNameAttributedString())
//                ]),
        ]
        
        tableView = DXSimpleTableView.init(frame: self.view.bounds, style: .grouped, sectionInfos: dataSource)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
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
    
    
    
    
    
    // MARK: NSUnderlineStyleAttributeName    下划线
    
    
    // MARK: NSShadowAttributeName    阴影
    
    // MARK: NSTextEffectAttributeName
    
    // MARK: NSAttachmentAttributeName
    
    // MARK: NSLinkAttributeName
    
    // MARK: NSBaselineOffsetAttributeName
    
    // MARK: NSUnderlineColorAttributeName
    
    // MARK: NSStrikethroughColorAttributeName
    
    // MARK: NSObliquenessAttributeName
    
    // MARK: NSExpansionAttributeName
    
    // MARK: NSWritingDirectionAttributeName
    
    // MARK: NSVerticalGlyphFormAttributeName:
    
    
    
    
    
    
    
    
    // MARK: util to construct NSAttributedString
    
    func attributedString(text: String!, attributes: [String : Any]!) -> NSAttributedString! {
        return NSAttributedString.init(string: text, attributes: attributes)
    }
    
    func attributedString(text: String!, attributeName: String!, attributeValue: Any!) -> NSAttributedString! {
        let attributes = [ attributeName: attributeValue ]
        return self.attributedString(text: text, attributes: attributes)
    }
    
    func attributedString(textArray: Array<String>!, attributeArray: Array<[String: Any]>!) -> NSAttributedString! {
        if textArray.count > attributeArray.count {
            return NSAttributedString.init()
        }
        
        let mutAttributedString = NSMutableAttributedString.init()
        
        let count = textArray.count
        for i in 0 ..< count {
            let text = textArray[i]
            let attrMap = attributeArray[i]     // AttributedName: AttributeValue
            
            mutAttributedString.append(self.attributedString(text: text, attributes: attrMap))
        }
        
        return mutAttributedString.copy() as! NSAttributedString
    }
    
    func attributedStringOfParagraphStyle(text: String!,
                                          alignment               : NSTextAlignment,
                                          firstLineHeadIndent     : CGFloat,
                                          headIndent              : CGFloat,
                                          tailIndent              : CGFloat,
                                          lineHeightMultiple      : CGFloat,
                                          maximumLineHeight       : CGFloat,
                                          minimumLineHeight       : CGFloat,
                                          lineSpacing             : CGFloat,
                                          paragraphSpacing        : CGFloat,
                                          paragraphSpacingBefore  : CGFloat,
                                          lineBreakMode           : NSLineBreakMode,
                                          baseWritingDirection    : NSWritingDirection
        ) -> NSAttributedString! {
        
        let mutParagraphStyle = NSMutableParagraphStyle.init()
        mutParagraphStyle.alignment = alignment
        mutParagraphStyle.firstLineHeadIndent = firstLineHeadIndent
        mutParagraphStyle.headIndent = headIndent
        mutParagraphStyle.tailIndent = tailIndent
        mutParagraphStyle.lineHeightMultiple = lineHeightMultiple
        mutParagraphStyle.maximumLineHeight = maximumLineHeight
        mutParagraphStyle.minimumLineHeight = minimumLineHeight
        mutParagraphStyle.lineSpacing = lineSpacing
        mutParagraphStyle.paragraphSpacing = paragraphSpacing
        mutParagraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
        mutParagraphStyle.lineBreakMode = lineBreakMode
        mutParagraphStyle.baseWritingDirection = baseWritingDirection
        
        let paragraphStyle = mutParagraphStyle.copy()
        
        let attribtedString = self.attributedString(text: text, attributeName: NSParagraphStyleAttributeName, attributeValue: paragraphStyle)
        
        return attribtedString
    }
    
    func attributedString(text: String!, alignment: NSTextAlignment) -> NSAttributedString! {
        return self.attributedStringOfParagraphStyle(text: text,
                                                     alignment: alignment,
                                                     firstLineHeadIndent: 0,
                                                     headIndent: 0,
                                                     tailIndent: 0,
                                                     lineHeightMultiple: 0,
                                                     maximumLineHeight: 0,
                                                     minimumLineHeight: 0,
                                                     lineSpacing: 0,
                                                     paragraphSpacing: 0,
                                                     paragraphSpacingBefore: 0,
                                                     lineBreakMode: NSLineBreakMode.byWordWrapping,
                                                     baseWritingDirection: NSWritingDirection.natural)
    }
    
    func attributedString(text: String!, firstLineHeadIndent: CGFloat, headIndent: CGFloat, tailIndent: CGFloat) -> NSAttributedString! {
        return self.attributedStringOfParagraphStyle(text: text,
                                                     alignment: .left,
                                                     firstLineHeadIndent: firstLineHeadIndent,
                                                     headIndent: headIndent,
                                                     tailIndent: tailIndent,
                                                     lineHeightMultiple: 0,
                                                     maximumLineHeight: 0,
                                                     minimumLineHeight: 0,
                                                     lineSpacing: 0,
                                                     paragraphSpacing: 0,
                                                     paragraphSpacingBefore: 0,
                                                     lineBreakMode: NSLineBreakMode.byWordWrapping,
                                                     baseWritingDirection: NSWritingDirection.natural)
    }
    
    func attributedString(text: String!, paragraphSpacingBefore: CGFloat, lineSpacing: CGFloat, paragraphSpacing: CGFloat) -> NSAttributedString! {
        return self.attributedStringOfParagraphStyle(text: text,
                                                     alignment: .left,
                                                     firstLineHeadIndent: 0,
                                                     headIndent: 0,
                                                     tailIndent: 0,
                                                     lineHeightMultiple: 0,
                                                     maximumLineHeight: 0,
                                                     minimumLineHeight: 0,
                                                     lineSpacing: lineSpacing,
                                                     paragraphSpacing: paragraphSpacing,
                                                     paragraphSpacingBefore: paragraphSpacingBefore,
                                                     lineBreakMode: NSLineBreakMode.byWordWrapping,
                                                     baseWritingDirection: NSWritingDirection.natural)
    }
    
    func attributedString(image: UIImage, bounds: CGRect) -> NSAttributedString! {
        
        let attachment = NSTextAttachment.init()
        attachment.image = image
        if (bounds.width > 0 || bounds.height > 0) {
            attachment.bounds = bounds
        }
        let attributedString = NSAttributedString.init(attachment: attachment)
        
        return attributedString
    }
    
    // Icons are from: http://www.iconfont.cn/
    func attributedStringWithAttachmentDemo() -> NSAttributedString! {
        let mutAttributedString = NSMutableAttributedString.init()
        
        // 不设置bounds，则attachment图片会按原图大小显示出来
        mutAttributedString.append(self.attributedString(text: "原图显示的attachment image：\n", alignment: .left))
        mutAttributedString.append(self.attributedString(image: #imageLiteral(resourceName: "att-emoji-small"), bounds: CGRect.zero))
        mutAttributedString.append(self.attributedString(text: " 32x32    ", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        mutAttributedString.append(self.attributedString(image: #imageLiteral(resourceName: "att-emoji-big"), bounds: CGRect.zero))
        mutAttributedString.append(self.attributedString(text: " 200x200\n", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        mutAttributedString.append(self.attributedString(text: "\n不设置bounds，则attachment图片会按原图大小显示出来", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        
        mutAttributedString.append(self.attributedString(text: "\n\n设置了bounds的attachment：\n", alignment: .left))
        mutAttributedString.append(self.attributedString(image: #imageLiteral(resourceName: "att-emoji-resize"), bounds: CGRect(x: 0, y: 0, width: 20, height: 20)))
        mutAttributedString.append(self.attributedString(text: " 20x20    ", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        mutAttributedString.append(self.attributedString(image: #imageLiteral(resourceName: "att-emoji-resize"), bounds: CGRect(x: 0, y: 0, width: 40, height: 40)))
        mutAttributedString.append(self.attributedString(text: " 40x40    ", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        mutAttributedString.append(self.attributedString(image: #imageLiteral(resourceName: "att-emoji-resize"), bounds: CGRect(x: 0, y: 0, width: 40, height: 20)))
        mutAttributedString.append(self.attributedString(text: " 40x20", attributeName: NSFontAttributeName, attributeValue: UIFont.systemFont(ofSize: 12)))
        
        return mutAttributedString.copy() as! NSAttributedString
    }
}
