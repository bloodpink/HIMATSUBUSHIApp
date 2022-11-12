//
//  Theme.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/24.
//

import Foundation

struct Theme : Equatable,Codable {
    
    let theme : String
    let subTheme : String
    let a : String
    let b : String
    let c : String
    let d : String
    let e : String
    let f : String
    let g : String
    let h : String
    
    
    //シーン配列からシーンをランダムに１つ取り出し、その取り出したシーンをシーン配列から除去
    func randomSceneTakeOut() -> String {
        var randomSceneArray = [a,b,c,d,e,f,g,h]
        
        var randomScene = randomSceneArray.randomElement()
        randomSceneArray.removeAll(where: {$0 == randomScene})
        print(randomSceneArray)
        //randomElementはオプショナルを返すため「！」をつけてアンラップ
        return randomScene!
    }
    
    

    
}
