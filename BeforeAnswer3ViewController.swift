//
//  BeforeAnswer3ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/11/07.
//

import UIKit

class BeforeAnswer3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "final", sender: nil)
    }
    

}
