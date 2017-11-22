//
//  MoneyCuoc.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/11/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import Foundation


public enum ITEMGAME {
    case BAU
    case CUA
    case TOM
    case GA
    case CHO
    case LON
    case NOMAL
}

public class cuocInfor {
    var item:ITEMGAME = .NOMAL
    var money:Int = 0
    
    init() {
        
    }
    
    init(item:ITEMGAME, moeny:Int) {
        self.item = item
        self.money = moeny
    }
    
}
