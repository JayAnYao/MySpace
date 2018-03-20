//
//  Const.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/14.
//  Copyright © 2017年 CM. All rights reserved.
//

// 宏文件
import Foundation
import UIKit
//客服电话
let kTELNUMBER = "4000-888-332"

//友盟appkey
let UMAppKey = "599e8a085312dd0efb000fa8"

//正式地址
let kROOTURL = "http://client.fcaimao.com"
let kSPORTURL = "http://sports.fcaimao.com"
let kMONIURL = "http://moni.fcaimao.com"
let kSHAREURL = "http://touch.fcaimao.com"

//版本号
let kVERSION = "1.0.0"

//刷新金额
let REFRESHMONEY = "REFRESHMONEY"
//欧冠地址正式
let OUGUANURL = "http://touch.fcaimao.com/lotteryHome.jhtml?lotteryId=10075&fullScreen=1"
//欧冠地址测试
//let OUGUANURL = "http://admin.bysj.com:1070/lotteryHome.jhtml?lotteryId=10075&fullScreen=1"
///user/get_startpage.htm?
let APPVERURL = "%@/user/app_version.htm?"
let APPLAUCHIMAGEURL = "%@/user/get_startpage.htm?"
//市场来源
let FROMSOURCE = "market_appstore"


// 加载json数据

func JayJason(name:String) -> NSData {
    
    let bundle = Bundle.main
    
    let url = bundle.url(forResource: name, withExtension: nil)
    
    let data = NSData.init(contentsOf: url!)
    
    return data!
}


//遗漏
let kYiLouURL = "%@/lottery/get_miss.htm?"

func IOS8() -> Bool {
    if #available(iOS 8.0, *) {
        return true
    } else {
        return false
    }
}
func IOS9() -> Bool {
    if #available(iOS 9.0, *) {
        return true
    } else {
        return false
    }
}
func IOS10() -> Bool {
    if #available(iOS 10.0, *) {
        return true
    } else {
        return false
    }
}
func IOS11() -> Bool {
    if #available(iOS 11.0, *) {
        return true
    } else {
        return false
    }
}
func IsiPhoneX() -> Bool {
    if UIScreen.main.bounds.size.height == 812 {
        return true
    } else {
        return false
    }
}
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenScale = UIScreen.main.scale

func RGBCOLOR(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor
{
    
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

func RGBCOLOR(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
}

// 摇晃手机
let AccelerationPhase = 1.5
let AccelerationUpdateInterval = (10.0/60.0)

// 导航栏字体大小
let NavigationTitleFont = 22

// 彩种分类
let HighFrequencyLottery = 1 // 高频
let DigitalLottery = 2 // 数字
let CompetitiveLottery = 3 // 竞技

// iPhoneX屏幕切割尺寸
let cutValue:CGFloat  = IsiPhoneX() ? 88+83 : 64+49

let cutNavHeight:CGFloat = IsiPhoneX() ? 88 : 64

let cutTabHeight:CGFloat = IsiPhoneX() ? 83 : 49

// 彩种ID
let CMLotteryIDSFC = 10039      // 胜负彩
let CMLotteryIDRX9 = 10040      // 任选9
let CMLotteryIDJCLQ = 10058     // 篮球
let CMLotteryIDLQDG = 100580    // 篮球单关
let CMLotteryIDJCZQ = 10059     // 足球
let CMLotteryIDJZDG = 100590    // 竟足单关
let CMLotteryIDOG = 10075       // 欧冠
let CMLotteryIDKLSF = 10066     // 快乐十分
let CMLotteryIDXKLSF = 10077    // 新快乐十分
let CMLotteryIDXQYH = 10071     // 群英会
let CMLotteryIDFC3D = 10025     // 福彩3D
let CMLotteryIDP3 = 10024       // 排列3
let CMLotteryIDQXC = 10030      // 七星彩
let CMLotteryIDP5 = 100240      // 排列5
let CMLotteryIDOSSC = 10038     // 老时时彩，组合遗漏
let CMLotteryIDH11X5 = 10069    // 上海11选5，组合遗漏
let CMLotteryIDHei11X5 = 10068  // 黑11选5
let CMLotteryIDY11X5 = 10062    // 广东11选5，组合遗漏
let CMLotteryIDX11X5 = 10060    // 新11选5，组合遗漏
let CMLotteryIDL11X5 = 10046    // 老11选5，组合遗漏
let CMLotteryIDXJ11x5 = 10073   // 新疆11选5
let CMLotteryIDK3 = 10067       // 快3
let CMLotteryIDXK3 = 10070      // 新快3
let CMLotteryIDJK3 = 10074      // 北京快3
let CMLotteryIDJXK3 = 10076     // 江西快3
let CMLotteryIDJSK3 = 10078     // 江苏快3
let CMLotteryIDHK3 = 10079    //吉林快3
let CMLotteryIDQLC = 10033      // 七乐彩
let CMLotteryIDDLT = 10026      // 大乐透
let CMLotteryIDSSQ = 10032      // 双色球
let CMLotteryIDKLPK = 10072     // 快乐扑克
let CMJFJCID = 10000            // 积分竞猜


let kDINGZHILOTTERY = "DINGZHILOTTERY"
let kDINGZHILOTTERYLAUCH = "DINGZHILOTTERYLAUCH"
let kNODINGZHILOTTERY = "NODINGZHILOTTERY"
let kAppSchemeURL = "com.caimao.iosapp"
let kUserLogin = "caimao"
//彩金券检测返回
let kCaiJinQuanCheck = "caimaogiftcardcheck"
//红包券检测返回
let HongBaoQuanCheck = "caimaohongbaoquancheck"
//支付宝登陆
let AlixpaySchemeURL = "CaimaoAlixpayLogin"
let AlixpayShareData = "CaimaoAlixpaShareData"
//微信支付
let kPayResultNotifyKey = "ZWXPAY"
// 支付宝支付成功
let CMAlipaySuccessEvent = "CMAlipaySuccessEvent"
let CMNAVIGATION_TITLEVIEW_ARROW_RESUME = "navigation_titleview_arrow_resume_to_down"
// 通知标记-更改主题
let kChangeNavigationBarTheme = "ChangeNavigationBarTheme"
let kChangeBackgroundTheme = "ChangeBackgroundTheme"
let kChangeTabBarTheme = "ChangeTabBarTheme"

enum CMCapitalType : Int{
        case kCapitalTypeAll = 0,
        kCapitalTypeXianJin,
        kCapitalTypeHongBao,
        kCapitalTypeChongZhi,
        kCapitalTypeGouCai,
        kCapitalTypeJiFen,
        kCapitalTypeZhongJiang,
        kCapitalTypeTiKuan
}

		
