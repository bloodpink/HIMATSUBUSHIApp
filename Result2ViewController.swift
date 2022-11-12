//
//  Result2ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/23.
//

import UIKit

class Result2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    @IBOutlet weak var player1stNameLabel: UILabel!
    @IBOutlet weak var player2ndNameLabel: UILabel!
    @IBOutlet weak var player3rdNameLabel: UILabel!
    @IBOutlet weak var player4thNameLabel: UILabel!
    @IBOutlet weak var player5thNameLabel: UILabel!
    @IBOutlet weak var player6thNameLabel: UILabel!
    @IBOutlet weak var player7thNameLabel: UILabel!
    @IBOutlet weak var player8thNameLabel: UILabel!
    
    @IBOutlet weak var player1stPtLabel: UILabel!
    @IBOutlet weak var player2ndPtLabel: UILabel!
    @IBOutlet weak var player3rdPtLabel: UILabel!
    @IBOutlet weak var player4thPtLabel: UILabel!
    @IBOutlet weak var player5thPtLabel: UILabel!
    @IBOutlet weak var player6thPtLabel: UILabel!
    @IBOutlet weak var player7thPtLabel: UILabel!
    @IBOutlet weak var player8thPtLabel: UILabel!
    
    @IBAction func homeBackButton(_ sender: Any) {
        performSegue(withIdentifier: "home", sender: nil)
    }
    
}
