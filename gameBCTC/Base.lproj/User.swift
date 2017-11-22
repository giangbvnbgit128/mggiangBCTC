//
//  User.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/11/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import Foundation
class User{
    var totalMoney:Int = 100
    var moneyForCuoc:[cuocInfor] = []
    
    init(totalMoney:Int, moneyForC:[cuocInfor]) {
        self.totalMoney = totalMoney
        self.moneyForCuoc = moneyForC
    }
    
}
