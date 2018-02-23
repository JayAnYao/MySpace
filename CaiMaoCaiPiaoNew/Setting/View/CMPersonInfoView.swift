//
//  CMPersonInfoView.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/21.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit
protocol CMPersonInfoViewDelegate:NSObjectProtocol {
    func settingSelecte()
}
class CMPersonInfoView: UIView {

    weak var personInfoDelegate:CMPersonInfoViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.orange
        let settingBtn = UIButton(type: UIButtonType.custom)
        settingBtn.frame = CGRect(x: 10, y: Int(kScreenHeight-40), width: 60, height: 40)
        settingBtn.setTitle("设置", for: UIControlState.normal)
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        settingBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        settingBtn.addTarget(self, action: #selector(CMPersonInfoView.settingBtnClick(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(settingBtn)
    }
    
    /// Called setting button is clicked
    func settingBtnClick(_ sender:UIButton) {
        personInfoDelegate?.settingSelecte()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
