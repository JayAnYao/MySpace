//
//  CMThemeModel.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/21.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMThemeModel: NSObject {
    /**
     * 主题背景图片
     */
    var themeBackgroundImageUrl:String?
    /// 主题背景颜色
    var themeBackgroundColor:String?
    /// 导航栏背景图片
    var themeNavigationBarImageUrl:String?
    /// 导航栏背景颜色
    var themeNavigationBarColor:String?
    /// 导航栏标题字体颜色
    var themeNavigationBarTitleColor:String?
    /// 导航栏标题字体大小
    var themeNavigationBarTitleFont:Int?
    /// 工具栏背景图片
    var themeTabBarImage:String?
    /// 工具栏背景颜色
    var themeTabBarColor:String?
    /// 工具栏正常按钮图片
    var themeTabBarItemNormalImages:[String]?
    /// 工具栏选中按钮图片
    var themeTabBarItemSelectedImages:[String]?
    /// 工具栏名字字体颜色（常规）
    var themeTabBarItemNameNormalColor:String?
    /// 工具栏名字字体颜色（已选）
    var themeTabBarItemNameSelectedColor:String?
    
    class func themeModel(dic:[AnyHashable:Any]) -> CMThemeModel{
        let model = CMThemeModel()
        model.themeBackgroundColor = dic["themeBackgroundColor"] as? String
        model.themeBackgroundImageUrl = dic["themeBackgroundImageUrl"] as? String
        
        model.themeNavigationBarImageUrl = dic["themeNavigationBarImageUrl"] as? String
        model.themeNavigationBarColor = dic["themeNavigationBarColor"] as? String
        
        model.themeNavigationBarTitleColor = dic["themeNavigationBarTitleColor"] as? String
        model.themeNavigationBarTitleFont = dic["themeNavigationBarTitleFont"] as? Int
        
        model.themeTabBarColor = dic["themeTabBarColor"] as? String
        model.themeTabBarImage = dic["themeTabBarImage"] as? String
        
        model.themeTabBarItemNormalImages = dic["themeTabBarItemNormalImages"] as? [String]
        model.themeTabBarItemSelectedImages = dic["themeTabBarItemSelectedImages"] as? [String]
        
        model.themeTabBarItemNameNormalColor = dic["themeTabBarItemNameNormalColor"] as? String
        model.themeTabBarItemNameSelectedColor = dic["themeTabBarItemNameSelectedColor"] as? String
        return model
    }
}
