//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func switchToggleTapped(_ sender: Any) {
    }
    
} // End of Class
