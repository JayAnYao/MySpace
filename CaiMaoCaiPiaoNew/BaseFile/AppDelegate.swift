//
//  AppDelegate.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/14.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    var myToken: String? // token string
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        // 初始化
        if CMStoreManager.getURL() == nil {
            CMStoreManager.setURL(ROOT_URL)
        }
        if CMStoreManager.getZQURL() == nil {
            CMStoreManager.setZQURL(rootUrl)
        }
        if CMStoreManager.getMoniURL() == nil {
            CMStoreManager.setMoniURL(MoniUrl)
        }
        if CMStoreManager.getShareUrl() == nil {
            CMStoreManager.setShareUrl(ShareUrl)
        }
        CMStoreManager.sharedInstance().setQuDao(FROMSOURCE)
        
        // umeng统计初始化
        signUpUmengStatistics()
        
        // umeng分享初始化
        initUmengShare()
        
        // uemng推送初始化
        initUmengPush(launchOptions: launchOptions)
        
        return true
    }

    //MARK: - sign up umeng statistics
    func signUpUmengStatistics() {
        
        let umConfig = UMAnalyticsConfig.sharedInstance()
        // 新的彩票appkey
        umConfig?.appKey = UMAppKey
        umConfig?.channelId = CMStoreManager.sharedInstance().getQuDao()
        
        // 开始友盟统计服务
        MobClick.start(withConfigure: umConfig)
    }
    
    //MARK: - umeng share initialize
    func initUmengShare() {
        // 打开调试日志
        UMSocialManager.default().openLog(true)
        
        // 设置友盟appkey
        UMSocialManager.default().umSocialAppkey = UMAppKey
        
        // 配置分享组件
        configUSharePlatforms()
        
        // 配置分享设置（可选）
        confitUShareSettings()
    }
    
    /// Config UShare Platforms
    func configUSharePlatforms() {
        /*
         设置微信的appKey和appSecret
         */
        UMSocialManager.default().setPlaform(UMSocialPlatformType.wechatSession, appKey: "wxdc1e388c3822c80b", appSecret: "3baf1193c85774b3fd9d18447d76cab0", redirectURL: nil)
        
        /*
         * 移除相应平台的分享，如微信收藏
         */
        //UMSocialManager.default().removePlatformProvider(with: UMSocialPlatformType.wechatFavorite)
        
        
        /* 设置分享到QQ互联的appID
         * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
         */
        UMSocialManager.default().setPlaform(UMSocialPlatformType.QQ, appKey: "1105821097", appSecret: nil, redirectURL: "http://www.fcaimao.com")
        
        /*
         设置新浪的appKey和appSecret
         */
        UMSocialManager.default().setPlaform(UMSocialPlatformType.sina, appKey: "3921700954", appSecret: "04b48b094faeb16683c32669824ebdad", redirectURL: "https://sns.whalecloud.com/sina2/callback")
        
        /* 支付宝的appKey */
        UMSocialManager.default().setPlaform(UMSocialPlatformType.alipaySession, appKey: "2015111700822536", appSecret: nil, redirectURL: nil)
    }
    
    /// Confit UShare Settings
    func confitUShareSettings() {
        /*
         * 打开图片水印
         */
        //UMSocialGlobal.shareInstance().isUsingWaterMark = true
        
        
        /*
         * 关闭强制验证https，可允许http图片分享
         */
        UMSocialGlobal.shareInstance().isUsingHttpsWhenShareContent = false
    }
    
    /* 隐藏 参考
    /// share demo 
    func shareWebPageToPlatformType(platformType:UMSocialPlatformType) {
        //创建分享消息对象
        let messageObject = UMSocialMessageObject.init()
        
        //创建网页内容对象
        let thumbURL = "https://mobile.umeng.com/images/pic/home/social/img-1.png"
        let shareObject = UMShareWebpageObject.shareObject(withTitle: "欢迎使用【友盟+】社会化组件U-Share", descr: "欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！", thumImage: thumbURL)
        //设置网页地址
        shareObject?.webpageUrl = "http://mobile.umeng.com/social"
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject
        
        //调用分享接口
        UMSocialManager.default().share(to: platformType, messageObject: messageObject, currentViewController: self.window?.rootViewController) { (data:Any?, error:Error?) in
            
            if (error != nil) {
                print("************Share fail with error\(String(describing: error))*********" )
            }else{
                
                if data is UMSocialShareResponse {
                    let resp = data as! UMSocialShareResponse
                    
                    //分享结果消息
                    print("response message is \(resp.message)")
                    
                    //第三方原始返回的数据
                    print("response originalResponse data is \(resp.originalResponse)")
                }else{
                    print("response data is \(String(describing: data))")
                }
            }
        }
    }
    */

    //MARK: - umeng push initialize
    func initUmengPush(launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        // 注册友盟
        UMessage.start(withAppkey: UMAppKey, launchOptions: launchOptions, httpsenable: true)
        
        // 注册通知
        UMessage.registerForRemoteNotifications()
        
        // 打开日志
        UMessage.setLogEnabled(true)
    
        //iOS10必须加下面这段代码。
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let types10:UNAuthorizationOptions = [.badge, .alert, .sound]
        
        center.requestAuthorization(options: types10) { (granted:Bool, error:Error?) in
            if granted {
                //点击允许
                //这里可以添加一些自己的逻辑
            }else {
                //点击不允许
                //这里可以添加一些自己的逻辑
            }
        }
        
    }
    
    //MARK: - application system
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let result = UMSocialManager.default().handleOpen(url, options: options)
        if !result {
            
        }
        return result
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let result = UMSocialManager.default().handleOpen(url, sourceApplication: sourceApplication, annotation: annotation)
        if !result {
            
        }
        return result
    }
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        let result = UMSocialManager.default().handleOpen(url)
        if !result {
            
        }
        return result
    }
    
    //MARK: - Push System
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("My token is: \(deviceToken)");
        
        var token = String(describing: deviceToken)
        var tokenArray = token.components(separatedBy: "<")
        token = tokenArray[1]
        tokenArray = token.components(separatedBy: ">")
        token = tokenArray[0]
        tokenArray = token.components(separatedBy: " ")
        
        let tokenResault = NSMutableString.init(capacity: 1)
        for str in tokenArray {
            tokenResault.append(str)
        }
        myToken = tokenResault as String
        if myToken?.characters.count == 0 {
            myToken = "0"
        }
        CMStoreManager.sharedInstance().storeDeviceToken(myToken!)
        sendDeviceToken()
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    //MARK: - UNUserNotificationCenterDelegate
    //ios10新增：处理前台收到通知的代理方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if notification.request.trigger is UNPushNotificationTrigger {
            //应用处于前台时的远程推送接受
            //关闭U-Push自带的弹出框
            UMessage.setAutoAlert(false)
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)
        }else {
            //应用处于前台时的本地推送接收
        }
        completionHandler([.sound,.alert,.badge])
    }
    
    //ios10新增：处理后台点击通知的代理方法
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if response.notification.request.trigger is UNPushNotificationTrigger {
            //应用处于后台时的远程推送接受
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)
        }else {
            //应用处于后台时的本地推送接收
        }
    }
    
    /// send device token to client
    func sendDeviceToken() {
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CaiMaoCaiPiaoNew")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

