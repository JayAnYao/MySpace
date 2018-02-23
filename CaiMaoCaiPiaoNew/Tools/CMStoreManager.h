//
//  CMStoreManager.h
//  CaiMoo
//
//  Created by huogh on 13-1-13.
//  Copyright (c) 2013年 infomedia. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CMStoreManager : NSObject
AS_SINGLETON(CMStoreManager)


// 高级图表期数设置
- (void)setChartIssueCount:(NSString *)count;
- (NSString *)getChartIssueCount;

// 高级图表显示顺序
- (void)setChartOrder:(NSString *)order;
- (NSString *)getChartOrder;

// 高级图表预选区设置
- (void)setPreselect:(NSString *)preselect;
- (NSString *)getPreselect;

//设置摇一摇
- (void)setShake:(NSString *)shake;

- (BOOL)getShake;

//本地plist文件操作
-(NSString *)get_filename:(NSString *)name;
-(BOOL)is_file_exist:(NSString *)name;

//设置URL域名
+ (void)setURL:(NSString *)str;

//是否是正式环境地址
+ (BOOL)isProductionEnvironment;

//获得URL
+ (NSString *)getURL;

//设置足球URL域名
+ (void)setZQURL:(NSString *)str;

//获得足球URL
+ (NSString *)getZQURL;

//设置模拟URL域名
+ (void)setMoniURL:(NSString *)str;

//获得模拟URL
+ (NSString *)getMoniURL;

//设置分享URL域名
+ (void)setShareUrl:(NSString *)str;

//获得分享URL域名
+ (NSString *)getShareUrl;

//设置UUID
- (void)setUUID;

//获得UUID
- (NSString *)getUUID;

//是否加载高级图表引导图
- (BOOL)isLoadChartGuide;
- (BOOL)isLoadCMSSGuideOne;
- (BOOL)isLoadCMSSGuideTwo;
- (BOOL)isShowJiangzhuang :(NSInteger)schemeId;
- (BOOL)isLoadMasterRewardGuide;
- (BOOL)isShowShouYe11x5ZMGuide;
// 当前版本是不是第一次登陆
- (BOOL)versionIsFirstLogin;

// 设置当前版本
- (void)setVersionIsFirstLogin;

// 是否已经登录
- (BOOL)isLogin;

// 是否自动登录
- (BOOL)isAutoLogin;

// 获取账户余额
- (NSString *)getAccountBalance;

// 设置账户余额
- (void)setAccountBalance:(NSString *)balance;

// 获取账户红包余额
- (NSString *)getAccountPresent;

// 设置账户红包余额
- (void)setAccountPresent:(NSString *)present;

//获取账户猫币
- (NSString*)getAccountGold;

//设置账户猫币
- (void)setAccountGold:(NSString*)gold;
// 获取账户积分
- (NSInteger)getAccountScore;

// 设置账户积分
- (void)setAccountScore:(NSInteger)score;

// 获取账户VIP等级
- (NSInteger)getAccountVIPLevel;

// 设置账户VIP等级
- (void)setAccountVIPLevel:(NSInteger)score;

// 获取25得45活动弹框次数
- (BOOL)getCZSActiveFlag;

// 获取百付宝活动是否显示弹框
- (NSInteger)getBFBActiveFlag;

// 设置百付宝活动弹框次数
- (void)setBFBActiveFlag:(NSInteger)score;

// 设置是否自动登录
- (void)setIsAutoLogin:(BOOL)isAutoLogin;
//获得渠道
- (NSString*)getQuDao;
//设置渠道
- (void)setQuDao:(NSString*)qudao;
// 获取绑定手机号
- (NSString*)getBindingMobile;

// 设置绑定手机号
- (void)setBindingMobile:(NSString*)mobile;

//是否绑定手机号
- (BOOL)getIsMobileBinded;
- (void)setIsMobileBinded:(BOOL)isBinded;

// 登录成功，保存用户名及密码
- (void)storeUserName:(NSString*)userName pwd:(NSString*)pwd;

// 保存userSession
- (void)storeUserSession:(NSString*)userSession;

// 保存userToken
- (void)storeUserToken:(NSString*)userToken;

// 保存userId
- (void)storeUserId:(NSString *)userId;

// 是否可以修改用户名
- (void)storeRsnct:(BOOL)rsnct;

// 获取参数
- (BOOL)rsnct;

// 获取用户名
- (NSString*)getUserName;

// 获取登录密码
- (NSString*)getPassWord;

// 获取userSession
- (NSString*)getUserSession;

// 获取userToken
- (NSString*)getUserToken;

// 获取userId
- (NSString *)getUserId;

//设置版本号
- (void)setVersion:(NSString *)version;
// 获取版本号
- (NSString *)getVersion;

// 保存deviceToken
- (void)storeDeviceToken:(NSString *)deviceToken;

// 获取deviceToken
- (NSString*)getDeviceToken;

// 保存已读通知id
- (void)storeReadedNoticeID:(NSArray *)array;

// 获取已读通知id
- (NSArray *)getReadedNoticeID;

// 保存已读个人消息id
- (void)storeReadedPersonID:(NSArray *)array;

// 获取已读个人消息id
- (NSArray *)getReadedPersonID;

// 保存各彩种进入时玩法选择
- (void)storePlayIndex:(NSInteger)playIndex LotteryID:(NSInteger)lotID;

// 获取各彩种进入时玩法选择
- (NSInteger)getPlayIndexOfLottery:(NSInteger)lotID;

// 保存购彩大厅彩种顺序
- (void)storeLotteryHallOrder:(NSDictionary *)lotteryOrder;

// 获取购彩大厅彩种顺序
- (NSDictionary *)getLotteryHallOrder;

// 设置主界面参数值
- (void)isMain:(NSNumber *)main;

// 获取参数
- (NSNumber *)isMain;

- (NSString *)SourceData;
- (NSDate *)SourceDate;
- (void)setSourceData:(NSString *)data date:(NSDate *)date;

// 设置支付参数值
- (void)setZhifuNames:(NSArray *)names icons:(NSArray *)icons details:(NSArray *)datails;

// 获取参数
- (NSArray *)ZhifuNames;
- (NSArray *)ZhifuPngs;
- (NSArray *)ZhifuDetails;

//个人头像
- (void)storeUserIconPath:(NSString*)path;
- (NSString*)getUserIconPath;

//显示活动试图
- (BOOL)isShowActivityView;

//显示合买提成规则
- (BOOL)isShowHMRuleView;

@end
