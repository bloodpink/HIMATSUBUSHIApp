//
//  TableViewCell3.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/13.
//

import UIKit

class TableViewCell3: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
}

protocol XibCellDelegate {
    func cellTouched (_ tableView3 : TableViewCell3, _ tableView :UITableView, didSelectRowAt indexPath: IndexPath)
}
