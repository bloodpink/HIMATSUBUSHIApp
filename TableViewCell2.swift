//
//  TableViewCell2.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/08/31.
//

import UIKit

class TableViewCell2: UITableViewCell,UITableViewDelegate {

    
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    let checkImage = UIImage(named: "checked")
    let uncheckImage = UIImage(named: "unchecked")
    
    
    
    var isChecked : Bool = false {
        didSet {
            if isChecked == true {
                cellImage.image = checkImage
            } else {
                cellImage.image = uncheckImage
            }
        }
    }


    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

}
