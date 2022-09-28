//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import UIKit
protocol DeviceTableViewCellDelegate: AnyObject {
    func deviceToggleTapped(cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    // MARK: - Properties
    weak var delegate: DeviceTableViewCellDelegate?
    
    // MARK: - Methods
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        switchToggle.isOn = device.isOn
    }
    
    // MARK: - Actions
    @IBAction func switchToggleTapped(_ sender: Any) {
        delegate?.deviceToggleTapped(cell: self)
    }
    
} // End of Class
