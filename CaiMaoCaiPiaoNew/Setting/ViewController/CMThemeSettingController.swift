//
//  CMThemeSettingController.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/21.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMThemeSettingController: CMBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavTitle(title: "设置主题")
        
        let grayBtn = UIButton(type: UIButtonType.custom)
        grayBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        grayBtn.backgroundColor = UIColor.gray
        grayBtn.addTarget(self, action: #selector(CMThemeSettingController.grayBtnClick(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(grayBtn)
        
        let blackBtn = UIButton(type: UIButtonType.custom)
        blackBtn.frame = CGRect(x: 200, y: 100, width: 50, height: 50)
        blackBtn.backgroundColor = UIColor.black
        blackBtn.addTarget(self, action: #selector(CMThemeSettingController.blackBtnClick(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(blackBtn)
    }

    func grayBtnClick(_ sender:UIButton) {
        
        let array = ["1","2","3","4"]
        let dic = ["themeName":"theme1","themeNavigationBarColor":"#FF3E96","themeBackgroundColor":"#FAEBD7","themeNavigationBarTitleColor":"#FFFFFF","themeNavigationBarTitleFont":20,"themeTabBarItemNormalImages":array] as [AnyHashable : Any]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kChangeNavigationBarTheme), object: nil, userInfo: ["model":dic,"type":"color"])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kChangeBackgroundTheme), object: nil, userInfo: ["model":dic,"type":"color"])
    }
    
    
    func tapClick(_ sender:UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
        CMTabBarController.shareManager.jump(to: 1, currentViewController: self)
    }
    
    func blackBtnClick(_ sender:UIButton) {
        let dic = ["themeName":"theme2","themeNavigationBarColor":"#BF3EFF","themeBackgroundImageUrl":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504265227702&di=471079349b8d55a930fb55dbc20dc49f&imgtype=0&src=http%3A%2F%2Fv1.qzone.cc%2Fpic%2F201608%2F16%2F17%2F16%2F57b2d9d7e3d64305.jpg%2521600x600.jpg","themeNavigationBarTitleColor":"#FFFFFF","themeNavigationBarTitleFont":20] as [AnyHashable : Any]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kChangeNavigationBarTheme), object: nil, userInfo: ["model":dic,"type":"color"])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kChangeBackgroundTheme), object: nil, userInfo: ["model":dic,"type":"image"])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func barBtnClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
