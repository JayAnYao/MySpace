//
//  CMCycleScrollView.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/10/10.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

// 自定义传值闭包
typealias TapBlock = (Int, [CMHomePageItemModel]) -> Void

// 定时时间
let kAnimationTimeInterval:TimeInterval = 4

class CMCycleScrollView: UIView, UIScrollViewDelegate {

    /** 滚动视图*/
    var scrollView:UIScrollView?
    /** 分页控件*/
    var pageControl:UIPageControl?
    /** 当前页*/
    var currentPageIndex:NSInteger?
    /** 总页数*/
    var totalPageCount:NSInteger? {
        didSet {
            if totalPageCount! > 0 {
                pageControl?.numberOfPages = totalPageCount!
                pageControl?.currentPage = 0
            }
            
        }
    }
    /** 计时器*/
    var animationTimer:Timer?
    /** 传值闭包*/
    var postBlock:TapBlock?
    /** 数据源*/
    var dataArray:[CMHomePageItemModel]? {
        didSet {
            currentPageIndex = 0
            totalPageCount = dataArray?.count
            setInfoBy(currentPageIndex: currentPageIndex!)
            if (dataArray?.count)! > 1 {
                animationTimer?.resumeTimer(afterTimeInterval: kAnimationTimeInterval)
            }else {
                scrollView?.isScrollEnabled = false
            }
        }
    }
    /** 左视图*/
    var imgVLeft:UIImageView?
    /** 中视图*/
    var imgVCenter:UIImageView?
    /** 右视图*/
    var imgVRight:UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        animationTimer = Timer(timeInterval: kAnimationTimeInterval, target: self, selector: #selector(CMCycleScrollView.animationTimerDidFired(_:)), userInfo: nil, repeats: true)
        animationTimer?.pause()
        
        // 初始化滚动视图
        self.autoresizesSubviews = true
        scrollView = UIScrollView(frame: self.bounds)
        scrollView?.autoresizingMask = UIViewAutoresizing(rawValue: 0xFF)
        scrollView?.contentMode = UIViewContentMode.center
        scrollView?.contentSize = CGSize(width: 3 * kScreenWidth, height: frame.height)
        scrollView?.delegate = self
        scrollView?.contentOffset = CGPoint(x: kScreenWidth, y: 0)
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.isPagingEnabled = true
        self.addSubview(scrollView!)
        
        // 初始化分页控件
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 100, width: kScreenWidth, height: 10))
        self.addSubview(pageControl!)
        
        // 添加点击事件
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(CMCycleScrollView.viewClick(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(CMCycleScrollView.viewClick(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(CMCycleScrollView.viewClick(_:)))
        
        // 初始化图片视图
        imgVLeft = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: frame.height))
        imgVLeft?.isUserInteractionEnabled = true
        imgVLeft?.addGestureRecognizer(tapGesture1)
        self.addSubview(imgVLeft!)
        
        imgVCenter = UIImageView(frame: CGRect(x: kScreenWidth, y: 0, width: kScreenWidth, height: frame.height))
        imgVCenter?.isUserInteractionEnabled = true
        imgVCenter?.addGestureRecognizer(tapGesture2)
        self.addSubview(imgVCenter!)
        
        imgVRight = UIImageView(frame: CGRect(x: kScreenWidth * 2, y: 0, width: kScreenWidth, height: frame.height))
        imgVRight?.isUserInteractionEnabled = true
        imgVRight?.addGestureRecognizer(tapGesture3)
        self.addSubview(imgVRight!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 通过数据源进行页面处理
    func setInfoBy(currentPageIndex:NSInteger) {
        if dataArray?.count == 1 {
            let model = dataArray?[currentPageIndex]
            imgVCenter?.sd_setImage(with: URL(string:(model?.iconUrl)!), completed: nil)
        }else {
            let model1 = dataArray?[currentPageIndex]
            let model2 = dataArray?[((currentPageIndex - 1 + totalPageCount!) % totalPageCount!)]
            let model3 = dataArray?[((currentPageIndex + 1) % totalPageCount!)]
            
            imgVCenter?.sd_setImage(with: URL(string:(model1?.iconUrl)!), completed: nil)
            imgVLeft?.sd_setImage(with: URL(string:(model2?.iconUrl)!), completed: nil)
            imgVRight?.sd_setImage(with: URL(string:(model3?.iconUrl)!), completed: nil)
        }
        pageControl?.currentPage = currentPageIndex
    }
    
    func reloadImage() {
        let contentOffset = scrollView?.contentOffset
        if Float((contentOffset?.x)!)  >  Float((scrollView?.width)!){//向左滑动
            currentPageIndex = (currentPageIndex! + 1) % totalPageCount!
        }else if Float((contentOffset?.x)!)  <  Float((scrollView?.width)!){//向右滑动
            currentPageIndex = (currentPageIndex! - 1 + totalPageCount!) % totalPageCount!;
        }
        setInfoBy(currentPageIndex: currentPageIndex!)
    }
    
    // MARK: - 计时器事件
    func animationTimerDidFired(_ timer:Timer) {
        let newOffset = CGPoint(x: 2 * kScreenWidth, y: (scrollView?.contentOffset.y)!)
        scrollView?.setContentOffset(newOffset, animated: true)
    }
    
    // MARK: - 响应点击事件
    func viewClick(_ tapGesture:UITapGestureRecognizer) {
        if postBlock != nil {
            postBlock!(1, [CMHomePageItemModel()])
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        animationTimer?.pause()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        animationTimer?.resumeTimer(afterTimeInterval: kAnimationTimeInterval)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImage()
        
        scrollView.contentOffset = CGPoint(x: scrollView.width, y: 0)
        pageControl?.currentPage = currentPageIndex!
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        reloadImage()
        
        scrollView.contentOffset = CGPoint(x: scrollView.width, y: 0)
        pageControl?.currentPage = currentPageIndex!
    }
}
