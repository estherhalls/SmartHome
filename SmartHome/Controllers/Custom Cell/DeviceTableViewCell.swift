//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    
    
    // MARK: - Actions
    @IBAction func switchToggleTapped(_ sender: Any) {
    }
    
} // End of Class
