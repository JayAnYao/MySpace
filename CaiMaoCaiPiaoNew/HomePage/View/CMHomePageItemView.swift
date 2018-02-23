//
//  CMHomePageItemView.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/30.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit
import SDWebImage

class CMHomePageItemView: UIView {

    /// 组件模型
    var homePageItemModel:CMHomePageItemModel? {
        didSet {
            if homePageItemModel?.iconUrl != nil {
                icon?.sd_setImage(with: URL(string:(homePageItemModel?.iconUrl!)!), completed: nil)
            }
            if homePageItemModel?.awardIcon != nil {
                awardIcon?.sd_setImage(with: URL(string:(homePageItemModel?.awardIcon!)!), completed: nil)
            }
            
            titleLabel?.text = homePageItemModel?.name
            
            if ((homePageItemModel?.desc?.range(of: "font")) != nil) {
                do {
                    let attrStr = try NSAttributedString(data: (homePageItemModel?.desc?.data(using: String.Encoding.unicode))!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                    descLabel?.attributedText = attrStr
                } catch {
                    print(error)
                }
            }else {
                descLabel?.text = homePageItemModel?.desc
                descLabel?.textColor = UIColor.gray
            }
        }
    }
    /// 图标
    var icon:UIImageView?
    /// 加奖图标
    var awardIcon:UIImageView?
    /// 名称
    var titleLabel:UILabel?
    /// 描述
    var descLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 创建图标
        icon = UIImageView(frame: CGRect(x: 10, y: 15, width: 40, height: 40))
        self.addSubview(icon!)
        // 创建加奖图标
        awardIcon = UIImageView(frame: CGRect(x: kScreenWidth/2 - 20, y: 0, width: 20, height: 20))
        self.addSubview(awardIcon!)
        // 创建标题
        titleLabel = UILabel(frame: CGRect(x: 58, y: 16, width: kScreenWidth/2 - 58, height: 20))
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(titleLabel!)
        // 创建描述
        descLabel = UILabel(frame: CGRect(x: 58, y: 36, width: kScreenWidth/2 - 58, height: 20))
        descLabel?.font = UIFont.systemFont(ofSize: 11)
        descLabel?.adjustsFontSizeToFitWidth = true
        self.addSubview(descLabel!)
        
        self.isUserInteractionEnabled = true
        
        // 添加点击事件
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CMHomePageItemView.viewClick(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewClick(_ sender:UITapGestureRecognizer) {
        
    }
}
