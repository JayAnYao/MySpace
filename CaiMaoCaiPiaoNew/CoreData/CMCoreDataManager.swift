//
//  CMCoreDataManager.swift
//  CaiMaoCaiPiaoNew
//
//  Created by Jay on 2017/8/15.
//  Copyright © 2017年 CM. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// MARK: - 数据库封装
class CoreDataTools:NSObject {
}

// MARK: - 数据库操作
let EntityName = "Theme"

func getContext() -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
    
}

// MARK: - 增
func addCoreData(dic:[AnyHashable:Any]) {
    let context = getContext()
    // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
    let entity = NSEntityDescription.insertNewObject(forEntityName: EntityName, into: context) as! Theme
    entity.themeName = dic["themeName"] as? String
    entity.themeBackgroundColor = dic["themeBackgroundColor"] as? String
    entity.themeBackgroundImageUrl = dic["themeBackgroundImageUrl"] as? String
    
    entity.themeNavigationBarImageUrl = dic["themeNavigationBarImageUrl"] as? String
    entity.themeNavigationBarColor = dic["themeNavigationBarColor"] as? String
    
    entity.themeNavigationBarTitleColor = dic["themeNavigationBarTitleColor"] as? String
    entity.themeNavigationBarTitleFont = Float(dic["themeNavigationBarTitleFont"] as! Int)
        
    entity.themeTabBarColor = dic["themeTabBarColor"] as? String
    entity.themeTabBarImage = dic["themeTabBarImage"] as? String
    
    entity.themeTabBarItemNormalImages = dic["themeTabBarItemNormalImages"] as? NSObject
    entity.themeTabBarItemSelectedImages = dic["themeTabBarItemSelectedImages"] as? NSObject
    
    entity.themeTabBarItemNameNormalColor = dic["themeTabBarItemNameNormalColor"] as? String
    entity.themeTabBarItemNameSelectedColor = dic["themeTabBarItemNameSelectedColor"] as? String
    
    do {
        try context.save()
        print("saved")
    } catch  {
        print(error)
    }
}

// MARK: - 删
func deleteCoreData(Condition condition:String) {
    let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
    
    let predicate = NSPredicate(format: condition, "")
    request.predicate = predicate
    
    do {
        // 查询满足条件的内容
        let resultList = try getContext().fetch(request) as! [Theme] as NSArray
        if resultList.count != 0 {//若结果为多条，则只删除第一条，可根据需要改动
            
            for result in resultList as! [NSManagedObject] {
                getContext().delete(result)
            }
            try getContext().save()
            print("delete succes")
        }else {
            print("delete fail")
        }
    } catch  {
        print(error)
    }
    
}

// MARK: - 改
func updateDataWithCoreData(Condition condition:String, Key key:String, Value value:String)
{
    let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
    let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: EntityName, in: getContext())!
    let predicate = NSPredicate(format: condition,"")
    request.entity = entity
    request.predicate = predicate
    do{
        let themeList = try getContext().fetch(request) as! [Theme] as NSArray
        if themeList.count != 0 {
            
            for theme in themeList as! [Theme] {
                theme.setValue(value, forKey: key)
            }
            
            try getContext().save()
            print("修改成功 ~ ~")
        }else{
            print("修改失败，没有符合条件的联系人！")
        }
    }catch{
        print("修改失败 ~ ~")
    }
    
}
// MARK: - 查
func selectDataFromCoreData(Condition condition:String) -> NSArray
{
    var dataSource = NSArray()
    let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
    let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: EntityName, in: getContext())!
    let predicate = NSPredicate(format: condition,"")
    request.entity = entity
    request.predicate = predicate
    
    do{
        dataSource = try getContext().fetch(request) as! [Theme] as NSArray
        print("数据读取成功 ~ ~ \(dataSource)")
    }catch{
        print("get_coredata_fail!")
    }
    
    return dataSource
}

// MARK: - 查询数据并输出
func printAllDataWithCoreData()
{
    let array = selectDataFromCoreData(Condition: "")
    for item in array {
        let theme = item as! Theme
//        print("name =",theme.name!,"url =",theme.url!)
    }
}


