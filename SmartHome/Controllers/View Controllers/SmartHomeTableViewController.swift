//
//  SmartHomeTableViewController.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import UIKit

class SmartHomeTableViewController: UITableViewController {
    
    let deviceController = DeviceController.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceController.devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        let device = deviceController.devices[indexPath.row]
        cell.updateViews(device: device)
        cell.delegate = self

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let device = deviceController.devices[indexPath.row]
            deviceController.delete(device: device)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    
    // MARK: - Helper Function
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter Device Information", preferredStyle: .alert)
        alertController.addTextField { deviceTextField in
            deviceTextField.placeholder = "Device Name"
        }
        let confirmAction = UIAlertAction(title: "Save Device", style: .default) { _ in
            guard let deviceTextField = alertController.textFields?.first,
                  let deviceText = deviceTextField.text else {return}
            self.deviceController.create(name: deviceText)
            self.tableView.reloadData()
            
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(dismissAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
        
        
    }
    
    // MARK: - Actions


    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
} // End of Class
