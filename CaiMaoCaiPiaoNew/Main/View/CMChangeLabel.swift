//
//  CMChangeLabel.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/11/27.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMChangeLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter.default.addObserver(self, selector: #selector(CMChangeLabel.setGlobalFont(notification:)), name: NSNotification.Name(rawValue: kChangeFont), object: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(CMChangeLabel.setGlobalFont(notification:)), name: NSNotification.Name(rawValue: kChangeFont), object: nil)
    }
    
    func setGlobalFont(notification:NSNotification)  {
        
        if self.isKind(of: UILabel.self) {
            let dict = notification.userInfo
            let fontName = dict!["fontName"] as! String
            let fontSize = Int(dict!["fontSize"] as! String)
            let textColorHex = dict!["textColorHex"] as! String
            
            self.font = UIFont(name: fontName, size: CGFloat(fontSize!))
            self.textColor = RGBHexColor.color(withHexString: textColorHex)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
