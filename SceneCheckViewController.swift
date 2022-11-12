//
//  PlayerSceneCheckViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/28.
//

import UIKit
import OrderedCollections

class SceneCheckViewController: UIViewController {
    
    @IBOutlet weak var playerSceneLabel: UILabel!
    @IBOutlet weak var sceneLabel: UILabel!
    @IBOutlet weak var desuLabel: UILabel!
    @IBOutlet weak var turnPlayerSceneCheckButton: UIButton!
    @IBOutlet weak var turnPlayerSceneCheckButtonIB: UIButton!
    
    
    var count = 0
    var count2 = 0
    //シーンだけを入れる用配列
    var randomcopy = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        sceneLabel.adjustsFontSizeToFitWidth = true
 
        
        
        for i in Global.shared.globalPlayerArray {
            
            let player = PlayerNameAndPoint(name: "\(i)", point: 0)
            
            Global.shared.playerPointNameArray.append([player])
        }
        
        

        
        randomcopy += [Global.shared.randomTheme.a,Global.shared.randomTheme.b,Global.shared.randomTheme.c,Global.shared.randomTheme.d,Global.shared.randomTheme.e,Global.shared.randomTheme.f,Global.shared.randomTheme.g,Global.shared.randomTheme.h]
        
        
        
        
        //１戦毎の各プレイヤーのシーンを、プレイヤーの演技順に格納
        for _ in 0 ..< Global.shared.globalPlayerArray.count {
            //ランダムに選ぶ
            let random = randomcopy.randomElement()
            //選んだものをコピー配列から削除
            randomcopy.removeAll(where: {$0 == random})
            //格納
            Global.shared.orderActingSceneArray.append(random!)
        }
        
        
        labelChange()
        
        playerSceneLabel.isHidden = true
        sceneLabel.isHidden = true
        desuLabel.isHidden = true
        
    }
    

    
    
    //シーン確認ボタン
    @IBAction func sceneCheckButton(_ sender: Any) {
        
        playerSceneLabel.isHidden = false
        sceneLabel.isHidden = false
        desuLabel.isHidden = false
        
        turnPlayerSceneCheckButtonIB.isHidden = true
        
    }
    

    //シーン確認後ボタン
    @IBAction func nextPlayerSceneCheckButton(_ sender: Any) {
        
        turnPlayerSceneCheckButtonIB.isHidden = false
        
        count += 1
        if count < Global.shared.globalPlayerArray.count {
            
        labelChange()
        
        }
        
        
        //最後のプレイヤーまで回ったら画面遷移
        if count == Global.shared.globalPlayerArray.count {
            performSegue(withIdentifier:"gamePlayerTurn",sender:nil)
        }
        
        playerSceneLabel.isHidden = true
        sceneLabel.isHidden = true
        desuLabel.isHidden = true
    }
    
    
    
    //「○さんは」＋「シーン」+「ボタンのタイトル」
    func labelChange() {
        playerSceneLabel.text = "\(Global.shared.globalPlayerArray[count])さんは"
        sceneLabel.text = "\(Global.shared.orderActingSceneArray[count])"
        turnPlayerSceneCheckButton.titleLabel?.text = "\(Global.shared.globalPlayerArray[count])さんの\nシーンを確認する"
    }


}
