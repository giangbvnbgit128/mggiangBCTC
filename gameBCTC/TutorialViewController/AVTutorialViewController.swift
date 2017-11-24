//
//  AVTutorialViewController.swift
//  AnViet
//
//  Created by Bui Giang on 5/25/17.
//  Copyright © 2017 Bui Giang. All rights reserved.
//

import UIKit
import TSToast

class AVTutorialViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    let arrayImage:[String] = ["tutorial1","tutorial2","tutorial3",
                               "tutorial4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.registerNib(AVTutorialCollectionViewCell.self)
        self.automaticallyAdjustsScrollViewInsets = false
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = arrayImage.count
        navigationController?.navigationBar.isTranslucent = false
        AppDelegate.ShareInstance.blockFinishRegisToken = {() in
            // show button exit//
            self.view.makeToast("Finsih Token")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
   
    @IBAction func clickBack(_ sender: Any) {
        if self.pageControl.currentPage != 0 {
            self.view.makeToast("== \(self.pageControl.currentPage)")
            self.collectionView.contentOffset.x = self.collectionView.frame.width * CGFloat(self.pageControl.currentPage - 1)
        }
        self.movePageControlWithScroll()
       
    }
    @IBAction func clickNext(_ sender: Any) {
        if self.pageControl.currentPage != self.arrayImage.count - 1 {
            self.view.makeToast("== \(self.pageControl.currentPage)")
            self.collectionView.contentOffset.x = self.collectionView.frame.width * CGFloat(self.pageControl.currentPage + 1)
            self.movePageControlWithScroll()
        } else {
            let viewRootView = MenuViewController()
            let naVc = UINavigationController(rootViewController: viewRootView)
            UserDefaults.set(true, forKey: "isFirtKey")
            self.present(naVc, animated: true, completion: nil)
   
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func movePageControlWithScroll () {
        let pageWidth = collectionView.frame.width
        let page = Int(floor((collectionView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        if pageControl.currentPage != page {
            self.pageControl.currentPage = page
        }
    }

}

extension AVTutorialViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(AVTutorialCollectionViewCell.self, forIndexPath: indexPath) as AVTutorialCollectionViewCell
        cell.ConfigCell(nameImage: self.arrayImage[indexPath.row])
        return cell
    }
}

extension AVTutorialViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }

}
extension AVTutorialViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("====== socr=== \(scrollView.contentOffset.x/UIScreen.mainWidth)")
        movePageControlWithScroll()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        movePageControlWithScroll()
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("====Scroll \(scrollView.contentOffset.x) prin y = \(self.collectionView.frame.width)")
    }
   
}
