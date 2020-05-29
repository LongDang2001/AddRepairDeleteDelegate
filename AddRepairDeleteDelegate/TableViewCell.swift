//
//  TableViewCell.swift
//  AddRepairDeleteDelegate
//
//  Created by admin on 2/22/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, passDataDelegate {
    
    func passData(data: String) {
        textLabelCell.text = data
    }
    let secondVCCell = SecondViewController()
    
    
    @IBOutlet weak var textLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondVCCell.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
