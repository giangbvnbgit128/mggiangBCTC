//
//  MenuViewController.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/17/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import UIKit
import UserNotifications

class MenuViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnHelp: UIButton!
    @IBOutlet weak var btnranking: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnPlay.layer.cornerRadius = 4
        btnHelp.layer.cornerRadius = 4
        btnranking.layer.cornerRadius = 4
        
        btnPlay.setTitle(NSLocalizedString("titlebtnPlay", comment:""), for: .normal)
        btnHelp.setTitle(NSLocalizedString("titlebtnHelp", comment:""), for: .normal)
        btnranking.setTitle(NSLocalizedString("titlebtnRanking", comment:""), for: .normal)
        
       
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickPlay(_ sender: Any) {
        let viewVc = GCGameViewController()
        self.navigationController?.pushViewController(viewVc, animated: true)
    }

    @IBAction func ClickRanking(_ sender: Any) {
        
        let viewVc = RanKingViewController()
        self.navigationController?.pushViewController(viewVc, animated: true)
//        self.showAlerView(title: "", message: NSLocalizedString("titlebtnDPT", comment:""))
    }
    @IBAction func clickHelp(_ sender: Any) {
        let viewRootView = AVTutorialViewController()
        self.present(viewRootView, animated: true, completion: nil)

    }

    func showAlerView(title:String , message:String )  {
        let alerView = UIAlertView( title: title, message: message, delegate: self, cancelButtonTitle:  NSLocalizedString("titleButtonOk", comment: ""))
        alerView.show()
    }

}
