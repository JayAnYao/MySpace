//
//  CMLotteryTicket.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2018/2/22.
//  Copyright © 2018年 CM. All rights reserved.
//
//
//  彩票基础类
//  用来保存彩种的各种属性

import UIKit

class CMLotteryTicket: NSObject {
    /** 彩种ID*/
    var lotteryId:Int?
    /** 彩票种类 体彩或福彩*/
    var lotteryFrom:Int?
    /** 是否是高频彩*/
    var isLotteryHighFrequency:Bool?
    /** 彩种类型*/
    var lotteryType:Int?
    /** 彩票类别 1表示高频彩  2表示数字彩  3表示竞技彩*/
    var lotteryCategory:Int?
    /** 前区号码个数*/
    var prozoneCount:Int?
    /** 后区号码个数*/
    var backZoneCount:Int?
    /** 前区号码总数*/
    var prozoneTotal:Int?
    /** 后区号码总数*/
    var backZoneTotal:Int?
    /** 前区可选号码最大值*/
    var prozoneMaxOptionCount:Int?
    /** 后区可选号码最大值*/
    var backZoneMaxOptionCount:Int?
    /** 单注最大投注数*/
    var maxStakes:Int?
    /** 最大奖期数*/
    var maxIssue:Int?
    /** 前区号码集合*/
    var prozoneNumbers:[Int]?
    /** 后区号码集合*/
    var backZoneNumbers:[Int]?
    /** 彩种分区名字 如双色球 红球篮球，大乐透 前区后区*/
    var allZoneKeys:[String]?
    /** 玩法名字*/
    var playNames:[String]?
    /** 胆拖玩法名字*/
    var danTuoPlayNames:[String]?
    /** 玩法奖金*/
    var playBonus:[String]?
    /** 提交到后台的玩法名字 普通*/
    var uploadNormalPlayNames:[String]?
    /** 提交到后台的玩法名字 奖金优化*/
    var uploadOptimizeBonusPlayNames:[String]?
    /** 提交到后台的玩法名字 复式*/
    var uploadDoublePlayNames:[String]?
    /** 提交到后台的玩法名字 胆拖*/
    var uploadDanTuoPlayNames:[String]?
    /** 开奖时间*/
    var openIssueTime:String?
    /** 最高奖金*/
    var maxBonus:String?
    /** 彩种名称*/
    var lotteryName:String?
    /** 彩种图标*/
    var lotteryIcon:String?
    /** 视图控制器名字*/
    var viewControllerName:String?
}
