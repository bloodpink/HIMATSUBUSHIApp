//
//  Haa3ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/16.
//
//【前ViewControllerで指定・入力されたプレイヤー人数・プレイヤー名・ラウンド数を受け取り表示。】

import UIKit

class HaaCheackViewController : UIViewController {

    //前ViewControllerで入力・決定したものを表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true


        deciededRoundCountLabel.text = "\(Global.shared.roundConut)回"
        
        deciededRoundCountLabel.adjustsFontSizeToFitWidth = true
        
        
        let playerLabelArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
        
        for i in 0 ..< Global.shared.globalPlayerArray.count {
            playerLabelArray[i]?.text = Global.shared.globalPlayerArray[i]
        }
        
        
        player4NameLabel.isHidden = Global.shared.globalPlayerArray.count < 4
        player5NameLabel.isHidden = Global.shared.globalPlayerArray.count < 5
        player6NameLabel.isHidden = Global.shared.globalPlayerArray.count < 6
        player7NameLabel.isHidden = Global.shared.globalPlayerArray.count < 7
        player8NameLabel.isHidden = Global.shared.globalPlayerArray.count < 8
        
    }
    

    @IBOutlet weak var deciededRoundCountLabel: UILabel!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    //画面遷移　＋　isCheckedArrayの数もプレイヤー人数と同じ数にする
    @IBAction func orderNextBurron(_ sender: Any) {

        for _ in 0 ..< Global.shared.globalPlayerArray.count {
            Global.shared.isCheckedNumberArray.append([Int]())
        }
        
        performSegue(withIdentifier: "order", sender: nil)
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

