//
//  CMBaseViewController.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/15.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit
import CRRefresh

let kNavigationTheme = "NavigationTheme"
let kBackgroundTheme = "BackgroundTheme"

class CMBaseViewController: UIViewController,CMPersonInfoViewDelegate {

    var isOpen:Bool = false
    var personInfo:CMPersonInfoView! = nil
    var titleLabel:UILabel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barBtn = UIButton(type: UIButtonType.custom)
        barBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        barBtn.addTarget(self, action: #selector(CMBaseViewController.barBtnClick(_:)), for: UIControlEvents.touchUpInside)
        barBtn.backgroundColor = UIColor.red
        let barBtnItem = UIBarButtonItem(customView: barBtn)
        
        self.navigationItem.leftBarButtonItem = barBtnItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 默认颜色
        let navigationBarDic =  UserDefaults.standard.dictionary(forKey: kNavigationTheme)
        let backgroundDic = UserDefaults.standard.dictionary(forKey: kBackgroundTheme)
        
        if navigationBarDic == nil {
            self.navigationController?.navigationBar.barTintColor = RGBHexColor.color(withHexString: "#f6140b")
        }else {
            changeNavigationBar(themeDic: navigationBarDic!)
        }
        if backgroundDic == nil {
            view.backgroundColor = RGBHexColor.color(withHexString: "#FFFFF0")
        }else {
            changeBackground(themeDic: backgroundDic!)
        }
        
        // 添加通知
        NotificationCenter.default.addObserver(self, selector: #selector(CMBaseViewController.changeNavigationBarTheme(_:)), name: NSNotification.Name(rawValue: kChangeNavigationBarTheme), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CMBaseViewController.changeBackgroundTheme(_:)), name: NSNotification.Name(rawValue: kChangeBackgroundTheme), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Called when barBtn is clicked
    func barBtnClick(_ sender:UIButton) {
        if self.isOpen == false {
            openPersonView()
        }else {
            hidePersonView()
        }
    }
    
    // MARK: - Hide PersonView
    func hidePersonView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBarController?.view.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
            self.personInfo.frame = CGRect(x: 100-kScreenWidth, y: 0, width: kScreenWidth-100, height: kScreenHeight)
        }) { (true) in
            self.isOpen = false
            self.personInfo.removeFromSuperview()
        }
    }
    
    //MARK: - Open PersionView
    func openPersonView() {
        self.isOpen = true
        personInfo = CMPersonInfoView(frame: CGRect(x: 100-kScreenWidth, y: 0, width: kScreenWidth-100, height: kScreenHeight))
        personInfo.personInfoDelegate = self
        let window = UIApplication.shared.keyWindow
        window?.addSubview(personInfo)
        
        UIView.animate(withDuration: 0.3) {
            self.tabBarController?.view.frame = CGRect(x: Int(kScreenWidth-100), y: 0, width: Int(kScreenWidth), height: Int(kScreenHeight))
            self.personInfo.frame = CGRect(x: 0, y: 0, width: kScreenWidth-100, height: kScreenHeight)
        }
    }
    
    //MARK: - CMPersonInfoViewDelegate
    func settingSelecte() {
        hidePersonView()
        
        let page = CMThemeSettingController()
        self.navigationController?.pushViewController(page, animated: true)
    }
    //MARK: - 设置标题
    func setNavTitle(title:String) {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 165,height: 44))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(NavigationTitleFont))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = UIColor.white
        titleLabel.text = title
        self.navigationItem.titleView = titleLabel
    }
    
    // MARK: - 通过通知修改导航栏主题
    func changeNavigationBarTheme(_ sender:Notification) {
        
        let dic = sender.userInfo
        changeNavigationBar(themeDic: dic!)
        
        saveTheme(dic: dic!, key: kNavigationTheme)
    }
    func changeNavigationBar(themeDic:[AnyHashable:Any]) {
        let dic = themeDic["model"] as! [AnyHashable:Any]
        let type = themeDic["type"] as! String
        
        let themeModel = CMThemeModel.themeModel(dic: dic)
        
        if type == "image" {
            // 创建URL对象
            let url = URL(string: themeModel.themeNavigationBarImageUrl!)
            // 获取图片
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
            } catch {
                print(error)
            }
        }else {
            navigationController?.navigationBar.barTintColor = RGBHexColor.color(withHexString: themeModel.themeNavigationBarColor)
        }
        
        titleLabel.textColor = RGBHexColor.color(withHexString: themeModel.themeNavigationBarTitleColor)
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(themeModel.themeNavigationBarTitleFont!))
    }
    
    // MARK: - 通过通知修改背景主题
    func changeBackgroundTheme(_ sender:Notification) {
        
        let dic = sender.userInfo
        changeBackground(themeDic: dic!)
        
        saveTheme(dic: dic!, key: kBackgroundTheme)
    }
    func changeBackground(themeDic:[AnyHashable:Any]) {
        
        let dic = themeDic["model"] as! [AnyHashable:Any]
        let type = themeDic["type"] as! String
        
        let themeModel = CMThemeModel.themeModel(dic: dic)
        
        if type == "image" {
            // 创建URL对象
            let url = URL(string: themeModel.themeBackgroundImageUrl!)
            // 获取图片
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data)
                self.view.backgroundColor = UIColor(patternImage: image!)
            } catch {
                print(error)
            }
        }else {
            view.backgroundColor = RGBHexColor.color(withHexString: themeModel.themeBackgroundColor)
        }
    }
    
    func saveTheme(dic:[AnyHashable:Any], key:String) {
        let userDefault = UserDefaults.standard
        userDefault.set(dic, forKey: key)
        userDefault.synchronize()
    }
}

struct Refresh {
    var model: Model
    var header: Style
    var footer: Style
    struct Model {
        var icon: UIImage
        var title: String
        var subTitle: String
    }
    
    enum Style {
        // 普通刷新类
        case nomalHead
        case nomalFoot
        // slackLoading刷新控件
        case slackLoading
        // ramotion动画
        case ramotion
        
        func commont() -> CRRefreshProtocol {
            switch self {
            case .nomalHead:
                return NormalHeaderAnimator()
            case .nomalFoot:
                return NormalFooterAnimator()
            case .slackLoading:
                return SlackLoadingAnimator()
            case .ramotion:
                return RamotionAnimator()
            }
        }
    }
}
