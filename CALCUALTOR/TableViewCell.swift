//
//  TableViewCell.swift
//  CALCUALTOR
//
//  Created by Yakshi Gandhi, Raj Rami, Nishtha Patel 
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labelList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
