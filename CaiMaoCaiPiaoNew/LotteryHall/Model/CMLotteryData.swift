//
//  CMLotteryData.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2018/2/22.
//  Copyright © 2018年 CM. All rights reserved.
//
//  彩种集合
//  用于添加或删除彩种

import UIKit

class CMLotteryData: NSObject {
    /** 储存彩种的数组*/
    var lotterys:[CMLotteryTicket]?
    
    // Add Lottery To Array
    func addLotteryToArray(lotTicket:CMLotteryTicket) {
        lotterys?.append(lotTicket)
    }
    
    // Remove Lottery With LotteryId
    func removeLotteryInArrray(lotteryId:Int) -> [CMLotteryTicket] {
        for (index, value) in lotterys!.enumerated() {
            print(index, value)
            if value.lotteryId == lotteryId {
                lotterys?.remove(at: index)
            }
        }
        return lotterys!
    }
    
    // 获取全部彩种
    func getAllLotterys() -> [CMLotteryTicket] {
        return lotterys!
    }
    
    // 单例方法
    static let shared = CMLotteryData.init()
    private override init() {
        super.init()
        
        // 初始化数组
        lotterys = [CMLotteryTicket]()
        
        self.lot10059()     // - 竞彩足球
        self.lot10058()     // - 竞彩篮球
        self.lot100590()    // - 竞足单关
        self.lot100580()    // - 篮球单关
        self.lot10039()     // - 胜负彩
        self.lot10040()     // - 任选9
        self.lot10026()     // - 大乐透
        self.lot10032()     // - 双色球
        self.lot10025()     // - 福彩3D
        self.lot10046()     // - 老11选5
        self.lot10062()     // - 广东11选5
        self.lot10073()     // - 新疆老11选5
        self.lot10072()     // - 快乐扑克
        self.lot10076()     // - 江西快3
        self.lot10078()     // - 江苏快3
        self.lot10079()     // - 吉林（红）快三
        self.lot10077()     // - 新快乐十分
        self.lot10066()     // - 快乐十分
        self.lot10067()     // - 快3
        self.lot10070()     // - 新快3
        self.lot10074()     // - 京快3
        self.lot10068()     // - 好运11选5
        self.lot10069()     // - 沪11选5
        self.lot10060()     // - 江西(新)11选5
        self.lot10038()     // - 重庆时时彩
        self.lot10024()     // - 排列3
        self.lot100240()    // - 排列5
        self.lot10033()     // - 七乐彩
        self.lot10030()     // - 七星彩
        self.lot10071()     // - 群英会
    }
    
    // MARK: 各类彩种
    // 竞彩足球
    func lot10059() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDJCZQ
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "竞彩足球"
        lotTicket.openIssueTime = "好买易中,中奖率69%"
        lotTicket.maxBonus = "竞彩高手专注合买,狂揽百万大奖"
        lotTicket.viewControllerName = ""
        lotTicket.playNames = ["胜平负",
                               "让球胜平负",
                               "比分",
                               "总进球",
                               "半全场",
                               "混合投注",
                               "2选1",
                               "猜一场"]
        lotTicket.uploadNormalPlayNames = ["NSP",
                                           "RSP",
                                           "CBF",
                                           "JQS",
                                           "BQC",
                                           "HUN",
                                           "2X1",
                                           "CYC"]
        lotTicket.uploadOptimizeBonusPlayNames = ["DSNSP",
                                                  "DSRSP",
                                                  "DSCBF",
                                                  "DSJQS",
                                                  "DSBQC",
                                                  "DSHUN"]
        lotTicket.lotteryIcon = "jczq.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 竞彩篮球
    func lot10058() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDJCLQ
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "竞彩篮球"
        lotTicket.openIssueTime = "竞彩篮球返奖高达69%"
        lotTicket.maxBonus = "2串1倍投收益高"
        lotTicket.viewControllerName = ""
        lotTicket.playNames = ["胜负",
                               "让分胜负",
                               "胜分差",
                               "大小分",
                               "混合投注"]
        lotTicket.uploadNormalPlayNames = ["SFC",
                                           "RSF",
                                           "SFD",
                                           "DXF",
                                           "LHUN"]
        
        lotTicket.lotteryIcon = "jclq.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 竞足单关
    func lot100590() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDJZDG
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "竞足单关"
        lotTicket.openIssueTime = "好买易中,返奖率高达87%"
        lotTicket.maxBonus = "猜中一场就中奖"
        lotTicket.viewControllerName = ""
        lotTicket.playNames = ["胜平负",
                               "让球胜平负",
                               "比分",
                               "总进球",
                               "半全场"]
        lotTicket.uploadNormalPlayNames = ["NSP",
                                           "RSP",
                                           "CBF",
                                           "JQS",
                                           "BQC"]
        lotTicket.uploadOptimizeBonusPlayNames = ["DSNSP",
                                                  "DSRSP",
                                                  "DSCBF",
                                                  "DSJQS",
                                                  "DSBQC"]
        
        lotTicket.lotteryIcon = "jzdg.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 篮球单关
    func lot100580() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDLQDG
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "篮球单关"
        lotTicket.openIssueTime = "好买易中,返奖率高达87%"
        lotTicket.maxBonus = "猜中一场就中奖"
        lotTicket.viewControllerName = ""
        lotTicket.playNames = ["胜负",
                               "让分胜负",
                               "胜分差",
                               "大小分"]
        lotTicket.uploadNormalPlayNames = ["SFC",
                                           "RSF",
                                           "SFD",
                                           "DXF"]
        lotTicket.lotteryIcon = "lqdg.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 胜负彩
    func lot10039() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDSFC
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "胜负彩"
        lotTicket.openIssueTime = "猜胜平负赢500万"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.lotteryIcon = "sfc.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 任选九场
    func lot10040() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDRX9
        lotTicket.lotteryType = 13
        lotTicket.lotteryCategory = CompetitiveLottery
        lotTicket.lotteryName = "任选九场"
        lotTicket.openIssueTime = "14场任选9场就赢大奖"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.lotteryIcon = "rx9.png"
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 大乐透
    func lot10026() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDDLT
        lotTicket.lotteryType = 0
        lotTicket.lotteryFrom = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 2
        lotTicket.prozoneTotal = 35
        lotTicket.backZoneTotal = 12
        lotTicket.prozoneMaxOptionCount = 20
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 90000000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "大乐透"
        lotTicket.openIssueTime = "每周一、三、六晚20:30开奖"
        lotTicket.maxBonus = "奖金滚存:"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["前区",
                                 "后区"]
        lotTicket.playNames = ["复式投注",
                               "胆拖投注"]
        lotTicket.uploadNormalPlayNames = ["lottoSingle",
                                           "draw"]
        lotTicket.uploadDoublePlayNames = ["lottoPoly",
                                           "draw"]
        lotTicket.lotteryIcon = "dlt.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...35 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        var backZoneArr = [Int]()
        for i:Int in 1...12 {
            backZoneArr.append(i)
        }
        lotTicket.backZoneNumbers = backZoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 双色球
    func lot10032() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDSSQ
        lotTicket.lotteryType = 0
        lotTicket.lotteryFrom = 0
        lotTicket.prozoneCount = 6
        lotTicket.backZoneCount = 1
        lotTicket.prozoneTotal = 33
        lotTicket.backZoneTotal = 16
        lotTicket.prozoneMaxOptionCount = 20
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 90000000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "双色球"
        lotTicket.openIssueTime = "彩民最爱,2元赢取1000万"
        lotTicket.maxBonus = "1000万"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["红球",
                                 "蓝球"]
        lotTicket.playNames = ["复式投注",
                               "胆拖投注"]
        lotTicket.uploadNormalPlayNames = ["single",
                                           "draw"]
        lotTicket.uploadDoublePlayNames = ["poly",
                                           "draw"]
        lotTicket.lotteryIcon = "ssq.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...33 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        var backZoneArr = [Int]()
        for i:Int in 1...16 {
            backZoneArr.append(i)
        }
        lotTicket.backZoneNumbers = backZoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 福彩3D
    func lot10025() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDFC3D
        lotTicket.lotteryType = 8
        lotTicket.lotteryFrom = 0
        lotTicket.prozoneCount = 3
        lotTicket.backZoneCount = 1
        lotTicket.prozoneTotal = 10
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 10
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "福彩3D"
        lotTicket.openIssueTime = "附加玩法，轻松赢钱"
        lotTicket.maxBonus = "1000元"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["百位",
                                 "十位",
                                 "个位"]
        lotTicket.playNames = ["直选",
                               "组三",
                               "组三单式",
                               "组六",
                               "组三(胆拖)",
                               "组六(胆拖)",
                               "1D",
                               "2D",
                               "通选",
                               "和数"]
        lotTicket.playBonus = ["1040",
                               "346",
                               "346",
                               "173",
                               "346",
                               "173",
                               "10",
                               "104",
                               "21-470",
                               "14-1040"]
        lotTicket.uploadNormalPlayNames = ["direct",
                                           "group3Poly",
                                           "group3Single",
                                           "group6Poly",
                                           "group3Draw",
                                           "group6Draw",
                                           "fc3d1d",
                                           "fc3d2d",
                                           "fc3dAll",
                                           "fc3dHS"]
        lotTicket.uploadDoublePlayNames = ["direct",
                                           "group3Poly",
                                           "group3Single",
                                           "group6Poly",
                                           "group3Draw",
                                           "group6Draw",
                                           "fc3d1d",
                                           "fc3d2d",
                                           "fc3dAll",
                                           "fc3dHS"]
        lotTicket.lotteryIcon = "3d.png"
        
        var prozoneArr = [Int]()
        for i:Int in 0...9 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 十一运    老11选5
    func lot10046() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDL11X5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 87
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "老11选5"
        lotTicket.openIssueTime = "10分钟一期,返奖率59%"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "前二组选胆拖",
                               "前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "l11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 粤11选5
    func lot10062() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDY11X5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 84
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "粤11选5"
        lotTicket.openIssueTime = "10分钟一期,最高奖金1170"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "选前二组选胆拖",
                               "选前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "yue11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 欢乐11选5
    func lot10073() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDXJ11x5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 97
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "欢乐11选5"
        lotTicket.openIssueTime = "10分钟一期,最高奖金1170"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "前二组选胆拖",
                               "前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "xj11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 快乐扑克3
    func lot10072() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDKLPK
        lotTicket.lotteryType = 9
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 88
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "快乐扑克3"
        lotTicket.openIssueTime = "最易中奖的高频彩"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["猜同花",
                               "猜同花顺",
                               "猜豹子",
                               "猜对子",
                               "猜顺子",
                               "全包",
                               "任选一",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六"]
        lotTicket.playBonus = ["90",
                               "2150",
                               "6400",
                               "88",
                               "400",
                               "",
                               "5",
                               "33",
                               "116",
                               "46",
                               "22",
                               "12"]
        lotTicket.uploadNormalPlayNames = ["thdanSingle",
                                           "thsDanSingle",
                                           "bzDanSingle",
                                           "dzDanSingle",
                                           "szDanSingle",
                                           "",
                                           "renyiSingle",
                                           "renerSingle",
                                           "rensanSingle",
                                           "rensiSingle",
                                           "renwuSingle",
                                           "renliuSingle"]
        lotTicket.uploadDoublePlayNames = ["thdanPoly",
                                           "thsDanPoly",
                                           "bzDanPoly",
                                           "dzDanPoly",
                                           "szDanPoly",
                                           "",
                                           "renyiPoly",
                                           "renerPoly",
                                           "rensanPoly",
                                           "rensiPoly",
                                           "renwuPoly",
                                           "renliuPoly"]
        lotTicket.lotteryIcon = "klpk.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 乐快3
    func lot10076() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDL11X5
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 80
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "乐快3"
        lotTicket.openIssueTime = "最易中奖的高频彩"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["二同号单选",
                               "三同号",
                               "二同号复选",
                               "和值",
                               "二不同号",
                               "二不同号胆拖",
                               "三不同号",
                               "三不同号胆拖",
                               "桌面玩法"]
        lotTicket.playBonus = ["80",
                               "240",
                               "15",
                               "240",
                               "8",
                               "8",
                               "40",
                               "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                           "sthdxSingle",
                                           "ethfxSingle",
                                           "hezhiSingle",
                                           "ebthSingle",
                                           "ebthDraw",
                                           "sbthSingle",
                                           "sbthDraw",
                                           "sthtxSingle",
                                           "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                           "sthdxPoly",
                                           "ethfxPoly",
                                           "hezhiPoly",
                                           "ebthPoly",
                                           "ebthDraw",
                                           "sbthPoly",
                                           "sbthDraw",
                                           "sthtxSingle",
                                           "slhtxSingle"]
        lotTicket.lotteryIcon = "JXk3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 老快3
    func lot10078() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDJSK3
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 82
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "老快3"
        lotTicket.openIssueTime = "每天8:30至22:10"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["二同号单选",
                                "三同号",
                                 "二同号复选",
                                  "和值",
                                   "二不同号",
                                    "二不同号胆拖",
                                     "三不同号",
                                      "三不同号胆拖",
                                       "桌面玩法"]
        lotTicket.playBonus = ["80",
                                "240",
                                 "15",
                                  "240",
                                   "8",
                                    "8",
                                     "40",
                                      "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                            "sthdxSingle",
                                             "ethfxSingle",
                                              "hezhiSingle",
                                               "ebthSingle",
                                                "ebthDraw",
                                                 "sbthSingle",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                            "sthdxPoly",
                                             "ethfxPoly",
                                              "hezhiPoly",
                                               "ebthPoly",
                                                "ebthDraw",
                                                 "sbthPoly",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.lotteryIcon = "jsk3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 红快3
    func lot10079() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDHK3
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 87
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "红快3"
        lotTicket.openIssueTime = "每天8:20至21:30"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["二同号单选",
                                "三同号",
                                 "二同号复选",
                                  "和值",
                                   "二不同号",
                                    "二不同号胆拖",
                                     "三不同号",
                                      "三不同号胆拖",
                                       "桌面玩法"]
        lotTicket.playBonus = ["80",
                                "240",
                                 "15",
                                  "240",
                                   "8",
                                    "8",
                                     "40",
                                      "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                            "sthdxSingle",
                                             "ethfxSingle",
                                              "hezhiSingle",
                                               "ebthSingle",
                                                "ebthDraw",
                                                 "sbthSingle",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                            "sthdxPoly",
                                             "ethfxPoly",
                                              "hezhiPoly",
                                               "ebthPoly",
                                                "ebthDraw",
                                                 "sbthPoly",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.lotteryIcon = "hk3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 新快乐十分
    func lot10077() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDXKLSF
        lotTicket.lotteryType = 5
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 20
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 20
        lotTicket.maxIssue = 97
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "新快乐十分"
        lotTicket.openIssueTime = "白天9点35分到晚上21点50分"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万位",
                                 "千位",
                                 "百位",
                                 "十位",
                                 "个位"]
        lotTicket.playNames = ["选一数投",
                                "选一红投",
                                 "选二连直",
                                  "选二连组",
                                   "选二任选",
                                    "选三前直",
                                     "选三前组",
                                      "选三任选",
                                       "选四任选",
                                        "选五任选"]
        lotTicket.playBonus = ["24",
                                "8",
                                 "62",
                                  "31",
                                   "8",
                                    "8000",
                                     "1300",
                                      "24",
                                       "80",
                                        "320"]
        lotTicket.uploadNormalPlayNames = ["x1stSingle",
                                            "x1htSingle",
                                             "x2lzhiSingle",
                                              "x2lzuSingle",
                                               "twoSingle",
                                                "x3qzhiSingle",
                                                 "x3qzuSingle",
                                                  "threeSingle",
                                                   "fourSingle",
                                                    "fiveSingle"]
        lotTicket.uploadDoublePlayNames = ["x1stPoly",
                                            "x1htSingle",
                                             "x2lzhiPoly",
                                              "x2lzuPoly",
                                               "twoPoly",
                                                "x3qzhiPoly",
                                                 "x3qzuPoly",
                                                  "threePoly",
                                                   "fourPoly",
                                                    "fivePoly"]
        lotTicket.lotteryIcon = "xklsf.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...20 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 快乐十分
    func lot10066() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDKLSF
        lotTicket.lotteryType = 5
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 20
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 20
        lotTicket.maxIssue = 97
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "快乐十分"
        lotTicket.openIssueTime = "白天10点到凌晨2点"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万位",
                                 "千位",
                                 "百位",
                                 "十位",
                                 "个位"]
        lotTicket.playNames = ["选一数投",
                                "选一红投",
                                 "选二连直",
                                  "选二连组",
                                   "选二任选",
                                    "选三前直",
                                     "选三前组",
                                      "选三任选",
                                       "选四任选",
                                        "选五任选",
                                         "选二连组胆拖",
                                          "选二任选胆拖",
                                           "选三任选胆拖",
                                            "选四任选胆拖",
                                             "选五任选胆拖"]
        lotTicket.playBonus = [ "25",
                                 "5",
                                  "62",
                                   "31",
                                    "8",
                                     "8000",
                                      "1300",
                                       "24",
                                        "80",
                                         "320",
                                          "31",
                                           "8",
                                            "24",
                                             "80",
                                              "320"]
        lotTicket.uploadNormalPlayNames = ["x1stSingle",
                                            "x1htSingle",
                                             "x2lzhiSingle",
                                              "x2lzuSingle",
                                               "twoSingle",
                                                "x3qzhiSingle",
                                                 "x3qzuSingle",
                                                  "threeSingle",
                                                   "fourSingle",
                                                    "fiveSingle",
                                                     "x2lzuDraw",
                                                      "twoDraw",
                                                       "threeDraw",
                                                        "fourDraw",
                                                         "fiveDraw"]
        lotTicket.uploadDoublePlayNames = ["x1stPoly",
                                            "x1htSingle",
                                             "x2lzhiPoly",
                                              "x2lzuPoly",
                                               "twoPoly",
                                                "x3qzhiPoly",
                                                 "x3qzuPoly",
                                                  "threePoly",
                                                   "fourPoly",
                                                    "fivePoly",
                                                     "x2lzuDraw",
                                                      "twoDraw",
                                                       "threeDraw",
                                                        "fourDraw",
                                                         "fiveDraw"]
        lotTicket.lotteryIcon = "klsf.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...20 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 快3
    func lot10067() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDK3
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 80
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "快3"
        lotTicket.openIssueTime = "最易中奖的高频彩"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万","千","百"]
        lotTicket.playNames = ["二同号单选",
                                "三同号",
                                 "二同号复选",
                                  "和值",
                                   "二不同号",
                                    "二不同号胆拖",
                                     "三不同号",
                                      "三不同号胆拖",
                                       "桌面玩法"]
        lotTicket.playBonus = ["80",
                                "240",
                                 "15",
                                  "240",
                                   "8",
                                    "8",
                                     "40",
                                      "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                            "sthdxSingle",
                                             "ethfxSingle",
                                              "hezhiSingle",
                                               "ebthSingle",
                                                "ebthDraw",
                                                 "sbthSingle",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                            "sthdxPoly",
                                             "ethfxPoly",
                                              "hezhiPoly",
                                               "ebthPoly",
                                                "ebthDraw",
                                                 "sbthPoly",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.lotteryIcon = "k3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 新快3
    func lot10070() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDXK3
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 80
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "新快3"
        lotTicket.openIssueTime = "最易中奖的高频彩"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万","千","百"]
        lotTicket.playNames = ["二同号单选",
                                "三同号",
                                 "二同号复选",
                                  "和值",
                                   "二不同号",
                                    "二不同号胆拖",
                                     "三不同号",
                                      "三不同号胆拖",
                                       "桌面玩法"]
        lotTicket.playBonus = ["80",
                                "240",
                                 "15",
                                  "240",
                                   "8",
                                    "8",
                                     "40",
                                      "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                            "sthdxSingle",
                                             "ethfxSingle",
                                              "hezhiSingle",
                                               "ebthSingle",
                                                "ebthDraw",
                                                 "sbthSingle",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                            "sthdxPoly",
                                             "ethfxPoly",
                                              "hezhiPoly",
                                               "ebthPoly",
                                                "ebthDraw",
                                                 "sbthPoly",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.lotteryIcon = "xk3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 京快3
    func lot10074() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDJK3
        lotTicket.lotteryType = 6
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 80
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "京快3"
        lotTicket.openIssueTime = "最易中奖的高频彩"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万","千","百"]
        lotTicket.playNames = ["二同号单选",
                                "三同号",
                                 "二同号复选",
                                  "和值",
                                   "二不同号",
                                    "二不同号胆拖",
                                     "三不同号",
                                      "三不同号胆拖",
                                       "桌面玩法"]
        lotTicket.playBonus = ["80",
                                "240",
                                 "15",
                                  "240",
                                   "8",
                                    "8",
                                     "40",
                                      "40"]
        lotTicket.uploadNormalPlayNames = ["ethdxSingle",
                                            "sthdxSingle",
                                             "ethfxSingle",
                                              "hezhiSingle",
                                               "ebthSingle",
                                                "ebthDraw",
                                                 "sbthSingle",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.uploadDoublePlayNames = ["ethdxPoly",
                                            "sthdxPoly",
                                             "ethfxPoly",
                                              "hezhiPoly",
                                               "ebthPoly",
                                                "ebthDraw",
                                                 "sbthPoly",
                                                  "sbthDraw",
                                                   "sthtxSingle",
                                                    "slhtxSingle"]
        lotTicket.lotteryIcon = "jk3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 好运11选5
    func lot10068() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDHei11X5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 79
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "好运11选5"
        lotTicket.openIssueTime = "早8:50至晚23:50"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "前二组选胆拖",
                               "前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "h11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 沪11选5
    func lot10069() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDH11X5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 90
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "沪11选5"
        lotTicket.openIssueTime = "10分钟一期,返奖率59%"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "前二组选胆拖",
                               "前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "hu11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    // 新11选5
    func lot10060() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDX11X5
        lotTicket.lotteryType = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 11
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 84
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "新11选5"
        lotTicket.openIssueTime = "10分钟一期,最高奖金1170"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万",
                                 "千",
                                 "百"]
        lotTicket.playNames = ["前一",
                               "前二直选",
                               "前二组选",
                               "前三直选",
                               "前三组选",
                               "任选二",
                               "任选三",
                               "任选四",
                               "任选五",
                               "任选六",
                               "任选七",
                               "任选八",
                               "任选二胆拖",
                               "任选三胆拖",
                               "任选四胆拖",
                               "任选五胆拖",
                               "任选六胆拖",
                               "任选七胆拖",
                               "任选八胆拖",
                               "前二组选胆拖",
                               "前三组选胆拖"]
        lotTicket.playBonus = ["13",
                               "130",
                               "65",
                               "1170",
                               "195",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "6",
                               "19",
                               "78",
                               "540",
                               "90",
                               "26",
                               "9",
                               "65",
                               "195"]
        lotTicket.uploadNormalPlayNames = ["oneSingle",
                                           "twoDirect",
                                           "twoGroupSingle",
                                           "threeDirect",
                                           "threeGroupSingle",
                                           "twoSingle",
                                           "threeSingle",
                                           "fourSingle",
                                           "fiveSingle",
                                           "sixSingle",
                                           "sevenSingle",
                                           "eightSingle",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.uploadDoublePlayNames = ["onePoly",
                                           "twoDirect",
                                           "twoGroupPoly",
                                           "threeDirect",
                                           "threeGroupPoly",
                                           "twoPoly",
                                           "threePoly",
                                           "fourPoly",
                                           "fivePoly",
                                           "sixPoly",
                                           "sevenPoly",
                                           "eightPoly",
                                           "twoDraw",
                                           "threeDraw",
                                           "fourDraw",
                                           "fiveDraw",
                                           "sixDraw",
                                           "sevenDraw",
                                           "eightDraw",
                                           "twoGroupDraw",
                                           "threeGroupDraw"]
        lotTicket.lotteryIcon = "x11x5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...11 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 老时时彩
    func lot10038() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDOSSC
        lotTicket.lotteryType = 2
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 10
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 11
        lotTicket.maxIssue = 120
        lotTicket.maxStakes = 200
        lotTicket.lotteryCategory = HighFrequencyLottery
        lotTicket.lotteryName = "老时时彩"
        lotTicket.openIssueTime = "白天10点到凌晨2点"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万位","千位","百位","十位","个位"]
        lotTicket.playNames = ["大小单双",
                                "五星通选",
                                 "五星",
                                  "三星直选",
                                   "三星组三",
                                    "三星组六",
                                     "二星直选",
                                      "二星组选",
                                       "一星"]
        lotTicket.playBonus = ["4",
                                "20000",
                                 "100000",
                                  "1000",
                                   "320",
                                    "160",
                                     "100",
                                      "50",
                                       "10"]
        lotTicket.uploadNormalPlayNames = ["dxds",
                                            "fiveStarAllSingle",
                                             "fiveStarSingle",
                                              "threeStarDirectSingle",
                                               "threeStarGroup3Single",
                                                "threeStarGroup6Poly",
                                                 "twoStarDirectSingle",
                                                  "twoStarGroupSingle",
                                                   "oneStar"]
        lotTicket.uploadDoublePlayNames = ["dxds",
                                            "fiveStarAllPoly",
                                             "fiveStarPoly",
                                              "threeStarDirectPoly",
                                               "threeStarGroup3Poly",
                                                "threeStarGroup6Poly",
                                                 "twoStarDirectPoly",
                                                  "twoStarGroupPoly",
                                                   "oneStar"]
        lotTicket.lotteryIcon = "ssc.png"
        
        var prozoneArr = [Int]()
        for i:Int in 0...9 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }

    // 排列3
    func lot10024() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDP3
        lotTicket.lotteryType = 3
        lotTicket.lotteryFrom = 1
        lotTicket.prozoneCount = 3
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 10
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 10
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "排列3"
        lotTicket.openIssueTime = "天天开奖,益智易中"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["百","十","个"]
        lotTicket.playNames = ["直选",
                                "组三",
                                 "组六",
                                  "组三(胆拖)",
                                   "组六(胆拖)"]
        lotTicket.uploadNormalPlayNames = ["direct",
                                            "group3Poly",
                                             "group6Poly",
                                              "group3Draw",
                                               "group6Draw"]
        lotTicket.uploadDoublePlayNames = ["direct",
                                            "group3Poly",
                                             "group6Poly",
                                              "group3Draw",
                                               "group6Draw"]
        lotTicket.lotteryIcon = "pl3.png"
        
        var prozoneArr = [Int]()
        for i:Int in 0...9 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }

    // 排列5
    func lot100240() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDP5
        lotTicket.lotteryType = 4
        lotTicket.lotteryFrom = 1
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 10
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 10
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "排列5"
        lotTicket.openIssueTime = "小排列大奖金,2元赢取10万"
        lotTicket.maxBonus = "100000元"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["万","千","百","十","个"]
        lotTicket.playNames = ["单式","复式"]
        lotTicket.uploadNormalPlayNames = ["pl5Single",
                                            "pl5Poly"]
        lotTicket.uploadDoublePlayNames = ["pl5Poly",
                                            "pl5Poly"]
        lotTicket.lotteryIcon = "pl5.png"
        
        var prozoneArr = [Int]()
        for i:Int in 0...9 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }

    // 七乐彩
    func lot10033() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDQLC
        lotTicket.lotteryType = 0
        lotTicket.lotteryFrom = 0
        lotTicket.prozoneCount = 7
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 30
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 24
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 90000000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "七乐彩"
        lotTicket.openIssueTime = "每周一、三、五21:30开奖"
        lotTicket.maxBonus = "奖金滚存:"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["前区","后区"]
        lotTicket.playNames = ["复式投注",
                                "胆拖投注"]
        lotTicket.uploadNormalPlayNames = ["single",
                                            "draw"]
        lotTicket.uploadDoublePlayNames = ["poly",
                                            "draw"]
        lotTicket.lotteryIcon = "7lc.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...30 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }

    // 七星彩
    func lot10030() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDQXC
        lotTicket.lotteryType = 4
        lotTicket.lotteryFrom = 1
        lotTicket.prozoneCount = 7
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 10
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 10
        lotTicket.maxIssue = 200
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "七星彩"
        lotTicket.openIssueTime = "2元赢取500万"
        lotTicket.maxBonus = "500万"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["一","二","三","四","五","六","七"]
        lotTicket.playNames = ["单式","复式"]
        lotTicket.uploadNormalPlayNames = ["single",
                                            "poly"]
        lotTicket.uploadDoublePlayNames = ["poly",
                                            "poly"]
        lotTicket.lotteryIcon = "7xc.png"
        
        var prozoneArr = [Int]()
        for i:Int in 0...9 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
    
    // 新群英会
    func lot10071() {
        let lotTicket = CMLotteryTicket()
        lotTicket.lotteryId = CMLotteryIDXQYH
        lotTicket.lotteryType = 7
        lotTicket.prozoneCount = 5
        lotTicket.backZoneCount = 0
        lotTicket.prozoneTotal = 20
        lotTicket.backZoneTotal = 0
        lotTicket.prozoneMaxOptionCount = 20
        lotTicket.maxIssue = 78
        lotTicket.maxStakes = 10000
        lotTicket.lotteryCategory = DigitalLottery
        lotTicket.lotteryName = "新群英会"
        lotTicket.openIssueTime = "白天9点到22点，返奖率最高"
        lotTicket.maxBonus = "固定奖金"
        lotTicket.viewControllerName = ""
        lotTicket.allZoneKeys = ["一","二","三","四","五","六","七"]
        lotTicket.playNames = ["任选1",
                                "任选2",
                                 "任选3",
                                  "任选4",
                                   "任选5",
                                    "任选6",
                                     "任选7",
                                      "任选8",
                                       "任选9",
                                        "任选10",
                                         "围二",
                                          "围三",
                                           "围四",
                                            "围五",
                                             "顺一",
                                              "顺二",
                                               "顺三"]
        lotTicket.danTuoPlayNames = ["任2胆拖",
                                      "任3胆拖",
                                       "任4胆拖",
                                        "任5胆拖",
                                         "任6胆拖",
                                          "任7胆拖",
                                           "任8胆拖",
                                            "任9胆拖",
                                             "任10胆拖"]
        lotTicket.playBonus = ["4",
                                "22",
                                 "5-57",
                                  "10-820",
                                   "4-10000",
                                    "3000",
                                     "855",
                                      "320",
                                       "142",
                                        "71",
                                         "5-130",
                                          "18-1000",
                                           "38-5000",
                                            "28-10000",
                                             "23",
                                              "5-350",
                                               "12-7700",
                                                "22",
                                                 "5-57",
                                                  "10-820",
                                                   "4-10000",
                                                    "3000",
                                                     "855",
                                                      "320",
                                                       "142",
                                                        "71"]
        lotTicket.uploadNormalPlayNames = ["renOneSingle",
                                            "renTwoSingle",
                                             "renThreeSingle",
                                              "renFourSingle",
                                               "renFiveSingle",
                                                "renSixSingle",
                                                 "renSevenSingle",
                                                  "renEightSingle",
                                                   "renNineSingle",
                                                    "renTenSingle",
                                                     "weiTwoSingle",
                                                      "weiThreeSingle",
                                                       "weiFourSingle",
                                                        "weiFiveSingle",
                                                         "shunOneSingle",
                                                          "shunTwoSingle",
                                                           "shunThreeSingle",
                                                            "renTwoDraw",
                                                             "renThreeDraw",
                                                              "renFourDraw",
                                                               "renFiveDraw",
                                                                "renSixDraw",
                                                                 "renSevenDraw",
                                                                  "renEightDraw",
                                                                   "renNineDraw",
                                                                    "renTenDraw"]
        lotTicket.uploadDoublePlayNames = ["renOnePoly",
                                            "renTwoPoly",
                                             "renThreePoly",
                                              "renFourPoly",
                                               "renFivePoly",
                                                "renSixPoly",
                                                 "renSevenPoly",
                                                  "renEightPoly",
                                                   "renNinePoly",
                                                    "renTenPoly",
                                                     "weiTwoPoly",
                                                      "weiThreePoly",
                                                       "weiFourPoly",
                                                        "weiFivePoly",
                                                         "shunOnePoly",
                                                          "shunTwoPoly",
                                                           "shunThreePoly",
                                                            "renTwoDraw",
                                                             "renThreeDraw",
                                                              "renFourDraw",
                                                               "renFiveDraw",
                                                                "renSixDraw",
                                                                 "renSevenDraw",
                                                                  "renEightDraw",
                                                                   "renNineDraw",
                                                                    "renTenDraw"]
        lotTicket.lotteryIcon = "xqyh.png"
        
        var prozoneArr = [Int]()
        for i:Int in 1...20 {
            prozoneArr.append(i)
        }
        lotTicket.prozoneNumbers = prozoneArr;
        
        self.addLotteryToArray(lotTicket: lotTicket)
    }
}
