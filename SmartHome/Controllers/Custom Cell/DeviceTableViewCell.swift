//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import UIKit
/// Step 1 of protocol: 
protocol DeviceTableViewCellDelegate: AnyObject {
    func isOnSwitchToggled(cell: DeviceTableViewCell)
}

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    /// Step 2  of  the Protocol - Delegate Pattern. Delegate is of type Name optional because you know you are giving it to one object, but don't know who yet
    // MARK: - Properties
    weak var delegate: DeviceTableViewCellDelegate?
    
    // MARK: - Methods
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        switchToggle.isOn = device.isOn
    }
    
    // MARK: - Actions
    @IBAction func switchToggleTapped(_ sender: Any) {
        /// Step 4 of Delegation Pattern
        delegate?.isOnSwitchToggled(cell: self)
    }
    
} // End of Class
