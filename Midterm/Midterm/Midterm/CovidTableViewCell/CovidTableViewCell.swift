//
//  CovidTableViewCell.swift
//  Midterm
//
//  Created by user926818 on 3/30/21.
//

import UIKit

class CovidTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblState: UILabel!
    
    @IBOutlet weak var lblTotalCases: UILabel!
    
    @IBOutlet weak var lblPositive: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
