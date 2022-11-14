//
//  TableViewCell.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/11/14.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
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
    


    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
