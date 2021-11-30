//
//  MyTableViewCell.swift
//  TestTableApp
//
//  Created by user on 22.11.21.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelKey: UILabel!
    @IBOutlet weak var imageValue: UIImageView!
    @IBOutlet weak var imageKey: UIImageView!
    @IBOutlet weak var keyValue: UILabel!
    @IBOutlet weak var valueValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
