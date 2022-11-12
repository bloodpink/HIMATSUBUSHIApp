//
//  ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/06/26.
//

import UIKit

class homeViewController: UIViewController {


    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }

    
    @IBAction func startButton(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    
}

