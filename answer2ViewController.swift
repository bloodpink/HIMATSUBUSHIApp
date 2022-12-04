//
//  answer2ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/03.
//

import UIKit

class answer2ViewController: UIViewController {
    
    var atozArray = ["A","B","C","D","E","F","G","H"]
    var viewController = Answer0ViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        aThemeLabel.text = Global.shared.randomTheme.a
        bThemeLabel.text = Global.shared.randomTheme.b
        cThemeLabel.text = Global.shared.randomTheme.c
        dThemeLabel.text = Global.shared.randomTheme.d
        eThemeLabel.text = Global.shared.randomTheme.e
        fThemeLabel.text = Global.shared.randomTheme.f
        gThemeLabel.text = Global.shared.randomTheme.g
        hThemeLabel.text = Global.shared.randomTheme.h
        
        player4NameLabel.isHidden = Global.shared.globalPlayerArray.count < 4
        player5NameLabel.isHidden = Global.shared.globalPlayerArray.count < 5
        player6NameLabel.isHidden = Global.shared.globalPlayerArray.count < 6
        player7NameLabel.isHidden = Global.shared.globalPlayerArray.count < 7
        player8NameLabel.isHidden = Global.shared.globalPlayerArray.count < 8
        
        player4AnswerLabel.isHidden = Global.shared.globalPlayerArray.count < 4
        player5AnswerLabel.isHidden = Global.shared.globalPlayerArray.count < 5
        player6AnswerLabel.isHidden = Global.shared.globalPlayerArray.count < 6
        player7AnswerLabel.isHidden = Global.shared.globalPlayerArray.count < 7
        player8AnswerLabel.isHidden = Global.shared.globalPlayerArray.count < 8
        
        
        self.navigationItem.hidesBackButton = true
        
        nextButtonLabel.titleLabel?.text = "次のシーンの結果へ"
        roundLabel.text = "第\(Global.shared.roundConut)回戦　お題：\(Global.shared.randomTheme.theme)"
        
        
        let nameArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
  
        for i in 0 ..< Global.shared.globalPlayerArray.count {
            nameArray[i]?.text = Global.shared.globalPlayerArray[i]
        }
        
        
        method()

    }
    
    
    
    var count = 0

    @IBOutlet weak var aThemeLabel: UILabel!
    @IBOutlet weak var bThemeLabel: UILabel!
    @IBOutlet weak var cThemeLabel: UILabel!
    @IBOutlet weak var dThemeLabel: UILabel!
    @IBOutlet weak var eThemeLabel: UILabel!
    @IBOutlet weak var fThemeLabel: UILabel!
    @IBOutlet weak var gThemeLabel: UILabel!
    @IBOutlet weak var hThemeLabel: UILabel!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    @IBOutlet weak var player1AnswerLabel: UILabel!
    @IBOutlet weak var player2AnswerLabel: UILabel!
    @IBOutlet weak var player3AnswerLabel: UILabel!
    @IBOutlet weak var player4AnswerLabel: UILabel!
    @IBOutlet weak var player5AnswerLabel: UILabel!
    @IBOutlet weak var player6AnswerLabel: UILabel!
    @IBOutlet weak var player7AnswerLabel: UILabel!
    @IBOutlet weak var player8AnswerLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        //最後の出題者の番になったら
        if count == Global.shared.globalPlayerArray.count - 1{
            
            //最終ラウンドなら
            if Global.shared.roundApeendCount == Global.shared.roundConut {
                nextButtonLabel.setTitle("全ラウンド終了！次へ！", for: .normal)
            //最終ラウンドじゃないなら
            } else {
                nextButtonLabel.setTitle("現在の順位へすすむ", for: .normal)
            }
        }

        method()
    }
    
    
    
    
    
    
    func method () {
            
        
        //全員の結果を見たら
        if count == Global.shared.globalPlayerArray.count{
            
            count = 0
            Global.shared.count = 0
            
            //更に最終ラウンドだったら最後の画面へ
            if Global.shared.roundApeendCount == Global.shared.roundConut {
                
                performSegue(withIdentifier: "finallyResult", sender: nil)
                return;
            }
            
            performSegue(withIdentifier: "rank", sender: nil)
            return;
        }
        
        
        
        
        var answerPlayerLabelArray = [player1AnswerLabel,player2AnswerLabel,player3AnswerLabel,player4AnswerLabel,player5AnswerLabel,player6AnswerLabel,player7AnswerLabel,player8AnswerLabel]

        var count2 = 0
        
        for _ in 0 ..< Global.shared.globalPlayerArray.count {
            answerPlayerLabelArray[count2]?.text = "\(atozArray[Global.shared.isCheckedNumberArray[count2][count]])"
            count2 += 1
        }

        
        
        
        //まずラベルを黒にリセット
        for i in answerPlayerLabelArray {
            i?.textColor = UIColor.black
        }
        
        //出題者ラベルを赤色に
        let questionerPlayerLabel = answerPlayerLabelArray.remove(at: count)
        questionerPlayerLabel?.textColor = UIColor.red
        
        //正解者ラベルを赤色に
        for i in answerPlayerLabelArray {
            if questionerPlayerLabel?.text == i?.text {
                i?.textColor = UIColor.red
            }
        }
        
        count += 1

    }
}
