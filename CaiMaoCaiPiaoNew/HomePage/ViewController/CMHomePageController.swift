//
//  CMHomePageController.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/21.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit
import CRRefresh

class CMHomePageController: CMBaseViewController {

    var tableView:UITableView?
    var homeItemData:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeItemData = NSMutableArray(array: UIFont.familyNames)
        
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        var arr = CMLotteryData.shared.getAllLotterys()
        print(arr)
        
        arr = CMLotteryData.shared.removeLotteryInArrray(lotteryId: CMLotteryIDJCLQ)
        print(arr)
        
        
        setNavTitle(title: "主页")
        
        let label = CMChangeLabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 40));
        label.textAlignment = .center
        label.text = "I think J need English!"
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.clear
        self.view.addSubview(label);
        
        let sycleView = CMCycleScrollView()
        sycleView.postBlock = {(index,data)  in
            
        }
        
        tableViewInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - TableView Init
    func tableViewInit() {
        tableView = UITableView(frame: CGRect(x: 0, y: 40, width: view.frame.size.width, height: kScreenHeight-cutValue-40), style: .grouped)
        view.addSubview(tableView!)
        tableView?.delegate   = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.clear
        tableView?.separatorStyle = .none
        tableView?.estimatedRowHeight = 0
        tableView?.estimatedSectionHeaderHeight = 0
        tableView?.estimatedSectionFooterHeight = 0
    }
}

// MARK: - Table view data source
extension CMHomePageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let fontName:String = homeItemData?[indexPath.row] as! String
        
        let fontSize = "\(20)"
        
        let textColorHex = "#E3A4F6"
        
        let dict = ["fontName":fontName,"fontSize":fontSize,"textColorHex":textColorHex]
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kChangeFont), object: nil, userInfo: dict)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (homeItemData?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if indexPath.section == 0 {
            let cycleScroll = CMCycleScrollView()
            cell?.addSubview(cycleScroll)
        }
        
        cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        cell?.selectionStyle = .gray
        
        cell?.textLabel?.text = homeItemData?[indexPath.row] as? String
        cell?.detailTextLabel?.text = "\(indexPath.row)"
        
        let spator = UIView(frame:CGRect(x:0, y:43, width:kScreenWidth, height:1))
        spator.backgroundColor = RGBCOLOR(r: 220, g: 220, b: 220)
        cell?.contentView.addSubview(spator)
        
        return cell!
    }
//MARK: - 请求数据
    func requestList() {
        let params = NSMutableDictionary.init()
        params.addEntries(from: ["addLottery":"10059"])
        
        CMNetWorkManager.request(with: HttpRequestType.get, withUrlString:CMStoreManager.getURL(), action:"user/get_home.htm" , withParaments: params, withSuccessBlock: { (responseObject) in
            print(responseObject!)
            let flag = responseObject?["flag"] as! Int
            if flag == 1 {
                self.tableView?.cr.endHeaderRefresh()
                let info = responseObject?["info"] as! NSArray
                self.homeItemData?.removeAllObjects()
                for dic in info {
                    let dict = dic as! [AnyHashable:Any]
                    let arr = dict["items"] as! NSArray
                    
                    for arr_dic in arr {
                        let dicy = arr_dic as! [AnyHashable:Any]
                        let model = CMHomePageItemModel.homePageItmeModel(withDict: dicy)
                        self.homeItemData?.add(model)
                    }
                }
                print(self.homeItemData!)
                self.tableView?.reloadData()
            }
        }, withFailureBlock: { (error) in
            self.tableView?.cr.endHeaderRefresh()
            print(error!)
        }) { (progress) in
            print(progress)
        }
    }
}
