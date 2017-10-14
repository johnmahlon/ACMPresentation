//
//  MainTableViewCell.swift
//  ACMToDoList
//
//  Created by John Peden on 10/5/17.
//  Copyright © 2017 John Peden. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

  @IBOutlet var itemLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
