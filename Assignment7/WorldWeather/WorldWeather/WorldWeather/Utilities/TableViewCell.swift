//
//  TableViewCell.swift
//  WorldWeather
//
//  Created by Shanmuka on 3/19/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var imgMin: UIImageView!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var imgMax: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
