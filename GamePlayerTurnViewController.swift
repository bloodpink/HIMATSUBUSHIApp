//
//  GamePlayerTurnViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/30.
//

import UIKit

class GamePlayerTurnViewController: UIViewController {

    

    override func viewWillAppear(_ animated: Bool) {
        turnPlayerNameLabel.text = "\(Global.shared.globalPlayerArray[count])さんの番です"
        turnPlayerFinishButton.setTitle("\(Global.shared.globalPlayerArray[count])さんの演技が終了", for: .normal)
        
        if count < Global.shared.globalPlayerArray.count {
            count += 1
        }
    }
    

    
    var count = 0
    @IBOutlet weak var turnPlayerNameLabel: UILabel! //○さんの番です
    @IBOutlet weak var turnPlayerFinishButton: UIButton! //○さんの演技終了
    
    
    
    //シーンを確認する
    @IBAction func forgetSceneButton(_ sender: Any) {
        performSegue(withIdentifier: "forgetScene", sender: nil)
    }
    
    
    
    //演技が終了
    @IBAction func onePlayerTurnFinishButton(_ sender: UIButton) {
        performSegue(withIdentifier: "answer", sender: nil)
    }
    
    
}
