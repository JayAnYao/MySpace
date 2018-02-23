//
//  CMHomePageItemModel.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/29.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMHomePageItemModel: NSObject {
    /** 彩种ID*/
    var lotteryId:String?
    /** 组件类型*/
    var type:String?
    /** 点击事件*/
    var action:String?
    /** 描述*/
    var desc:String?
    /** 是否可点击*/
    var enable:Bool?
    /** 图标*/
    var iconUrl:String?
    /** 名称*/
    var name:String?
    /** 序列号*/
    var order:Int?
    /** 推荐*/
    var recommend:Int?
    /** 加奖标识*/
    var awardIcon:String?
    
    class func homePageItmeModel(withDict dict:[AnyHashable:Any]) -> CMHomePageItemModel {
        let model = CMHomePageItemModel()
        model.lotteryId = dict["lotteryId"] as? String
        model.action = dict["action"] as? String
        model.desc = dict["desc"] as? String
        model.enable = dict["enable"] as? Bool
        model.iconUrl = dict["iconUrl"] as? String
        model.name = dict["name"] as? String
        model.order = dict["order"] as? Int
        model.recommend = dict["recommend"] as? Int
        model.awardIcon = dict["awardIcon"] as? String
        return model
    }
}
