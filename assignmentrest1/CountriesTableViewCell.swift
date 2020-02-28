//
//  CountriesTableViewCell.swift
//  assignmentrest1
//
//  Created by admin on 10/02/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCountries: UILabel!
    @IBOutlet weak var imgCountries: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
