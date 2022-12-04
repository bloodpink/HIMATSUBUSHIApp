//
//  TableViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/08/01.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    var count = 0
    var count2 = 0
    var cellArray = [UITableViewCell]()
    var viewController = Answer0ViewController()
    var isChecked = false
    var cell2Array = [TableViewCell]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.tableView.backgroundColor = UIColor.clear
        
    }
    
    
    
    
    //cell構築
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            let themeArray = [Global.shared.randomTheme.a,Global.shared.randomTheme.b,Global.shared.randomTheme.c,Global.shared.randomTheme.d,Global.shared.randomTheme.e,Global.shared.randomTheme.f,Global.shared.randomTheme.g,Global.shared.randomTheme.h]
            
            cell.cellLabel.text = "\(themeArray[count])"
            tableView.rowHeight = 50
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.masksToBounds = false
            cell.cellImage.image = UIImage(named: "unchecked")
            
            //スクロールする度に呼ばれる為count=0をつける
            if count < 7 {
                count += 1
            } else {
                count = 0
            }

            
            Global.shared.cellArray.append(cell)
            return cell
        }
        
        return UITableViewCell()
    }

    
    
    
    //セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }

    //セルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear
        
        return marginView
    }
    
    //セクションのヘッダーの高さ
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        }else {
            return 30
        }
    }

    //セクションのフッターの高さ
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .red
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .blue
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップした時のセルを白にする
        tableView.deselectRow(at: indexPath as IndexPath, animated: false)
        
        
        for i in Global.shared.cellArray {
            
            let c = i as! TableViewCell
            c.isChecked = false
        }


        let table = tableView.cellForRow(at: indexPath)

        let b = table as! TableViewCell
        b.isChecked = true
        
        let parent = self.parent as! Answer0ViewController
        parent.isCheckedCount = indexPath.section
        

    }
    

}
