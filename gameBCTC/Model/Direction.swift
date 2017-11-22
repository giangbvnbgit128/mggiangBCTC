//
//  Direction.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/15/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import Foundation

class Direction {
    var appId:String = ""
    var appName:String = ""
    var isshowWap:Int = 0
    var wapUrl:String = ""
    var status:Int = -1
    var desc:String = ""
    
    init() {
        
    }
    
    init(appId:String, appName:String , isshowAp: Int, wapUrl:String, status:Int, desc:String) {
        
        self.appId = appId
        self.appName = appName
        self.isshowWap = isshowAp
        self.wapUrl = wapUrl
        self.status = status
        self.desc = desc
        
    }
}
