//
//  Models.swift
//  appstore1
//
//  Created by Hai Vo L. on 1/2/18.
//  Copyright © 2018 Hai Vo L. All rights reserved.
//

import UIKit

class FeaturedApps: NSObject {
    
    var bannerCategory: AppCategory?
    var appCategories: [AppCategory]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "categories" {
            appCategories = [AppCategory]()
            
            for dict in value as! [[String: AnyObject]] {
                let appCategory = AppCategory()
                appCategory.setValuesForKeys(dict)
                appCategories?.append(appCategory)
            }
            
        } else if key == "bannerCategory" {
            bannerCategory = AppCategory()
            bannerCategory?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
}

class AppCategory: NSObject {
    
    var name: String?
    var apps: [App]?
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedApps(_ completionHandler: @escaping (FeaturedApps) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                
                let json = try(JSONSerialization.jsonObject(with: data!, options: .mutableContainers))
                
                let featuredApps = FeaturedApps()
                featuredApps.setValuesForKeys(json as! [String: AnyObject])
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(featuredApps)
                })
                
            } catch let err {
                print(err)
            }
            
        }) .resume()
        
    }
    
    static func sampleAppCategories() -> [AppCategory] {
        
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var apps = [App]()
        
        // logic
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 3.99 as Float)
      let frozenApp1 = App()
      frozenApp1.name = "Disney Build It: Frozen"
      frozenApp1.imageName = "frozen"
      frozenApp1.category = "Entertainment"
      frozenApp1.price = NSNumber(value: 3.99 as Float)
      let frozenApp12 = App()
      frozenApp12.name = "Disney Build It: Frozen"
      frozenApp12.imageName = "frozen"
      frozenApp12.category = "Entertainment"
      frozenApp12.price = NSNumber(value: 3.99 as Float)
        apps.append(frozenApp)
      apps.append(frozenApp1)

      apps.append(frozenApp12)

      
      
      
        
        bestNewAppsCategory.apps = apps
        
        
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGamesApps = [App]()
        
        let telepaintApp = App()
        telepaintApp.name = "Telepaint"
        telepaintApp.category = "Games"
        telepaintApp.imageName = "telepaint"
        telepaintApp.price = NSNumber(value: 2.99 as Float)
        
        bestNewGamesApps.append(telepaintApp)
        
        bestNewGamesCategory.apps = bestNewGamesApps
      
      
      let bestNewGamesCategory1 = AppCategory()
      bestNewGamesCategory1.name = "Best New Games"
      
      var bestNewGamesApps1 = [App]()
      
      let telepaintApp1 = App()
      telepaintApp1.name = "Telepaint"
      telepaintApp1.category = "Games"
      telepaintApp1.imageName = "telepaint"
      telepaintApp1.price = NSNumber(value: 2.99 as Float)
      
      bestNewGamesApps1.append(telepaintApp1)
      
      bestNewGamesCategory1.apps = bestNewGamesApps1
        
        return [bestNewAppsCategory, bestNewGamesCategory,bestNewGamesCategory1]
        
    }
    
}

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
    
    var screenshots: [String]?
    var desc: String?
    var appInformation: AnyObject?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "description" {
            self.desc = value as? String
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
}
