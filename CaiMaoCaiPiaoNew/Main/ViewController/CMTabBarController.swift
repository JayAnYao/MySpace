//
//  CMTabBarController.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/15.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

class CMTabBarController: UITabBarController,CMTabBarDelegate {

    var myTabBar:CMTabBar?
    
    static var shareManager:CMTabBarController {
        struct TabBar {
            static var instance:CMTabBarController = CMTabBarController()
        }
        return TabBar.instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //解决iOS11，仅实现heightForHeaderInSection，没有实现viewForHeaderInSection方法时,section间距大的问题
        UITableView.appearance().estimatedRowHeight = 0
        UITableView.appearance().estimatedSectionHeaderHeight = 0
        UITableView.appearance().estimatedSectionFooterHeight = 0
        
        //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
        }  //iOS11 解决SafeArea的问题，同时能解决pop时上级页面scrollView抖动的问题
    
        
        var rect = self.tabBar.bounds;
        if IsiPhoneX() {
            rect.size.height = rect.size.height + 34;
        }
        myTabBar = CMTabBar(frame:rect)
        myTabBar?.tabBarDelegate = self
        self.tabBar.addSubview(myTabBar!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Hide Tab Bar
    class func hideTabBar(isHide:Bool, viewController:UIViewController) {
        viewController.tabBarController?.tabBar.isHidden = isHide
    }
    
    // MARK: - CMTabBarDelegate
    func changeViewControllerIndex(from: Int, to: Int) {
        self.selectedIndex = to
    }
    
    // MARK: - Jump to Any ViewController
    func jump(to: Int, currentViewController:UIViewController) {
        
        let tabvc = currentViewController.tabBarController as! CMTabBarController
        tabvc.jump(to: 1)
    }
    
    func jump(to: Int) {
        myTabBar?.setupIndex(index:to)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
