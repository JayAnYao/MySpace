//
//  CMTabBar.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/21.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

let kTabBarButtonNumber = 4
let kTabBarButtonTag = 445566

protocol CMTabBarDelegate:NSObjectProtocol {
    func changeViewControllerIndex(from:Int, to:Int)
}

class CMTabBar: UITabBar {

    weak var tabBarDelegate: CMTabBarDelegate?
    
    var tabBarBackgroundImageView:UIImageView?
    var currentBtn:CMBarButton?
    
    var isFirstView:Bool?
    
    var isImage:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        let rect = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
//        UIGraphicsBeginImageContext(rect.size);
//        let context = UIGraphicsGetCurrentContext();
//        context!.setFillColor(UIColor.clear.cgColor);
//        context!.fill(rect);
//        let img = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.backgroundImage = img
//        self.shadowImage = img
        
        NotificationCenter.default.addObserver(self, selector: #selector(CMTabBar.changeTabBarTheme(_:)), name: NSNotification.Name(rawValue: kChangeTabBarTheme), object: nil)
        
        tabBarBackgroundImageView = UIImageView(frame: self.bounds)
        tabBarBackgroundImageView?.backgroundColor = UIColor.white
        tabBarBackgroundImageView?.contentMode = UIViewContentMode.scaleAspectFit
        tabBarBackgroundImageView?.isUserInteractionEnabled = true
        self.addSubview(tabBarBackgroundImageView!)
        
        let titles:[String] = [NSLocalizedString("home", comment: ""),NSLocalizedString("draw", comment: ""),NSLocalizedString("discover", comment: ""),NSLocalizedString("me", comment: "")]
        let normalImages:[String] = ["home_normal","lotteryhall_normal","discovery_normal","my_normal"]
        let selectedImages:[String] = ["home_pressed","lotteryhall_pressed","discovery_pressed","my_pressed"]
        
        for i in 0 ..< titles.count {
            let barBtn = CMBarButton.init()
            let btnW:CGFloat = kScreenWidth / CGFloat(kTabBarButtonNumber)
            let btnH:CGFloat = 49
            let btnX:CGFloat = CGFloat(i) * btnW
            let btnY:CGFloat = 0
            
            barBtn.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
            barBtn.tag = kTabBarButtonTag + i
            barBtn.setTitle(titles[i], for: UIControlState.normal)
            barBtn.setTitleColor(RGBCOLOR(r: 180, g: 180, b: 180), for: UIControlState.normal)
            barBtn.setTitleColor(RGBCOLOR(r: 217, g: 50, b: 50), for: UIControlState.disabled)
            
            let normalImage = UIImage(named: normalImages[i])
            let selectedImage = UIImage(named: selectedImages[i])
            
            barBtn.setImage(normalImage, for: UIControlState.normal)
            barBtn.setImage(selectedImage, for: UIControlState.disabled)
            barBtn.addTarget(self, action: #selector(CMTabBar.barBtnClick(_:)), for: UIControlEvents.touchUpInside)
            self.addSubview(barBtn)
            
            if i == 0 {
                isFirstView = true
                barBtnClick(barBtn)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ScaleImage
    func scaleToSize(image:UIImage, size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, kScreenScale)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage!
    }
    
    /// Call bar button is clicked
    func barBtnClick(_ sender:CMBarButton) {
        tabBarDelegate?.changeViewControllerIndex(from: ((currentBtn?.tag)! - kTabBarButtonTag), to: sender.tag - kTabBarButtonTag)
        
        currentBtn?.isEnabled = true
        currentBtn = sender
        sender.isEnabled = false
        
        if isFirstView == true {
            isFirstView = false
            return
        }
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.2)
        UIView.setAnimationDelegate(self)
        UIView.commitAnimations()
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 0.50
        animation.isRemovedOnCompletion = true;
        animation.fillMode = kCAFillModeForwards
        
        var values = [Any]()
        
        values.append(NSValue.init(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 1.0)))
        values.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.0)))
        values.append(NSValue.init(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9)))
        values.append(NSValue.init(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)))
        
        animation.values = values
        sender.imageView?.layer.add(animation, forKey: nil)
    }
    
    func setupIndex(index:Int) {
        let barBtn = self.viewWithTag(kTabBarButtonTag+index) as! CMBarButton
        barBtnClick(barBtn)
    }

    //MARK: - 改变tabBar主题
    func changeTabBarTheme(_ sender:NSNotification) {
//        let userInfo = sender.userInfo as! [String:AnyObject]
//        let themeModel = userInfo["model"] as! CMThemeModel
//        let type = userInfo["type"] as! String
//        
//        if type == "image" {
//            self.tabBarBackgroundImageView?.image = themeModel.themeTabbarBackgroundImage
//        }else {
//            self.backgroundColor = themeModel.themeTabbarBackgroundColor
//        }
//        
//        
//        
//        let normalImages = themeModel.themeTabbarItemNormalImages
//        let selectedImages = themeModel.themeTabbarItemSelectedImages
//        
//        for i in 0 ..< kTabBarButtonNumber {
//            print(i)
//            let barBtn = self.viewWithTag(kTabBarButtonTag+i) as! CMBarButton
//            barBtn.setImage(normalImages?[i], for: UIControlState.normal)
//            barBtn.setImage(selectedImages?[i], for: UIControlState.disabled)
//            barBtn.setTitleColor(themeModel.themeTabbarItemNameNormalColor, for: UIControlState.normal)
//            barBtn.setTitleColor(themeModel.themeTabbarItemNameSelectedColor, for: UIControlState.disabled)
//        }
    }
}
