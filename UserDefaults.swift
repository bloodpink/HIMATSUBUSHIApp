//
//  UserDefaults.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/08/01.
//

import Foundation

class ThemeUserDefaults {
    
    func saveTheme(theme:[Theme]) {
        let jsonEncoder = JSONEncoder()
        //jsonデータに変換
        guard let data = try? jsonEncoder.encode(theme) else {
            return
        }
        //変換したjsonデータを保存
        UserDefaults.standard.set(data, forKey:"theme")
        }
    
    
    
    
    func loadTheme () -> [Theme]? {
        
        let jsonDecoder = JSONDecoder()
        //保存したjsonデータを取り出す　　　　　　　　　　　　　　　　　　　　　　//取り出したjosnデータを[Theme]に変換
        guard let data = UserDefaults.standard.data(forKey: "theme"),let theme = try? jsonDecoder.decode([Theme].self , from : data) else {
            return nil
        }
            return theme
    }
    
    var array2 : [String]?
    
    func array1 (array:[String]) {
        for i in 0 ..< array.count {
            array2!.append(array[i])
        }
    }
    
    
    
}
