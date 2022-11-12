//
//  AnswerTableViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/30.
//isCheckeArrayを使う。選択されたセルが何番目かをここで記録。 isCheckedArray

import UIKit
import OrderedCollections

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var container: UIView!
    //回答用者1周するカウント
    var count = 0
    //何番目のセルか（TableViewControllerから受け取る用）
    var isCheckedCount = 0
    
    var kugiriCount = 0
    
    var quetionerDictionaryArray : OrderedDictionary <String,Int> = [:]
    var quetionerArray = [PlayerNameAndPoint]()
    
    var quetionerPlayer : String = ""
    
    
    var themeArray = [Global.shared.randomTheme.a,Global.shared.randomTheme.b,Global.shared.randomTheme.c,Global.shared.randomTheme.d,Global.shared.randomTheme.e,Global.shared.randomTheme.f,Global.shared.randomTheme.g,Global.shared.randomTheme.h]
    
    
    
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        self.navigationItem.hidesBackButton = true

        
        quetionerArray = Global.shared.playerPointNameArray.remove(at: Global.shared.count)
        
        quetionerPlayer = Global.shared.globalPlayerArray.remove(at: Global.shared.count)
        
        labelTextChange()
        
        //選択したセルが何番目かを格納
        let index = themeArray.firstIndex(of: Global.shared.orderActingSceneArray[Global.shared.count])
        
        Global.shared.isCheckedNumberArray[Global.shared.count].append(index!)
        
    }
    

    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        var falseCount = 0
        
        for i in 0 ..< 8 {

            let c = Global.shared.cellArray[i] as! TableViewCell2

            if c.isChecked == false {
                falseCount += 1



                if falseCount == 8 {

                    let alertController = UIAlertController(title: "解答が選択されていません", message: "解答を１つ選択してください", preferredStyle: .alert)
                    present(alertController, animated: true, completion: nil)
                    let alertAction = UIAlertAction(title: "戻る", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    return;
                }
            }
        }
        
        

    
        //orderSceneArrayがa~hで作成した配列の何番目かを取得。 //正解者用（省いてから付け足す用）
        let array = Global.shared.isCheckedNumberArray.remove(at: Global.shared.count)


        //全てのセルのisCheckedを確認し、trueだった時のセルのテキストが正解だったらポイント加算
        for i in Global.shared.cellArray {
            
            
            
            
            let c = i as! TableViewCell2
            
            
            if c.isChecked == true {
      
                
                //回答者の選択したセルが何番目かを格納する　(count2はisCheckedがtrueだった時までの繰り返しの数＝セルが何番目か)
                Global.shared.isCheckedNumberArray[count].append(isCheckedCount)
                
  
                
                //出題者のシーンと同じかどうか　→　「カウント」の最後の数＝プレイヤー人数　→ 画面遷移時に＋１
                if c.cellLabel.text == Global.shared.orderActingSceneArray[Global.shared.count] {

                    
                    
                    
                    
                    var questionerPoint = quetionerArray[0].point
                    questionerPoint += 1
                    quetionerArray[0].point = questionerPoint
                    print("questionerPoint:\(questionerPoint)")
                    print("\(quetionerArray[0])のPoint:\(quetionerArray[0].point)")
                    
                    
                 

                    var answerPoint = Global.shared.playerPointNameArray[count][0].point
                    answerPoint += 1
                    Global.shared.playerPointNameArray[count][0].point = answerPoint
                    print("answerPoint:\(answerPoint)")
                    print("\(Global.shared.playerPointNameArray[count][0].name)のPoint:\(Global.shared.playerPointNameArray[count][0].point)")
                    
                }
            }
            
            c.isChecked = false
        }
        

        Global.shared.isCheckedNumberArray.insert(array, at: Global.shared.count)
        count += 1
        
    
        

        
        //1人の出題者に対して全員の回答者が解答終了時（この時だけglobalPlayerArrayは回答者だけ格納されているので-1は不要）
       testif:if count == Global.shared.globalPlayerArray.count {
           
           //cellArray.appende(cell)はviewController画面に遷移した時に毎回行われる。その為１出題者につき全員の回答が終了したらまたcellがappendされることを見越して、格納されている８つcellを削除する必要がある。そうしないと１６こ、２４こというセルが格納され,falseCountで正しい計算ができなくなる（ちなみに１回答ごとに全てfalseにしている）
           Global.shared.cellArray.removeAll()
           
//           Global.shared.array3.insert(quetionerDictionaryArray, at: Global.shared.count)
           Global.shared.playerPointNameArray.insert(quetionerArray, at: Global.shared.count)
           
           Global.shared.globalPlayerArray.insert(quetionerPlayer, at: Global.shared.count)

           //順番が最後のプレイヤーが回答者配列に含まれていなかったら（つまり、全員出題者側が終了したら）
           if  quetionerPlayer == Global.shared.globalPlayerArray.last {
               
               Global.shared.count = 0
               
               performSegue(withIdentifier: "answer", sender: nil)
               //処理を抜ける（抜けないと下のpopViewControllerも呼ばれてしまう）
               break testif
           }

        Global.shared.count += 1
        self.navigationController?.popViewController(animated: true)
        }
        
        
        
        //画面遷移する前に以下を書くとIndexオーバーになるので画面遷移コードより下に書く
        labelTextChange()
    }
    
    
    
    
    func labelTextChange () {
        
        //ここでもglobalPlayerArrayの中身は回答者だけになっている
            label.text = "\(Global.shared.globalPlayerArray[count])さんが思う\(quetionerPlayer)さんの演技はどれ？"

    }
    
    
}


