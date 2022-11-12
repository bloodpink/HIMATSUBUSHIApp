//
//  ForgetSceneViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/30.
//

import UIKit

class ForgetSceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        ThemeLabel.text = "お題：\(Global.shared.randomTheme.theme)"
        subThemeLabel.text = Global.shared.randomTheme.subTheme
        aSceneLabel.text = Global.shared.randomTheme.a
        bSceneLabel.text = Global.shared.randomTheme.b
        cSceneLabel.text = Global.shared.randomTheme.c
        dSceneLabel.text = Global.shared.randomTheme.d
        eSceneLabel.text = Global.shared.randomTheme.e
        fSceneLabel.text = Global.shared.randomTheme.f
        gSceneLabel.text = Global.shared.randomTheme.g
        hSceneLabel.text = Global.shared.randomTheme.h
        
       

    }
    
    @IBOutlet weak var ThemeLabel: UILabel!
    @IBOutlet weak var subThemeLabel: UILabel!
    @IBOutlet weak var aSceneLabel: UILabel!
    @IBOutlet weak var bSceneLabel: UILabel!
    @IBOutlet weak var cSceneLabel: UILabel!
    @IBOutlet weak var dSceneLabel: UILabel!
    @IBOutlet weak var eSceneLabel: UILabel!
    @IBOutlet weak var fSceneLabel: UILabel!
    @IBOutlet weak var gSceneLabel: UILabel!
    @IBOutlet weak var hSceneLabel: UILabel!
    var count = 0
    
    
    var dictionary = ["a":"b","b":"a"]
    //シーンを確認する

    //アラートを出して自分のボタンを選ばせる。ボタンのテキストを「確認したら戻る」に戻す
    @IBAction func myPlayerSceneCheckButton(_ sender: Any) {

            
        let alertController = UIAlertController(title: "自分のシーンを忘れてしまった方へ", message: "確認したいプレイヤー名を選択してください", preferredStyle: .alert)
        
        
        
        
        let player1Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[0])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[0])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[0])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        let player2Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[1])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[1])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[1])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        let player3Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[2])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[2])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[2])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        
        
        
        if 4 <= Global.shared.globalPlayerArray.count {
            print("Global.shared.globalPlayerArray:\(Global.shared.globalPlayerArray)")
            let player4Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[3])", style: .default) { alertController2 in
                let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[3])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[3])", preferredStyle: .actionSheet)
                    
                    let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                    alertController2.addAction(backButton)
                    self.present(alertController2, animated: true, completion: nil)
                    }
            
            alertController.addAction(player4Button)
            
            
            
            
            
            
            
            if 5 <= Global.shared.globalPlayerArray.count {
                
                let player5Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[4])", style: .default) { alertController2 in
                    let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[4])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[4])", preferredStyle: .actionSheet)
                        
                        let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                        alertController2.addAction(backButton)
                        self.present(alertController2, animated: true, completion: nil)
                    
                }
                
                alertController.addAction(player5Button)
                
                
                
                
                
                
                if 6 <= Global.shared.globalPlayerArray.count {
                    
                    let player6Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[5])", style: .default) { alertController2 in
                        let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[5])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[5])", preferredStyle: .actionSheet)
                            
                            let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                            alertController2.addAction(backButton)
                            self.present(alertController2, animated: true, completion: nil)
                            }
                    
                    alertController.addAction(player6Button)
                    
                    
                    
                    
                    
                    
                    if 7 <= Global.shared.globalPlayerArray.count {
                        
                        let player7Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[6])", style: .default) { alertController2 in
                            let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[6])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[6])", preferredStyle: .actionSheet)
                                
                                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                                alertController2.addAction(backButton)
                                self.present(alertController2, animated: true, completion: nil)
                                }
                        
                        alertController.addAction(player7Button)
                        
                        
                        
                        
                        
                        
                        if 8 <= Global.shared.globalPlayerArray.count {
                            
                            let player8Button = UIAlertAction(title: "\(Global.shared.globalPlayerArray[7])", style: .default) { alertController2 in
                                let alertController2 = UIAlertController(title: "\(Global.shared.globalPlayerArray[7])さんは以下のシーンです", message: "\(Global.shared.orderActingSceneArray[7])", preferredStyle: .actionSheet)
                                    
                                    let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                                    alertController2.addAction(backButton)
                                    self.present(alertController2, animated: true, completion: nil)
                                    }
                            
                            alertController.addAction(player8Button)
                            
                        }
                    }
                }
            }
        }
    

        

                
        

        
        

        
        

        
        
        
        alertController.addAction(player1Button)
        alertController.addAction(player2Button)
        alertController.addAction(player3Button)
        
        
        
   
     
        
        
        
        present(alertController, animated: true, completion: nil)

        //例えば山田さんのシーンを確認する場合、山田さんが何のシーンだったのかを取ってくる昼用がある
        //この場合全てのプレイヤーが確認終了後の話だからrandomSceneは使えない　そのため　配列を用意する必要がある。配列の場合　山田さんが何番目だったかによる。
        //だが山田さんの名前を辞書にキー値にしていれば　山田さんの値をとってくることができる？
        
    }
    
    
    func dictionaryAction () {
        let alertController2 = UIAlertController(title: "さんは以下のシーンです", message: "\(Global.shared.randomTheme.randomSceneTakeOut())", preferredStyle: .actionSheet)
        
        let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
        
        alertController2.addAction(backButton)
    }

}
