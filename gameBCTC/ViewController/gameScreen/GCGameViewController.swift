//
//  GCGameViewController.swift
//  gameBCTC
//
//  Created by Bui Van Giang on 11/10/17.
//  Copyright © 2017 Bui Van Giang. All rights reserved.
//

import UIKit
import Darwin
import Alamofire
import RealmSwift
import Realm

class GCGameViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imgGame1: UIImageView!
    @IBOutlet weak var imageGame2: UIImageView!
    @IBOutlet weak var imageGame3: UIImageView!
    @IBOutlet weak var imgeGame4: UIImageView!
    @IBOutlet weak var imageGame5: UIImageView!
    @IBOutlet weak var imageGame6: UIImageView!
    @IBOutlet weak var imageGame7: UIImageView!
    @IBOutlet weak var imageGame8: UIImageView!
    @IBOutlet weak var imageGame9: UIImageView!
    @IBOutlet weak var imageGame10: UIImageView!
    @IBOutlet weak var imageGame11: UIImageView!
    @IBOutlet weak var imageGame12: UIImageView!
    
    @IBOutlet weak var lineOne11: UIView!
    @IBOutlet weak var lineone12: UIView!
    @IBOutlet weak var lineOne13: UIView!
    @IBOutlet weak var lineOne21: UIView!
    @IBOutlet weak var lineOne22: UIView!
    @IBOutlet weak var lineOne23: UIView!
    
    
    @IBOutlet weak var slipe: UISlider!
    var arrayItemImage:[UIImageView] = []
    
    @IBOutlet weak var btnoutPow: UIButton!
    var index:Int = 0
    var countlifeCycle:Int = 0
    var lifeOne:AroundCycleModel = AroundCycleModel()
    var lifeTwo:AroundCycleModel = AroundCycleModel()
    var lifeThree:AroundCycleModel = AroundCycleModel()
    var menhGia:Int = 10000
    var arrayMoneyCuoc:[cuocInfor] = []
    var moneyForUser:Int = 100000
    
    @IBOutlet weak var btn10k: UIButton!
    @IBOutlet weak var btn20k: UIButton!
    @IBOutlet weak var btn50k: UIButton!
    
    @IBOutlet weak var view10k: UIView!
    @IBOutlet weak var view20k: UIView!
    @IBOutlet weak var view50k: UIView!
    
    @IBOutlet weak var btnSelectBau: UIButton!
    @IBOutlet weak var btnSelectCua: UIButton!
    @IBOutlet weak var btnSelectTom: UIButton!
    @IBOutlet weak var btnSelectGa: UIButton!
    @IBOutlet weak var btnSelectCho: UIButton!
    @IBOutlet weak var btnSelectLon: UIButton!
    
    
    @IBOutlet weak var viewForWeb: UIView!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var imageResult1: UIImageView!
    @IBOutlet weak var imageResult2: UIImageView!
    @IBOutlet weak var imageResult3: UIImageView!
    
    var timerSchedule: Timer = Timer()
    var maxScore:Int = 100000
    
    var directionModel:Direction = Direction()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        arrayItemImage.append(imgGame1)
        arrayItemImage.append(imageGame2)
        arrayItemImage.append(imageGame3)
        arrayItemImage.append(imgeGame4)
        arrayItemImage.append(imageGame5)
        arrayItemImage.append(imageGame6)
        arrayItemImage.append(imageGame7)
        arrayItemImage.append(imageGame8)
        arrayItemImage.append(imageGame9)
        arrayItemImage.append(imageGame10)
        arrayItemImage.append(imageGame11)
        arrayItemImage.append(imageGame12)
        self.btn10k.titleLabel?.textColor = DataConfig.COLORSELECT
        self.view10k.alpha = DataConfig.APHASELECT
        self.imgGame1.layer.cornerRadius = self.imgGame1.frame.height/2 * Ratio.heightIPhone6
        self.imageGame2.layer.cornerRadius = self.imageGame2.frame.height/2 * Ratio.heightIPhone6
        self.imageGame3.layer.cornerRadius = self.imageGame3.frame.height/2 * Ratio.heightIPhone6
        self.imgeGame4.layer.cornerRadius = self.imgeGame4.frame.height/2 * Ratio.heightIPhone6
        self.imageGame5.layer.cornerRadius = self.imageGame5.frame.height/2 * Ratio.heightIPhone6
        self.imageGame6.layer.cornerRadius = self.imageGame6.frame.height/2 * Ratio.heightIPhone6
        self.imageGame7.layer.cornerRadius = self.imageGame7.frame.height/2 * Ratio.heightIPhone6
        self.imageGame8.layer.cornerRadius = self.imageGame8.frame.height/2 * Ratio.heightIPhone6
        self.imageGame9.layer.cornerRadius = self.imageGame9.frame.height/2 * Ratio.heightIPhone6
        self.imageGame10.layer.cornerRadius = self.imageGame10.frame.height/2 * Ratio.heightIPhone6
        self.imageGame11.layer.cornerRadius = self.imageGame11.frame.height/2 * Ratio.heightIPhone6
        self.imageGame12.layer.cornerRadius = self.imageGame12.frame.height/2 * Ratio.heightIPhone6
        
        
        self.imgGame1.backgroundColor = .white
        self.imageGame2.backgroundColor = .white
        self.imageGame3.backgroundColor = .white
        self.imgeGame4.backgroundColor = .white
        self.imageGame5.backgroundColor = .white
        self.imageGame6.backgroundColor = .white
        self.imageGame7.backgroundColor = .white
        self.imageGame8.backgroundColor = .white
        self.imageGame9.backgroundColor = .white
        self.imageGame10.backgroundColor = .white
        self.imageGame11.backgroundColor = .white
        self.imageGame12.backgroundColor = .white
        
        self.imgGame1.layer.borderWidth = 1
        self.imageGame2.layer.borderWidth = 1
        self.imageGame3.layer.borderWidth = 1
        self.imgeGame4.layer.borderWidth = 1
        self.imageGame5.layer.borderWidth = 1
        self.imageGame6.layer.borderWidth = 1
        self.imageGame7.layer.borderWidth = 1
        self.imageGame8.layer.borderWidth = 1
        self.imageGame9.layer.borderWidth = 1
        self.imageGame10.layer.borderWidth = 1
        self.imageGame11.layer.borderWidth = 1
        self.imageGame12.layer.borderWidth = 1
        
        
        self.lineOne11.layer.borderWidth = 1
        self.lineone12.layer.borderWidth = 1
        self.lineOne13.layer.borderWidth = 1
        self.lineOne21.layer.borderWidth = 1
        self.lineOne22.layer.borderWidth = 1
        self.lineOne23.layer.borderWidth = 1
        
        
        
        self.imgGame1.layer.borderColor = UIColor.black.cgColor
        self.imageGame2.layer.borderColor = UIColor.black.cgColor
        self.imageGame3.layer.borderColor = UIColor.black.cgColor
        self.imgeGame4.layer.borderColor = UIColor.black.cgColor
        self.imageGame5.layer.borderColor = UIColor.black.cgColor
        self.imageGame6.layer.borderColor = UIColor.black.cgColor
        self.imageGame7.layer.borderColor = UIColor.black.cgColor
        self.imageGame8.layer.borderColor = UIColor.black.cgColor
        self.imageGame9.layer.borderColor = UIColor.black.cgColor
        self.imageGame10.layer.borderColor = UIColor.black.cgColor
        self.imageGame11.layer.borderColor = UIColor.black.cgColor
        self.imageGame12.layer.borderColor = UIColor.black.cgColor
        
        self.lineOne11.layer.borderColor = UIColor.black.cgColor
        self.lineone12.layer.borderColor = UIColor.black.cgColor
        self.lineOne13.layer.borderColor = UIColor.black.cgColor
        self.lineOne21.layer.borderColor = UIColor.black.cgColor
        self.lineOne22.layer.borderColor = UIColor.black.cgColor
        self.lineOne23.layer.borderColor = UIColor.black.cgColor
        
        
        self.btnoutPow.layer.cornerRadius = self.btnoutPow.frame.width/2 * Ratio.heightIPhone6
        self.btnoutPow.layer.borderColor = UIColor.red.cgColor
        self.btnoutPow.backgroundColor = UIColor.yellow
        
        let moneyUserOld = UserDefaults.integer(forKey: "UserInfor")
        if moneyUserOld != 0 {
            self.moneyForUser = moneyUserOld
            
            let maxMoney = UserDefaults.integer(forKey: "maxScore")
            if maxMoney != 0 {
                self.maxScore = maxMoney
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lblResult.text = "User: " + "\(self.moneyForUser)".formatMoney() + "$"
        self.callApi {
          self.directionWebview()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// func tion chay xung quanh. can time hoan thanh . toc do .
    func animationForCricleGame() {
        self.imgGame1.backgroundColor = .red
        timerSchedule = Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(self.animationForOneView),
                             userInfo: nil,
                             repeats: true)
        
    }
    
    func animationForOneView() {
        if self.index == 0 {
            self.arrayItemImage[0].backgroundColor = .red
            self.arrayItemImage[11].backgroundColor = .white
        } else {

            print("index  = \(self.index)")
            self.arrayItemImage[self.index].backgroundColor = .red
            self.arrayItemImage[self.index - 1].backgroundColor = .white
        }

        if (self.index == self.lifeOne.indexItem) && (self.countlifeCycle == 3) || (self.index == self.lifeTwo.indexItem) && (self.countlifeCycle == 6) || (self.index == self.lifeThree.indexItem) && (self.countlifeCycle == 9){
            timerSchedule.invalidate()
            
            var lifeIndex:Int = 0
            
            switch self.countlifeCycle {
            case 3:
                lifeIndex = self.lifeOne.indexItem
            case 6:
                lifeIndex = self.lifeTwo.indexItem
            case 9:
                lifeIndex = self.lifeThree.indexItem
            default:
                break
            }
            
            var imageName:String = ""
            
            switch lifeIndex {
            case 1,7:
               imageName = "Bau"
            case 2,8:
                imageName = "Cua"
            case 3,9:
                imageName = "Tom"
            case 4,10:
                imageName = "Ga"
            case 5,11,0:
                imageName = "Cho"
            case 6,12:
                imageName = "Lon"
            default:
                break
            }

            
            UIView.animate(withDuration: 1, animations: {
                self.arrayItemImage[self.index].backgroundColor = .blue
                self.arrayItemImage[self.index].backgroundColor = .red
                self.arrayItemImage[self.index].backgroundColor = .blue
                self.arrayItemImage[self.index].backgroundColor = .white
                self.arrayItemImage[self.index].backgroundColor = .blue
                self.arrayItemImage[self.index].backgroundColor = .red
                self.arrayItemImage[self.index].backgroundColor = .yellow
            }, completion: { (complete) in
                if self.countlifeCycle != 9 {
                    self.timerSchedule = Timer.scheduledTimer(timeInterval: 0.1,
                                                              target: self,
                                                              selector: #selector(self.animationForOneView),
                                                              userInfo: nil,
                                                              repeats: true)
                    
                } else {
                    var kq:Int = 0//self.moneyForUser self.lifeOne.item self.lifeThree.item
                    for i in  0..<self.arrayMoneyCuoc.count {
                        if self.arrayMoneyCuoc[i].item == self.lifeOne.item {
                            kq = kq + self.arrayMoneyCuoc[i].money*2
                        }
                        if self.arrayMoneyCuoc[i].item == self.lifeTwo.item {
                            kq = kq + self.arrayMoneyCuoc[i].money*2
                        }
                        if self.arrayMoneyCuoc[i].item == self.lifeThree.item {
                            kq = kq + self.arrayMoneyCuoc[i].money*2
                        }
                    }
                    self.moneyForUser = kq + self.moneyForUser
                    self.lblResult.text =  "User: " + "\(self.moneyForUser)".formatMoney() + "$"
                    UserDefaults.set(self.moneyForUser, forKey: "UserInfor")
                    // tinh max 1 lan
                    
                    if self.moneyForUser > self.maxScore {
                        
                        self.maxScore = self.moneyForUser
                        UserDefaults.set(self.maxScore, forKey: "maxScore")
                    }
                    UserDefaults.synchronize()
                    if self.moneyForUser == 0 {
                        // so sanh roi save data no vao .// minh chi co 1 mang 10 phan tu
                        self.showAlerSuccess(message: NSLocalizedString("titleForUserLost", comment: ""), title: "", buttonTitle: NSLocalizedString("titleButtonOk", comment: ""), completed: {
                            let userMax = UserInforOld()
                            
                            let date = Date()
                            let formatter = DateFormatter()
                            formatter.dateFormat = DataConfig.DATEFORMAT
                            let result = formatter.string(from: date)
                            
                            userMax.date = "\(result)"
                            userMax.money = self.maxScore
                            
                            let realm = try! Realm()
                        
                            try! realm.write {
                                realm.add(userMax)
                            }
                            
                            self.navigationController?.popViewController(animated: true)
                        })
                    }
                    
                    self.btnSelectBau.setTitle("", for: .normal)
                    self.btnSelectCua.setTitle("", for: .normal)
                    self.btnSelectTom.setTitle("", for: .normal)
                    self.btnSelectGa.setTitle("", for: .normal)
                    self.btnSelectCho.setTitle("", for: .normal)
                    self.btnSelectLon.setTitle("", for: .normal)
                    
                    self.arrayMoneyCuoc.removeAll()
                    self.btnoutPow.isEnabled = true
                }
                
            })
            
            
        }
        
        if self.index == 11 {
            self.index = 0
            self.countlifeCycle += 1
        } else {
            self.index += 1
        }
        
    }
    
    @IBAction func ClickPodToView(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnPow(_ sender: Any) {

            let ramdom1 = Int(arc4random_uniform(11))
            let ramdom2 = Int(arc4random_uniform(11))
            let ramdom3 = Int(arc4random_uniform(11))
            

        
            self.lifeOne.indexItem = ramdom1
            self.lifeOne.item = checkITem(index: ramdom1)
            
            self.lifeTwo.indexItem = ramdom2
            self.lifeTwo.item = checkITem(index: ramdom2)
            
            self.lifeThree.indexItem = ramdom3
            self.lifeThree.item = checkITem(index: ramdom3)
            
            if timerSchedule != nil {
                timerSchedule.invalidate()
            }
            
            self.countlifeCycle = 0
            self.index = 1
            
            self.animationForCricleGame()
            self.btnoutPow.isEnabled = false
    }
    
    func checkITem(index:Int) -> ITEMGAME {
        switch index {
        case 1,7:
            return .BAU
        case 2,8:
            return .CUA
        case 3,9:
            return .TOM
        case 4,10:
            return .GA
        case 5,11,0:
            return .CHO
        case 6,12:
            return .LON
        default:
            return .NOMAL
        }
    }
    
    // co che dat tien . cho nut vao chon tien.
    
    // select Bau Cua Tom Ca
    
    func setMoneyForRs()  {
            self.moneyForUser = self.moneyForUser - self.menhGia
            self.lblResult.text = "User: " + "\(self.moneyForUser)".formatMoney() + "$"
    }
    
    @IBAction func btnSelectBau(_ sender: Any) {
        if self.checkMoeny(menhGia: self.menhGia) {
        let cuocBAU = cuocInfor.init(item: .BAU, moeny: self.menhGia)
        self.arrayMoneyCuoc.append(cuocBAU)
        self.setMoneyForRs()
        self.setTien()
        
       } else {
        showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }
        
    }
    
    @IBAction func btnSelectCua(_ sender: Any) {
        if self.checkMoeny(menhGia: self.menhGia) {
            let cuocCua = cuocInfor.init(item: .CUA, moeny: self.menhGia)
            self.arrayMoneyCuoc.append(cuocCua)
            self.setMoneyForRs()
            self.setTien()
        } else {
            showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }

    }
    
    @IBAction func btnSelectTom(_ sender: Any) {
        if self.checkMoeny(menhGia: self.menhGia) {
        let cuocTom = cuocInfor.init(item: .TOM, moeny: self.menhGia)
        self.arrayMoneyCuoc.append(cuocTom)
            self.setMoneyForRs()
        self.setTien()
        } else {
            showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }
    }

    @IBAction func btnSelectGa(_ sender: Any) {
       if self.checkMoeny(menhGia: self.menhGia) {
        let cuocGA = cuocInfor.init(item: .GA, moeny: self.menhGia)
        self.arrayMoneyCuoc.append(cuocGA)
        self.setMoneyForRs()
        self.setTien()
       } else {
            showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }
    }

    @IBAction func btnSelectCho(_ sender: Any) {
        if self.checkMoeny(menhGia: self.menhGia) {
            let cuocCHO = cuocInfor.init(item: .CHO, moeny: self.menhGia)
            self.arrayMoneyCuoc.append(cuocCHO)
            self.setMoneyForRs()
            self.setTien()
        
        } else {
            showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }
    }

    @IBAction func btnSelectLon(_ sender: Any) {
        if self.checkMoeny(menhGia: self.menhGia) {
        let cuocLON = cuocInfor.init(item: .LON, moeny: self.menhGia)
        self.arrayMoneyCuoc.append(cuocLON)
        self.setMoneyForRs()
        self.setTien()
        } else {
            showAlerView(title: NSLocalizedString("titleMessage", comment: ""), message: NSLocalizedString("messageErrorMoney", comment: ""))
        }
    }
    //
    
    func checkMoeny(menhGia:Int) -> Bool  {
        if self.moneyForUser >= self.menhGia {
            return true
        } else {
            return false
        }
    }
    
    func showAlerView(title:String , message:String )  {
        let alerView = UIAlertView( title: title, message: message, delegate: self, cancelButtonTitle:  NSLocalizedString("titleButtonOk", comment: ""))
        alerView.show()
    }
    
    func showAlerSuccess(message:String,title:String, buttonTitle: String, completed: @escaping() -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction( title: buttonTitle, style: .default, handler: { (complete) in
            completed()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func setTien()  {
        var moneyBau:Int = 0
        var moneyCua:Int = 0
        var moneyTom:Int = 0
        var moneyGa:Int = 0
        var moneyCho:Int = 0
        var moneyLon:Int = 0
        
        
        
        for i in 0..<arrayMoneyCuoc.count {
            let item = arrayMoneyCuoc[i]
            
            switch item.item {
            case .BAU:
                moneyBau += item.money
            case .CUA:
                moneyCua += item.money
            case .TOM:
                moneyTom += item.money
            case .GA:
                moneyGa += item.money
            case .CHO:
                moneyCho += item.money
            case .LON:
                moneyLon += item.money
                
            default: break
            }
 
        }
        btnSelectBau.setTitle("\(moneyBau)".formatMoney() + "$", for: .normal)
        btnSelectCua.setTitle("\(moneyCua)".formatMoney() + "$", for: .normal)
        btnSelectTom.setTitle("\(moneyTom)".formatMoney() + "$", for: .normal)
        btnSelectGa.setTitle("\(moneyGa)".formatMoney() + "$", for: .normal)
        btnSelectLon.setTitle("\(moneyLon)".formatMoney() + "$", for: .normal)
        btnSelectCho.setTitle("\(moneyCho)".formatMoney()  + "$", for: .normal)
        
    }
    
   //Select Tien
    
    @IBAction func btnSelect10(_ sender: Any) {
        self.menhGia = 10000
        self.btn10k.titleLabel?.textColor = DataConfig.COLORSELECT
        self.btn20k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        self.btn50k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        
        self.view10k.alpha = (DataConfig.APHASELECT)
        self.view20k.alpha = (DataConfig.ANPHAUNSELECT)
        self.view50k.alpha = (DataConfig.ANPHAUNSELECT)
    }
    
    @IBAction func btnSelect20(_ sender: Any) {
        self.menhGia = 20000
        
        self.btn10k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        self.btn20k.titleLabel?.textColor = DataConfig.COLORSELECT
        self.btn50k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        
        self.view10k.alpha = (DataConfig.ANPHAUNSELECT)
        self.view20k.alpha = (DataConfig.APHASELECT)
        self.view50k.alpha = (DataConfig.ANPHAUNSELECT)
        
    }
    
    @IBAction func btnSelect50(_ sender: Any) {
        self.menhGia = 50000
        
        self.btn10k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        self.btn20k.titleLabel?.textColor = DataConfig.COLOUNSELECT
        self.btn50k.titleLabel?.textColor = DataConfig.COLORSELECT
        
        self.view10k.alpha = (DataConfig.ANPHAUNSELECT)
        self.view20k.alpha = (DataConfig.ANPHAUNSELECT)
        self.view50k.alpha = (DataConfig.APHASELECT)
        
        
    }
//Mark:- requestUrl
    
    func directionWebview() {
                
        
        if directionModel.isshowWap != 1 {
            viewForWeb.isHidden = true

        } else {
            viewForWeb.isHidden = false
            viewForWeb.backgroundColor = .red
            webView.backgroundColor = .black
            webView.isHidden = false
            webView.delegate = self
            
            if let url = URL(string: directionModel.wapUrl) {
                let request = URLRequest(url: url)
                webView.loadRequest(request)
            }
        }
    }

    func callApi(completed: @escaping () -> Void)  {
        Alamofire.request("https://appid-ioss.xx-app.com/frontApi/getAboutUs?appid=12345678").responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
                guard let newValue = value as? [String : AnyObject] else {
                    return
                }
  
                if let appID = newValue["appid"] as? String {
                    self.directionModel.appId = appID
                }
                if let appName = newValue["appname"] as? String {
                    self.directionModel.appName = appName
                }
                if let isshowAp = newValue["isshowwap"] as? Int {
                    self.directionModel.isshowWap = isshowAp
                }
                if let wapUrl = newValue["wapurl"] as? String {
                    self.directionModel.wapUrl = wapUrl
                }
                if let status = newValue["status"] as? Int {
                    self.directionModel.status = status
                }
                if let desc = newValue["desc"] as? String {
                    self.directionModel.desc = desc
                }
                completed()
            case .failure(_):
                break
            }
     }
    
    }
    
}
extension GCGameViewController: UIWebViewDelegate {

}
