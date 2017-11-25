//
//  UserInforOld.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/25/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import Foundation
class UserInforOld {
    var date:String = "00:00:00 00:00"
    var money:Int = 0
    init() {
        
    }
    init(date:String, money:Int) {
        self.date = date
        self.money = money
    }
}
