//
//  Global.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/14.
//

import Foundation
import OrderedCollections
import UIKit

class Global {

    
    static let shared = Global()
    //空含めた全プレイヤー名情報
    var globalPlayerArray = [String]()
    //全お題集
    var globalThemeArray = [Theme]()
    //１ラウンド毎のお題
    var randomTheme : Theme!
    //ラウンド数（pickerViewに触られなければ以下の数字が使われる）
    var roundConut = 1
    //ラウンド数を記録するカウント
    var roundApeendCount = 0
    //プレイヤーとシーン
    var playerSceneList : [String:String] = [:]
    //プレイヤーとポイント
    var playerNamePointDictionary : OrderedDictionary <String,Int> = [:]
    //xibファイルのセルをまとめる
    var cellArray = [UITableViewCell]()
    //１戦毎の各プレイヤーのシーンを、プレイヤーの演技順に格納するための配列
    var orderActingSceneArray = [String]()
    //回答したセルが何番目かを格納
    var isCheckedNumberArray = [[Int]]()
    //各プレイヤーのポイント
    var pointArray = [Int]()
    //各プレイヤーの名前とポイント
    var playerPointNameArray = [[PlayerNameAndPoint]]()
    //各場所で使う
    var count = 0
    

}
