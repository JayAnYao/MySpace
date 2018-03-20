//
//  CMGlobalDefinition.h
//  CaiMoo
//
//  Created by huogh on 12-11-14.
//  Copyright (c) 2012年 infomedia. All rights reserved.
//

#ifndef CaiMoo_CMGlobalDefinition_h
#define CaiMoo_CMGlobalDefinition_h

#pragma mark - 日志输出

#define DEBUG_LOG                            // 是否开启日志输出
#define MANAGERNUMBER   2 // 是否显示管理员

#define TelNumber       @"4000-888-332"

#ifdef DEBUG_LOG                            // 普通日志
#define CMLog(...) NSLog(__VA_ARGS__)
#else
#define CMLog(...) do { } while (0)
#endif
#pragma mark - 客户端运行时配置宏
#define IMNetwork_Need_Sign         // 网络请求是否附带签名

#if TARGET_IPHONE_SIMULATOR      //判断模拟器还是真机
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//#define ROOT_URL        @"http://192.168.1.129:80"
//#define ROOT_URL        @"http://192.168.1.9"

//测试环境
//#define ROOT_URL        @"http://client.bysj.com:90"

//预发布
//#define ROOT_URL        @"http://client.caimoo.net"

//新生产环境
#define ROOT_URL        @"http://client.fcaimao.com"
#define rootUrl         @"http://sports.fcaimao.com/"
#define MoniUrl         @"http://moni.fcaimao.com"
#define ShareUrl        @"http://touch.fcaimao.com"
//#define ShareUrl        @"http://cd.caimoo.net:1070"
//#define MoniUrl         @"http://moni.bysj.com:1080"
//#define MoniUrl         @"http://192.168.4.120:8080"

//足球测试环境
//#define zuqiuUrl            @"http://sports.bysj.com:1030"
//#define zuqiuUrl           @"http://192.168.4.120:8084"
//足球生产环境
#define zuqiuUrl           @"http://sports.fcaimao.com"
//#define zuqiuUrl           @"http://sports.caimoo.net"
//版本号
#define Version            @"3.8.0"

//刷新金额
#define REFRESHMONEY       @"REFRESHMONEY"
//欧冠地址正式
#define OUGUANURL          @"http://touch.fcaimao.com/lotteryHome.jhtml?lotteryId=10075&fullScreen=1"
//欧冠地址测试
//#define OUGUANURL        @"http://admin.bysj.com:1070/lotteryHome.jhtml?lotteryId=10075&fullScreen=1"
///user/get_startpage.htm?
#define APPVERURL          @"%@/user/app_version.htm?"
#define APPLAUCHIMAGEURL   @"%@/user/get_startpage.htm?"
//市场来源
#define FROMSOURCE       @"market_appstore"


//设置文件名
#define SettingFile @"Setting.plist"

#pragma mark -- json获取
// 加载json数据
#define JayJson(name) [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@#name withExtension:nil]]

//遗漏
#define YiLouURL @"%@/lottery/get_miss.htm?"

#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6 ? YES : NO)
//#define CustomTextAlignmentCenter (ISO6 ? NSTextAlignmentCenter : NSTextAlignmentCenter)

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7 ? YES : NO)

#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= [@#version floatValue] ? YES : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - rgb color

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define REDRGB [UIColor colorWithRed:200/255.0 green:52/255.0 blue:52/255.0 alpha:1]

#define BLUERGB [UIColor colorWithRed:34/255.0 green:120/255.0 blue:231/255.0 alpha:1]

#define kWidth self.view.frame.size.width
#define kHeight self.view.frame.size.height

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

// 消除ARC环境下PerformSelector的警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define AccelerationPhase 1.5
#define AccelerationUpdateInterval (10.0/60.0f)

#pragma mark - preprocessor macros

#if defined(__has_feature) && __has_feature(objc_arc_weak)
#define ARC_WEAK_SUPPROT 1
#define ARC_WEAK weak
#define ARC_STRONG strong
#define ARC_WEAK_ATTRIBUTE __weak
#elif defined(__has_feature)  && __has_feature(objc_arc)
#define ARC_WEAK unsafe_unretained
#define ARC_STRONG strong
#define ARC_WEAK_ATTRIBUTE __unsafe_unretained
#else
#define ARC_WEAK assign
#define ARC_STRONG retain
#endif

#pragma mark - singleton macro

#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#pragma mark - global definition

#define NavigationTitleFont    22

#define HighFrequencyLottery   1
#define DigitalLottery         2
#define CompetitiveLottery     0

#define CMLotteryIDSFC         10039    // 胜负彩
#define CMLotteryIDRX9         10040    // 任选9
#define CMLotteryIDJCLQ        10058    // 篮球
#define CMLotteryIDLQDG        100580   // 篮球单关
#define CMLotteryIDJCZQ        10059    // 足球
#define CMLotteryIDJZDG        100590   // 竟足单关
#define CMLotteryIDOG          10075    // 欧冠
#define CMLotteryIDKLSF        10066    // 快乐十分
#define CMLotteryIDXKLSF       10077    // 新快乐十分
#define CMLotteryIDXQYH        10071    // 群英会
#define CMLotteryIDFC3D        10025    // 福彩3D
#define CMLotteryIDP3          10024    // 排列3
#define CMLotteryIDQXC         10030    // 七星彩
#define CMLotteryIDP5          100240   // 排列5
#define CMLotteryIDOSSC        10038    // 老时时彩，组合遗漏
#define CMLotteryIDH11X5       10069    // 上海11选5，组合遗漏
#define CMLotteryIDHei11X5     10068    // 黑11选5
#define CMLotteryIDY11X5       10062    // 广东11选5，组合遗漏
#define CMLotteryIDX11X5       10060    // 新11选5，组合遗漏
#define CMLotteryIDL11X5       10046    // 老11选5，组合遗漏
#define CMLotteryIDXJ11x5      10073    // 新疆11选5
#define CMLotteryIDK3          10067    // 快3
#define CMLotteryIDXK3         10070    // 新快3
#define CMLotteryIDJK3         10074    // 北京快3
#define CMLotteryIDJXK3        10076    // 江西快3
#define CMLotteryIDJSK3        10078    // 江苏快3
#define CMLotteryIDQLC         10033    // 七乐彩
#define CMLotteryIDDLT         10026    // 大乐透
#define CMLotteryIDSSQ         10032    // 双色球
#define CMLotteryIDKLPK        10072    // 快乐扑克
#define CMJFJCID               10000    // 积分竞猜

#define DINGZHILOTTERY      @"DINGZHILOTTERY"
#define DINGZHILOTTERYLAUCH @"DINGZHILOTTERYLAUCH"
#define NODINGZHILOTTERY    @"NODINGZHILOTTERY"

#define YouKuTuiGung        @"youku"

#define AppSchemeURL        @"com.caimao.iosapp"
#define UserLogin           @"caimao"
//彩金券检测返回 
#define CaiJinQuanCheck     @"caimaogiftcardcheck"
//红包券检测返回
#define HongBaoQuanCheck    @"caimaohongbaoquancheck"
//支付宝登陆
#define AlixpaySchemeURL    @"CaimaoAlixpayLogin"
#define AlixpayShareData    @"CaimaoAlixpaShareData"
//微信支付
#define kPayResultNotifyKey @"ZWXPAY"
//改变字体
#define kChangeFont @"ChangeFont"


#pragma mark - notification definition

// 支付宝支付成功 
#define CMAlipaySuccessEvent                    @"CMAlipaySuccessEvent"
#define CMNAVIGATION_TITLEVIEW_ARROW_RESUME     @"navigation_titleview_arrow_resume_to_down"

// 选号界面 隐藏或显示导航栏 事件通知
#define CMShowHideNavigatorBarTopFactor         110
#define CMShowHideNavigatorBarBotomFactor       -100
#define CMLotteryEventShowHideNavigatorBar          @"CMLotteryEventShowHideNavigatorBar"
#define CMLotteryEventShowHideNavigatorBarKeyHide   @"CMLotteryEventShowHideNavigatorBarKeyHide"

// 通知标记-更改主题
#define kChangeNavigationBarTheme @"ChangeNavigationBarTheme"
#define kChangeBackgroundTheme @"ChangeBackgroundTheme"
#define kChangeTabBarTheme @"ChangeTabBarTheme"

#pragma mark - import coommon header files

#import <QuartzCore/CoreAnimation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "UMessage.h"
#import <UserNotifications/UserNotifications.h>
#import <UMSocialCore/UMSocialCore.h>
#import "UIView+Frame.h"
#import "RGBHexColor.h"
#import "CMNetWorkManager.h"
#import <UMMobClick/MobClick.h>
#import "CMStoreManager.h"
#import "NSString+MD5.h"
#import "NSTimer+Addition.h"
//#import "UILabel+ChangeFont.h"

typedef enum {
    kCapitalTypeAll = 0,
    kCapitalTypeXianJin,
    kCapitalTypeHongBao,
    kCapitalTypeChongZhi,
    kCapitalTypeGouCai,
    kCapitalTypeJiFen,
    kCapitalTypeZhongJiang,
    kCapitalTypeTiKuan
}CMCapitalType;

#endif
