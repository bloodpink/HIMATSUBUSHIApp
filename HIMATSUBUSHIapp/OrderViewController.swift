//
//  orderViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/16.
//


//１、入力されたプレイヤー名の受け取り
//２、ランダムボタンを押すと、プレイヤーラベルがプレイヤー数だけ上から順にランダムに表示（プレイヤーのラベルとプレイヤーのラベルのテキストの配列をそれぞれ生成し、それぞれランダムに取り出してラベルのテキストをランダムテキストにする）


import UIKit

class OrderViewController: UIViewController {
    
    
    @IBOutlet weak var order1PlayerLabel: UILabel!
    @IBOutlet weak var order2PlayerLabel: UILabel!
    @IBOutlet weak var order3PlayerLabel: UILabel!
    @IBOutlet weak var order4PlayerLabel: UILabel!
    @IBOutlet weak var order5PlayerLabel: UILabel!
    @IBOutlet weak var order6PlayerLabel: UILabel!
    @IBOutlet weak var order7PlayerLabel: UILabel!
    @IBOutlet weak var order8PlayerLabel: UILabel!
    
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var sixLabel: UILabel!
    @IBOutlet weak var sevenLabel: UILabel!
    @IBOutlet weak var eightLabel: UILabel!
    
    
    
    var playerNameArray = [String]() //遷移先に渡す用の配列
    var  count = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        order1PlayerLabel.isUserInteractionEnabled = true
        order2PlayerLabel.isUserInteractionEnabled = true
        order3PlayerLabel.isUserInteractionEnabled = true
        order4PlayerLabel.isUserInteractionEnabled = true
        order5PlayerLabel.isUserInteractionEnabled = true
        order6PlayerLabel.isUserInteractionEnabled = true
        order7PlayerLabel.isUserInteractionEnabled = true
        order8PlayerLabel.isUserInteractionEnabled = true
        
        order1PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order2PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order3PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order4PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order5PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order6PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order7PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        order8PlayerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(singleTapping)))
        
        let playerLabelArray = [order1PlayerLabel,order2PlayerLabel,order3PlayerLabel,order4PlayerLabel,order5PlayerLabel,order6PlayerLabel,order7PlayerLabel,order8PlayerLabel]
        
        for i in 0 ..< Global.shared.globalPlayerArray.count {
            playerLabelArray[i]?.text = Global.shared.globalPlayerArray[i]
        }

        
        order4PlayerLabel.isHidden = Global.shared.globalPlayerArray.count < 4
        order5PlayerLabel.isHidden = Global.shared.globalPlayerArray.count < 5
        order6PlayerLabel.isHidden = Global.shared.globalPlayerArray.count < 6
        order7PlayerLabel.isHidden = Global.shared.globalPlayerArray.count < 7
        order8PlayerLabel.isHidden = Global.shared.globalPlayerArray.count < 8
        
        fourLabel.isHidden = Global.shared.globalPlayerArray.count < 4
        fiveLabel.isHidden = Global.shared.globalPlayerArray.count < 5
        sixLabel.isHidden = Global.shared.globalPlayerArray.count < 6
        sevenLabel.isHidden = Global.shared.globalPlayerArray.count < 7
        eightLabel.isHidden = Global.shared.globalPlayerArray.count < 8
        
        
        for i in Global.shared.globalPlayerArray {
            if i == "" {
                Global.shared.globalPlayerArray.removeAll(where: {$0 == i})
            }
        }
        
    }

    
    
    @IBAction func randomOrderButton(_ sender: Any) {
        
        let playerLabelArray = [order1PlayerLabel,order2PlayerLabel,order3PlayerLabel,order4PlayerLabel,order5PlayerLabel,order6PlayerLabel,order7PlayerLabel,order8PlayerLabel]
    
        
        Global.shared.globalPlayerArray.shuffle()
        
        for i in 0 ..<  Global.shared.globalPlayerArray.count {
            playerLabelArray[i]!.text = Global.shared.globalPlayerArray[i]
        }

    }
    
    
    
    @IBAction func playStartButton(_ sender: Any) {
    performSegue(withIdentifier: "themeAnnouncement", sender: nil)
    }
    
    

    
    @objc func tapped(label:UILabel) {
        
        var playerLabelArray = [order1PlayerLabel,order2PlayerLabel,order3PlayerLabel,order4PlayerLabel,order5PlayerLabel,order6PlayerLabel,order7PlayerLabel,order8PlayerLabel]
        
            if label.backgroundColor == UIColor.gray {
                label.backgroundColor = UIColor.white
            } else {
                label.backgroundColor = UIColor.gray
                playerLabelArray.removeAll(where: { $0 == label} )
        
        
                for i in playerLabelArray {
        
                    if i!.backgroundColor == UIColor.gray {
                        swap(&label.text, &i!.text)
                        label.backgroundColor = UIColor.white
                        i?.backgroundColor = UIColor.white
                    }
                }
        
            }
        
    }
    
    


    @objc func singleTapping(_ sender: UITapGestureRecognizer) {
        
        if let label = sender.view as? UILabel {
            
            var playerLabelArray = [order1PlayerLabel,order2PlayerLabel,order3PlayerLabel,order4PlayerLabel,order5PlayerLabel,order6PlayerLabel,order7PlayerLabel,order8PlayerLabel]
        
            
            if label.backgroundColor == UIColor.gray {
                label.backgroundColor = UIColor.white
            } else {
                label.backgroundColor = UIColor.gray
                playerLabelArray.removeAll(where: { $0 == label} )
        
        
                for i in playerLabelArray {
        
                    if i!.backgroundColor == UIColor.gray {
                        swap(&label.text, &i!.text)
                        label.backgroundColor = UIColor.white
                        i?.backgroundColor = UIColor.white
                    }
                }
        
            }
            
        }
    }
    


}

