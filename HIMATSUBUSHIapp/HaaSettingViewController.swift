//
//  Haa?2ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/06/26.
//


//１、プレイヤー人数、プレイヤー名、ラウンド数を決定（指定されたプレイヤー人数だけ、TextFieldを表示）
//２、入力されたプレイヤー名をシングルトンとして配列に入れる

import UIKit
import OrderedCollections

class HaaSettingViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
    
 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == memberPickerView {
            return memberArray.count
        } else {
            return roundArray.count
        }
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == memberPickerView {
            return String(memberArray[row])
        } else {
            return String(roundArray[row])
        }
    }
    
    //プレイヤー人数の数によりTextFieldも変動　＋　ラウンド数を格納
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        

        //pickerViewは複数あるのでどのpickerViewを使っているか、引数で区別
        if pickerView == memberPickerView {
            
            
            //方法１            
            memberCount = memberArray[row]
            
                selectedPickerArray.removeAll()
                selectedPickerArray += [player1TextField,player2TextField,player3TextField]

                if memberArray[row] > 3{
                    
                    selectedPickerArray += [player4TextField]
                    
                    if memberArray[row] > 4 {
                        
                        selectedPickerArray += [player5TextField]
                        
                        if memberArray[row] > 5 {
                            
                            selectedPickerArray += [player6TextField]
                            
                            if memberArray[row] > 6 {
                                
                                selectedPickerArray += [player7TextField]
                                
                                if memberArray[row] > 7 {
                                    
                                    selectedPickerArray += [player8TextField]

                                }
                            }
                        }
                    }
                }

            
            
                        player4TextField.isHidden = selectedPickerArray.count < 4
                        player5TextField.isHidden = selectedPickerArray.count < 5
                        player6TextField.isHidden = selectedPickerArray.count < 6
                        player7TextField.isHidden = selectedPickerArray.count < 7
                        player8TextField.isHidden = selectedPickerArray.count < 8
            
            
            
            
            //方法２：rowの数ー３の数だけ処理を変える（１〜３と４〜８をまとめた配列を用意）
            
//            let p1ToP3Array = [player1TextField!,player2TextField!,player3TextField!]
//            let p4ToP8Array = [player4TextField!,player5TextField!,player6TextField!,player7TextField!,player8TextField!]
//
//            //pickerViewを触らなかった場合に備えて初期値
//            selectedPickerArray.removeAll()
//            selectedPickerArray = p1ToP3Array
//
//            //プレイヤー人数が４人以上の場合
//            if memberArray[row] != 3 {
//
//                //３人以上だった場合のプレイヤー人数の差
//                let a = memberArray[row] - 3
//
//                //初期プレイヤー（３人）との差だけ追加
//                for i in 0 ..< a {
//                    selectedPickerArray.append(p4ToP8Array[i])
//
//                }
//
//             }
            
            
            
            //ラウンド数のpickerViewが動かされた時
        } else {
            
            Global.shared.roundConut = roundArray[row]
        }
            
    }
    
    
    @IBOutlet weak var memberPickerView: UIPickerView!
    @IBOutlet weak var roundPickerView: UIPickerView!
    
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var player3TextField: UITextField!
    @IBOutlet weak var player4TextField: UITextField!
    @IBOutlet weak var player5TextField: UITextField!
    @IBOutlet weak var player6TextField: UITextField!
    @IBOutlet weak var player7TextField: UITextField!
    @IBOutlet weak var player8TextField: UITextField!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    //Picker用の配列
    let memberArray = [3,4,5,6,7,8]
    let roundArray = [1,2,3,4,5,6,7,8]
    //textが入力されているかを調べる為用の配列
    var selectedPickerArray = [UITextField]()
    //pickerviewを動かさなかった場合の初期値
    var memberCount = 3

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        roundLabel.adjustsFontSizeToFitWidth = true
        
        memberPickerView.delegate = self
        memberPickerView.dataSource = self
        
        roundPickerView.delegate = self
        roundPickerView.dataSource = self
        
        //初期画面はプレイヤーを３人と設定
        player4TextField.isHidden = true
        player5TextField.isHidden = true
        player6TextField.isHidden = true
        player7TextField.isHidden = true
        player8TextField.isHidden = true
        selectedPickerArray += [player1TextField,player2TextField,player3TextField]

    }
    
    
    
    
    
    //もし、HiddenがtrueになっているTextFieldの中に、何も入力されていないTextFieldが１つでも存在した場合にアラートを出し、画面遷移を行わない。
    @IBAction func next(_ sender: Any) {
        
        
        for i in 0 ..< selectedPickerArray.count {
            
            if selectedPickerArray[i].text == "" {
                
                let alertController = UIAlertController(title: "入力漏れがあります", message: "確認してみてください", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "戻る", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
                return
            }
            
        }
        
        let playerArray = [player1TextField.text!,player2TextField.text!,player3TextField.text!,player4TextField.text!,player5TextField.text!,player6TextField.text!,player7TextField.text!,player8TextField.text!]
        
        
        
    
        //往復する場合がある為、if文を使って最初の１回だけ入れるようにする
        if Global.shared.globalPlayerArray.count != memberCount {
            for i in 0 ..< memberCount {
                Global.shared.globalPlayerArray.append(playerArray[i])
            }
            
        }

      
    
        //HiddenがtrueになっているTextFieldに全て入力されていたら画面遷移
        performSegue(withIdentifier: "next", sender: nil)
        
        
    }

 
}
