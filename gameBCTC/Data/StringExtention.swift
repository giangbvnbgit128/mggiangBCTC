//
//  StringExtention.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/22/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import Foundation

extension String {

    func formatMoney() -> String {
       let chars = Array(self.characters)
        
        print("leng arrays \(chars.count)")
        var charsRv:Array = chars.reversed()
        var dem:Int = 0
        var countCharSpe:Int = chars.count/3
        for i in 0..<charsRv.count + countCharSpe {
            print("==== charter index = \(i) item = \(String(charsRv[i]))")
            if String(charsRv[i]) != "." {
                dem += 1
            }
            
            if dem == 3  {
                dem = 0
                charsRv.insert(".", at: i+1)
                
            }
        }
        if charsRv[charsRv.count - 1] == "." {
            charsRv.remove(at: charsRv.count - 1)
        }
        return String(charsRv.reversed())
    }
}
