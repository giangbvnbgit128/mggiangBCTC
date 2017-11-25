//
//  RankingTableViewCell.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/26/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var lblStt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(user:UserInforOld,index:Int) {
        self.lblStt.text = "\(index)"
        self.lblMoney.text = "\(user.money)".formatMoney() + "$"
        self.lblDate.text = user.date
    }
    
}
