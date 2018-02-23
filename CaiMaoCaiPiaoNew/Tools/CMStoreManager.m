//
//  CMStoreManager.m
//  CaiMoo
//
//  Created by huogh on 13-1-13.
//  Copyright (c) 2013年 infomedia. All rights reserved.
//

#import "CMStoreManager.h"
#import "SFHFKeychainUtils.h"

#define KeychainSerivceName         @"com.caimoo.app_servicename"
#define KeychainKeyUserName         @"KeychainKeyUserName"
#define KeychainKeyPassWord         @"KeychainKeyPassWord"
#define KeychainKeyUserSession      @"KeychainKeyUserSession"
#define KeychainKeyUserToken      @"KeychainKeyUserToken"
#define KeychainKeyUserId      @"KeychainKeyUserId"
#define KeychainKeyDeviceToken      @"KeychainKeyDeviceToken"
#define KeychainKeyReadedNoticeID        @"KeychainKeyReadedNoticeID"
#define KeychainKeyReadedPersonID        @"KeychainKeyReadedPersonID"

#define ShakeKey                    @"ShakeKey"
#define AutoLoginKey                @"AutoLoginKey"
#define FirstLoginKey               @"FirstLoginKey"
#define SeniorChartGuide   @"SeniorChartGuide"
#define UUID                        @"UUIDStr"

#define ChartIssueKey         @"ChartIssueKey "
#define ChartOrderKey        @"ChartOrderKey"
#define ChartPreSelectKey  @"ChartPreSelectKey"

#define AccountBalance              @"AccountBalance"
#define AccountPresent              @"AccountPresent"
#define AccountScore                @"AccountScore"
#define AccountGold                 @"AccountGold"
#define AccountVIP                  @"AccountVIP"
#define ActiveFalg                  @"ActiveFlag"
#define ActiveCZSFlag               @"ActiveCZSFlag"
#define BindingMobileKey            @"BindingMobileKey"
#define QuDaoFrome                  @"QuDaoFrome"

#define RootUrlKey                  @"rootUrl"
#define ZQRootUrlKey                @"zqrootUrl"
#define MoniRootUrlKey              @"monirootUrl"
#define ShareRootUrlKey             @"ShareRootUrlKey"
#define RefreshTime                 @"refreshTime"

#define LotteryPlayIndex            @"LotteryPlayIndex"
#define LotteryHallOrder                @"LotteryHallOrder"

#define IsMain                      @"isMain"

#define SOURCEDATE                  @"SOURCEDATE"
#define SOURCEDATA                  @"SOURCEDATA"

#define ZHIFUNAMES                  @"ZHIFUNAMES"
#define ZHIFUICONS                  @"ZHIFUICONS"
#define ZHIFUDETAILS                @"ZHIFUDETAILS"
#define CMSSGUIDEONE                @"CMSSGUIDEONE"
#define CMSSGUIDETWO                @"CMSSGUIDETWO"
#define CMMasterRewardGuide         @"CMMasterRewardGuide"
#define CM11x5ZMGuide               @"CM11x5ZMGuide"
#define UserIconPath                @"UserIconPath"
#define IsMobileBinded              @"IsMobileBinded"
#define VersionKey                  @"VersionKey"
#define IsShowActivityView          @"IsShowActivityView"
#define IsShowHMRuleView            @"IsShowHMRuleView"

@implementation CMStoreManager
{
    NSUserDefaults      *_userDefaults;
}
DEF_SINGLETON(CMStoreManager)

- (id)init {
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    
    return self;
}

// 高级图表期数设置
- (void)setChartIssueCount:(NSString *)count
{
    [[NSUserDefaults standardUserDefaults] setValue:count forKey:ChartIssueKey];
}

- (NSString *)getChartIssueCount
{
    NSString *shake = [[NSUserDefaults standardUserDefaults] objectForKey:ChartIssueKey];
    return shake;
}

// 高级图表显示顺序
- (void)setChartOrder:(NSString *)order
{
    [[NSUserDefaults standardUserDefaults] setValue:order forKey:ChartOrderKey];
}

- (NSString *)getChartOrder
{
    NSString *shake = [[NSUserDefaults standardUserDefaults] objectForKey:ChartOrderKey];
    return  shake;
}

// 高级图表预选区设置
- (void)setPreselect:(NSString *)preselect
{
    [[NSUserDefaults standardUserDefaults] setValue:preselect forKey:ChartPreSelectKey];
}

- (NSString *)getPreselect
{
    NSString *shake = [[NSUserDefaults standardUserDefaults] objectForKey:ChartPreSelectKey];
    return shake;
}

// 设置摇一摇
- (void)setShake:(NSString *)shake
{
    [[NSUserDefaults standardUserDefaults] setValue:shake forKey:ShakeKey];
}

- (BOOL)getShake
{
    NSString *shake = [[NSUserDefaults standardUserDefaults] objectForKey:ShakeKey];
    return [shake integerValue];
}

//加载图表引导
- (BOOL)isLoadChartGuide
{
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:SeniorChartGuide];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:SeniorChartGuide];
    }else{
        guide = NO;
    }
    return guide;
}
//中奖显示奖状
- (BOOL)isShowJiangzhuang :(NSInteger)schemeId{
    NSString *schemeIdStr = [NSString stringWithFormat:@"%ld",(long)schemeId];
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:schemeIdStr];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:schemeIdStr];
    }else{
        guide = NO;
    }
    return guide;
}
//加载彩猫晒晒引导
- (BOOL)isLoadCMSSGuideOne {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:CMSSGUIDEONE];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:CMSSGUIDEONE];
    }else{
        guide = NO;
    }
    return guide;
}
- (BOOL)isLoadCMSSGuideTwo {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:CMSSGUIDETWO];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:CMSSGUIDETWO];
    }else{
        guide = NO;
    }
    return guide;
}
- (BOOL)isLoadMasterRewardGuide {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:CMMasterRewardGuide];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:CMMasterRewardGuide];
    }else{
        guide = NO;
    }
    return guide;
}
- (BOOL)isShowShouYe11x5ZMGuide {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:CM11x5ZMGuide];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:CM11x5ZMGuide];
    }else{
        guide = NO;
    }
    return guide;
}

// 是否新版本
- (BOOL)versionIsFirstLogin {
    //当前版本
    NSString *softversion = [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]];
    softversion = [[softversion stringByReplacingOccurrencesOfString:@"."
                                                          withString:@""] substringToIndex:3];
    //原版本
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:FirstLoginKey];
    
    if ([version integerValue] < [softversion integerValue]) {
        return true;
    }
    return false;
}

// 设置版本号
- (void)setVersionIsFirstLogin {
    NSString *softversion = [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]];
    softversion = [[softversion stringByReplacingOccurrencesOfString:@"."
                                                          withString:@""] substringToIndex:3];
    
    [[NSUserDefaults standardUserDefaults] setValue:softversion forKey:FirstLoginKey];
}

// 是否已经登录
- (BOOL)isLogin {
    NSString *userSession = [self getUserSession];
    if ([userSession length] > 0) {
        return YES;
    }
    return NO;
}
// 是否自动登录
- (BOOL)isAutoLogin {
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:AutoLoginKey];
    if (number == nil) {
        return NO;
    }
    
    return [number boolValue];
}

// 设置是否自动登录
- (void)setIsAutoLogin:(BOOL)isAutoLogin {
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:isAutoLogin] forKey:AutoLoginKey];
}
// 设置UUID
- (void)setUUID
{
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    
        //去除 “-”
    result =[result stringByReplacingOccurrencesOfString:@"-" withString:@""];
    [SFHFKeychainUtils storeUsername:UUID andPassword:result forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

- (NSString *)getUUID {
     NSString *uuid = [SFHFKeychainUtils getPasswordForUsername:UUID andServiceName:KeychainSerivceName error:nil];
    if (!uuid && SIMULATOR == 1) {
        uuid = @"2834CB8C7A8C4A5794F8408E25DD5EF6";
    }
    return uuid;
}

//设置分享URL域名
+ (void)setShareUrl:(NSString *)str {
    if ([str length] == 0) {
        str = @"";
    }
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:ShareRootUrlKey];
}

//获得分享URL域名
+ (NSString *)getShareUrl {
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:ShareRootUrlKey];
    if ([url length] == 0) {
        url = @"";
    }
    return url;
}

//设置模拟URL域名
+ (void)setMoniURL:(NSString *)str {
    if ([str length] == 0) {
        str = @"";
    }
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:MoniRootUrlKey];
}

//获得模拟URL
+ (NSString *)getMoniURL {
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:MoniRootUrlKey];
    if ([url length] == 0) {
        url = @"";
    }
    
    return url;
}
//设置足球URL域名
+ (void)setZQURL:(NSString *)str
{
    if ([str length] == 0) {
        str = @"";
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:ZQRootUrlKey];
}

//获得足球URL
+ (NSString *)getZQURL
{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:ZQRootUrlKey];
    if ([url length] == 0) {
        url = @"";
    }
    
    return url;
}
//设置URL域名
+ (void)setURL:(NSString *)str
{
    if ([str length] == 0) {
        str = @"";
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:RootUrlKey];
}

//获得URL
+ (NSString *)getURL
{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:RootUrlKey];
    if ([url length] == 0) {
        url = @"";
    }
    
    return url;
}

+ (BOOL)isProductionEnvironment {
    BOOL isTrue;
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:RootUrlKey];
    if ([url isEqualToString:@"http://client.fcaimao.com"]||[url isEqualToString:@"http://client.caimoo.net"]) {
        isTrue = YES;
    }else {
        isTrue = NO;
    }
    return isTrue;
}
// 获得渠道号
- (NSString*)getQuDao {
    NSString *qudao = [[NSUserDefaults standardUserDefaults] objectForKey:QuDaoFrome];
    if ([qudao length] == 0) {
        qudao = @"";
    }
    
    return qudao;
}

// 设置渠道号
- (void)setQuDao:(NSString*)qudao {
    if ([qudao length] == 0) {
        qudao = @"";
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:qudao forKey:QuDaoFrome];
}

// 获取绑定手机号
- (NSString*)getBindingMobile {
    NSString *mobile = [[NSUserDefaults standardUserDefaults] objectForKey:BindingMobileKey];
    if ([mobile length] == 0) {
        mobile = @"";
    }
    
    return mobile;
}

// 设置绑定手机号
- (void)setBindingMobile:(NSString*)mobile {
    if ([mobile length] == 0) {
        mobile = @"";
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:mobile forKey:BindingMobileKey];
}

//是否绑定手机号
- (BOOL)getIsMobileBinded {
   BOOL isBinded = [[NSUserDefaults standardUserDefaults]boolForKey:IsMobileBinded];
    return isBinded;
}
- (void)setIsMobileBinded:(BOOL)isBinded {
    [[NSUserDefaults standardUserDefaults]setBool:isBinded forKey:IsMobileBinded];
}

//保存个人头像
- (void)storeUserIconPath:(NSString*)path {
    [_userDefaults setValue:path forKey:UserIconPath];
    [_userDefaults synchronize];
}
- (NSString*)getUserIconPath {
    NSString *path = [_userDefaults valueForKey:UserIconPath];
    return path;
}
// 登录成功，保存用户名及密码
- (void)storeUserName:(NSString*)userName pwd:(NSString*)pwd {
    if (userName == nil) {
        userName = @"";
    }
    
    if (pwd == nil) {
        pwd = @"";
    }
    
    [SFHFKeychainUtils storeUsername:KeychainKeyUserName andPassword:userName forServiceName:KeychainSerivceName updateExisting:YES error:nil];
    [SFHFKeychainUtils storeUsername:KeychainKeyPassWord andPassword:pwd forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

// 保存userSession
- (void)storeUserSession:(NSString*)userSession {
    if (userSession == nil) {
        userSession = @"";
    }
    //userSession = @"269626_b130672003a10c3c64d430d3b57c7569";
    [SFHFKeychainUtils storeUsername:KeychainKeyUserSession andPassword:userSession forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

// 保存userSession
- (void)storeUserToken:(NSString *)userToken {
    if (userToken == nil) {
        userToken = @"";
    }
    //userSession = @"269626_b130672003a10c3c64d430d3b57c7569";
    [SFHFKeychainUtils storeUsername:KeychainKeyUserToken andPassword:userToken forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

// 是否可以修改用户名
- (void)storeRsnct:(BOOL)rsnct
{
    if ([[CMStoreManager sharedInstance] getUserName]) {
        [[NSUserDefaults standardUserDefaults] setBool:rsnct forKey:[[CMStoreManager sharedInstance] getUserName]];
    }else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@""];
    }
    
    
}

// 获取参数
- (BOOL)rsnct
{
    if ([[CMStoreManager sharedInstance] getUserName]) {
        return [[NSUserDefaults standardUserDefaults] boolForKey:[[CMStoreManager sharedInstance] getUserName]];
    }else {
        return NO;
    }
    
}

- (void)storeUserId:(NSString *)userId
{
    if (userId == nil) {
        userId = @"";
    }
    [SFHFKeychainUtils storeUsername:KeychainKeyUserId andPassword:userId forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

- (NSString *)getUserId
{
    NSString *userId = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyUserId andServiceName:KeychainSerivceName error:nil];
    if (!userId && SIMULATOR == 1) {
        userId = @"11001";
    }
    return userId;
}

//设置版本号
- (void)setVersion:(NSString *)version {
    [[NSUserDefaults standardUserDefaults]setValue:version forKey:VersionKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
// 获取版本号
- (NSString *)getVersion
{
    NSString *versionStr = [[NSUserDefaults standardUserDefaults]objectForKey:VersionKey];
    if (versionStr.length == 0) {
        return Version;
    }else{
        return versionStr;
    }
    
}

// 保存devicetoken
- (void)storeDeviceToken:(NSString *)deviceToken
{
    if (deviceToken == nil) {
        deviceToken = @"";
    }
    [SFHFKeychainUtils storeUsername:KeychainKeyDeviceToken andPassword:deviceToken forServiceName:KeychainSerivceName updateExisting:YES error:nil];
}

// 获取devicetoken
- (NSString *)getDeviceToken
{
    NSString *deviceToken = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyDeviceToken andServiceName:KeychainSerivceName error:nil];
    return deviceToken;
}
// 保存已读通知id
- (void)storeReadedNoticeID:(NSArray *)array
{
    if ([array count]>0) {
        NSMutableString *tempStr = [[NSMutableString alloc] initWithCapacity:0];
        for (NSString *str in array) {
            [tempStr appendString:str];
            [tempStr appendString:@","];
        }
        [tempStr deleteCharactersInRange:NSMakeRange([tempStr length]-1, 1)];
        [SFHFKeychainUtils storeUsername:KeychainKeyReadedNoticeID andPassword:tempStr forServiceName:KeychainSerivceName updateExisting:YES error:nil];
    }
}

// 获取已读通知id
- (NSArray *)getReadedNoticeID
{
    NSString *tempStr = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyReadedNoticeID andServiceName:KeychainSerivceName error:nil];
    if ([tempStr length]<1) {
        return nil;
    }
    return [tempStr componentsSeparatedByString:@","];
}

// 保存已读个人消息id
- (void)storeReadedPersonID:(NSArray *)array
{
    if ([array count]>0) {
        NSMutableString *tempStr = [[NSMutableString alloc] initWithCapacity:0];
        for (NSString *str in array) {
            [tempStr appendString:str];
            [tempStr appendString:@","];
        }
        [tempStr deleteCharactersInRange:NSMakeRange([tempStr length]-1, 1)];
        [SFHFKeychainUtils storeUsername:KeychainKeyReadedPersonID andPassword:tempStr forServiceName:KeychainSerivceName updateExisting:YES error:nil];
    }
}

// 获取已读个人消息id
- (NSArray *)getReadedPersonID
{
    NSString *tempStr = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyReadedPersonID andServiceName:KeychainSerivceName error:nil];
    if ([tempStr length]<1) {
        return nil;
    }
    return [tempStr componentsSeparatedByString:@","];
}

// 获取用户名
- (NSString*)getUserName
{
    NSString *refreshTime = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyUserName andServiceName:KeychainSerivceName error:nil];
    return refreshTime;
}

// 获取登录密码
- (NSString*)getPassWord {
    NSString *pwd = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyPassWord andServiceName:KeychainSerivceName error:nil];
    return pwd;
}

// 获取userSession
- (NSString*)getUserSession {
    NSString *userSession = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyUserSession andServiceName:KeychainSerivceName error:nil];
    if (!userSession && SIMULATOR == 1) {
        userSession = @"269626_b130672003a10c3c64d430d3b57c7569";
    }
    return userSession;
}

// 获取userToken
- (NSString*)getUserToken {
    NSString *userToken = [SFHFKeychainUtils getPasswordForUsername:KeychainKeyUserToken andServiceName:KeychainSerivceName error:nil];
    
    return userToken;
}

// 获取账户余额
- (NSString *)getAccountBalance {
    NSString *number = [_userDefaults objectForKey:AccountBalance];
    if (number == nil) {
        return 0;
    }
    
    return number;
}

// 设置账户余额
- (void)setAccountBalance:(NSString *)balance {
    //NSString *balanceStr = [NSString stringWithFormat:@"%lf",balance];
    NSArray *balanceArray = [balance componentsSeparatedByString:@"."];
    NSString *str1 = nil;
    NSString *str2 = nil;
    NSString *str3 = nil;
    if ([balanceArray count]>0) {
        str1 = [balanceArray objectAtIndex:0];
    }
//    if ([balanceArray count]>1) {
//        str2 = [balanceArray objectAtIndex:1];
//        str2 = [str2 substringToIndex:1];
//        
//    }
//    NSString *resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
    NSString *resault = nil;
    if ([balanceArray count]>1) {
        NSString *tempstr2 = [balanceArray objectAtIndex:1];
        str2 = [tempstr2 substringToIndex:1];
        str3 = [tempstr2 substringToIndex:2];
        
        if ([str3 intValue]==0) {
            resault = [NSString stringWithFormat:@"%@",str1];
        }else if ([str3 intValue]!=0) {
            if([str3 intValue]==[str2 intValue]*10)
            {
            resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
            }else{
                resault = [NSString stringWithFormat:@"%@.%@",str1,str3];
            }
        }
    }
   // balance = [resault floatValue];
    
    [_userDefaults setValue:resault forKey:AccountBalance];
    [_userDefaults synchronize];
}

- (void)setAccountGold:(NSString *)gold {
    NSArray *goldArray = [gold componentsSeparatedByString:@"."];
    NSString *str1 = nil;
    NSString *str2 = nil;
    NSString *str3 = nil;
    if ([goldArray count]>0) {
        str1 = [goldArray objectAtIndex:0];
    }
    //    if ([balanceArray count]>1) {
    //        str2 = [balanceArray objectAtIndex:1];
    //        str2 = [str2 substringToIndex:1];
    //
    //    }
    //    NSString *resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
    NSString *resault = nil;
    if ([goldArray count]>1) {
        NSString *tempstr2 = [goldArray objectAtIndex:1];
        str2 = [tempstr2 substringToIndex:1];
        str3 = [tempstr2 substringToIndex:2];
        
        if ([str3 intValue]==0) {
            resault = [NSString stringWithFormat:@"%@",str1];
        }else if ([str3 intValue]!=0) {
            if([str3 intValue]==[str2 intValue]*10)
            {
                resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
            }else{
                resault = [NSString stringWithFormat:@"%@.%@",str1,str3];
            }
        }
    }
    
    [_userDefaults setValue:resault forKey:AccountGold];
    [_userDefaults synchronize];
}
- (NSString*)getAccountGold {
    NSString *number = [_userDefaults objectForKey:AccountGold];
    if (number == nil) {
        return 0;
    }
    return number;
}
// 获取账户红包余额
- (NSString *)getAccountPresent {
    NSString *number = [_userDefaults objectForKey:AccountPresent];
    if (number == nil) {
        return 0;
    }
    return number;
}

// 设置账户红包余额
- (void)setAccountPresent:(NSString *)present {
    //NSString *presentStr = [NSString stringWithFormat:@"%lf",balance];
    NSArray *presentArray = [present componentsSeparatedByString:@"."];
    NSString *str1 = nil;
    NSString *str2 = nil;
    NSString *str3 = nil;
    if ([presentArray count]>0) {
        str1 = [presentArray objectAtIndex:0];
    }
    //    if ([balanceArray count]>1) {
    //        str2 = [balanceArray objectAtIndex:1];
    //        str2 = [str2 substringToIndex:1];
    //
    //    }
    //    NSString *resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
    NSString *resault = nil;
    if ([presentArray count]>1) {
        NSString *tempstr2 = [presentArray objectAtIndex:1];
        str2 = [tempstr2 substringToIndex:1];
        str3 = [tempstr2 substringToIndex:2];
        
        if ([str3 intValue]==0) {
            resault = [NSString stringWithFormat:@"%@",str1];
        }else if ([str3 intValue]!=0) {
            if([str3 intValue]==[str2 intValue]*10)
            {
                resault = [NSString stringWithFormat:@"%@.%@",str1,str2];
            }else{
                resault = [NSString stringWithFormat:@"%@.%@",str1,str3];
            }
        }
    }
    
    [_userDefaults setValue:resault forKey:AccountPresent];
    [_userDefaults synchronize];
}

// 获取账户积分
- (NSInteger)getAccountScore {
    NSNumber *number = [_userDefaults objectForKey:AccountScore];
    if (number == nil) {
        return 0;
    }
    
    return [number intValue];
}

// 设置账户积分
- (void)setAccountScore:(NSInteger)score {
    [_userDefaults setValue:[NSNumber numberWithInteger:score] forKey:AccountScore];
    [_userDefaults synchronize];
}

// 获取账户VIP等级
- (NSInteger)getAccountVIPLevel
{
    NSNumber *number = [_userDefaults objectForKey:AccountVIP];
    if (number == nil) {
        return 0;
    }
    
    return [number intValue];
}

// 设置账户VIP等级
- (void)setAccountVIPLevel:(NSInteger)score
{
    [_userDefaults setValue:[NSNumber numberWithInteger:score] forKey:AccountVIP];
    [_userDefaults synchronize];
}

/*
// 获取25得45活动弹框次数
- (BOOL)getCZSActiveFlag {
    NSDictionary *dicMob = [MobClick getConfigParams];
    if ([[dicMob objectForKey:@"25de45"] intValue] == 0) {
        return NO;
    }
    
    NSNumber *number = [_userDefaults objectForKey:ActiveCZSFlag];
    if (number == nil) {
        [_userDefaults setValue:[NSNumber numberWithInt:1] forKey:ActiveCZSFlag];
        return YES;
    }
    
    return NO;
}
*/

// 获取百付宝活动弹框次数
- (NSInteger)getBFBActiveFlag {
    NSNumber *number = [_userDefaults objectForKey:ActiveFalg];
    if (number == nil) {
        return 0;
    }
    
    return [number intValue];
}

// 设置百付宝活动弹框次数
- (void)setBFBActiveFlag:(NSInteger)score {
    [_userDefaults setValue:[NSNumber numberWithInteger:score] forKey:ActiveFalg];
    [_userDefaults synchronize];
}

// 保存各彩种进入时玩法选择
- (void)storePlayIndex:(NSInteger)playIndex LotteryID:(NSInteger)lotID
{
    NSArray *saveArray = [_userDefaults objectForKey:LotteryPlayIndex];
    NSMutableArray *resaultArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<[saveArray count]; i++) {
        NSDictionary *tempDict = [saveArray objectAtIndex:i];
        CMLog(@"----%d",[[[tempDict allKeys] objectAtIndex:0] intValue]);
        if ([[[tempDict allKeys] objectAtIndex:0] intValue] == lotID) {
            NSDictionary *tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%ld",(long)playIndex],[NSString stringWithFormat:@"%ld",(long)lotID], nil];
            [resaultArray addObject:tempDic];
        }else{
            [resaultArray addObject:[saveArray objectAtIndex:i]];
        }
    }
    [_userDefaults setValue:resaultArray forKey:LotteryPlayIndex];
}

/*
// 获取各彩种进入时玩法选择
- (NSInteger)getPlayIndexOfLottery:(NSInteger)lotID
{
    int index = 0;
    NSArray *saveArray = [_userDefaults objectForKey:LotteryPlayIndex];
    //已保存的彩种，当保存的彩种数与当前彩种数相等时
    if([saveArray count]>0 && [saveArray count] == [[[CMLotteryData sharedInstance] getLotteryData] count]){
        for (int i=0; i<[saveArray count]; i++) {
            NSDictionary *tempDic = [saveArray objectAtIndex:i];
            NSArray *tempKeyArray = [tempDic allKeys];
            if ([[tempKeyArray objectAtIndex:0] intValue] == lotID) {
                index = [[tempDic objectForKey:[tempKeyArray objectAtIndex:0]] intValue];
                break;
            }
        }
    }
    else{
        NSArray *lottery = [[CMLotteryData sharedInstance] getLotteryData];
        NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i=0; i<[lottery count]; i++) {
            CMLotteryTicket *tempLottery = [lottery objectAtIndex:i];
            NSDictionary *tempDic = nil;
            if (tempLottery.m_ltid == CMLotteryIDJCZQ) {
                tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"5",[NSString stringWithFormat:@"%d",tempLottery.m_ltid], nil];
            }else if (tempLottery.m_ltid == CMLotteryIDJCLQ) {
                tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"4",[NSString stringWithFormat:@"%d",tempLottery.m_ltid], nil];
            }else if (tempLottery.m_ltid == CMLotteryIDLQDG) {
                tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"0",[NSString stringWithFormat:@"%d",tempLottery.m_ltid], nil];
            }else{
                tempDic = [[NSDictionary alloc] initWithObjectsAndKeys:@"0",[NSString stringWithFormat:@"%d",tempLottery.m_ltid], nil];
            }
            [tempArray addObject:tempDic];
        }
        [_userDefaults setValue:tempArray forKey:LotteryPlayIndex];
    }
    return index;
}
*/

// 保存购彩大厅彩种顺序
- (void)storeLotteryHallOrder:(NSDictionary *)lotteryOrder
{
    if ([lotteryOrder count]>0) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:lotteryOrder];
        [[NSUserDefaults standardUserDefaults] setValue:data forKey:LotteryHallOrder];
    }
}

// 获取购彩大厅彩种顺序
- (NSDictionary *)getLotteryHallOrder
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:LotteryHallOrder];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return dict;
}

#pragma mark - plist文件路径
-(NSString *)get_filename:(NSString *)name
{
    NSString *str = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
                     stringByAppendingPathComponent:name];
   
    return str;
}

-(BOOL)is_file_exist:(NSString *)name
{
    NSFileManager *file_manager = [NSFileManager defaultManager];
    return [file_manager fileExistsAtPath:[self get_filename:name]];
}

// 设置主界面参数值
- (void)isMain:(NSNumber *)main
{
    [[NSUserDefaults standardUserDefaults] setObject:main forKey:IsMain];
}

// 获取参数
- (NSNumber *)isMain
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:IsMain];
}

/** 获取数据*/
- (NSString *)SourceData
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SOURCEDATA];
}

/** 获取保存数据的时间*/
- (NSDate *)SourceDate
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:SOURCEDATE];
}

/** 保存数据*/
- (void)setSourceData:(NSString *)data date:(NSDate *)date
{
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:SOURCEDATE];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:SOURCEDATA];
}

- (void)setZhifuNames:(NSArray *)names icons:(NSArray *)icons details:(NSArray *)datails
{
    [[NSUserDefaults standardUserDefaults] setObject:names forKey:ZHIFUNAMES];
    [[NSUserDefaults standardUserDefaults] setObject:icons forKey:ZHIFUICONS];
    [[NSUserDefaults standardUserDefaults] setObject:datails forKey:ZHIFUDETAILS];
}

- (NSArray *)ZhifuNames
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:ZHIFUNAMES];
}
- (NSArray *)ZhifuPngs
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:ZHIFUICONS];
}
- (NSArray *)ZhifuDetails
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:ZHIFUDETAILS];
}

//显示活动试图
- (BOOL)isShowActivityView {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:IsShowActivityView];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:IsShowActivityView];
    }else{
        guide = NO;
    }
    return guide;
}

//显示合买提成规则
- (BOOL)isShowHMRuleView {
    BOOL guide = YES;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:IsShowHMRuleView];
    if ([str length] == 0) {
        guide = YES;
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:IsShowHMRuleView];
    }else{
        guide = NO;
    }
    return guide;
}

@end
