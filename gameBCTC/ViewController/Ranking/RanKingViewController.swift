//
//  RanKingViewController.swift
//  gameBCTC
//
//  Created by Bui Giang on 11/26/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


class RanKingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arraysUserRank:[UserInforOld] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.registerCellNib(RankingTableViewCell.self)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getData() {
        let realm = try! Realm()
        var puppies = realm.objects(UserInforOld.self)
        puppies = puppies.sorted(byKeyPath: "money", ascending: false)
        print("Puppies = \(puppies)")
        var maxCount = 10
        if puppies.count < 10 {
            maxCount = puppies.count
        }
        for i in 0..<maxCount  {
            self.arraysUserRank.append(puppies[i])
        }
        tableView.reloadData()
        
    }
}
extension RanKingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arraysUserRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(RankingTableViewCell.self)
        cell.config(user: self.arraysUserRank[indexPath.row] , index: indexPath.row)
        return cell
        
    }
    
}
