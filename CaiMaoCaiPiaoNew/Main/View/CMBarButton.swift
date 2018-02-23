//
//  CMBarButton.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/22.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMBarButton: UIButton {

    /// 取消高亮
    override var isHighlighted: Bool {
        get {
            return false
        }
        set {
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.y = self.height * 0.1
        self.imageView?.width = self.width
        self.imageView?.height = self.height * 0.5
        self.imageView?.x = 0
        
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        
        self.titleLabel?.y = self.height * 0.7
        self.titleLabel?.x = 0
        self.titleLabel?.width = self.width
        self.titleLabel?.height = self.height * 0.2
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
}
