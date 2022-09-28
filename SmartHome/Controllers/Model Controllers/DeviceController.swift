//
//  DeviceController.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import Foundation
class DeviceController {
    
    // MARK: - Properties
    // Singleton
    static let sharedInstance = DeviceController()
    
    // SOT
    private (set) var devices: [Device] = []
    
    // Class Initialization
    init() {
        loadDevices()
    }
    
    // URL for Persistence
    private var devicesURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else {return nil}
        let url = documentsDirectory.appendingPathComponent("devices.json")
        return url
    }
    
    // MARK: - CRUD and methods
    func create(name: String) {
        let device = Device(name: name)
        devices.append(device)
        saveDevices()
    }
    
    func delete(device: Device) {
        guard let index = devices.firstIndex(of: device) else {return}
        devices.remove(at: index)
        saveDevices()
    }
    
    func toggleIsOn(device: Device) {
        device.isOn.toggle()
        saveDevices()
    }
    
    // Persistance
    func saveDevices() {
        // 1. Get the address to save a file to
        guard let url = devicesURL else {return}
        do {
            // 2. Convert the swift class into JSON data
            let data = try JSONEncoder().encode(devices)
            // 3. Save the data to the URL from step 1
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    } // End of Save Persistence
    
    func loadDevices() {
        // 1. Get the address to save a file to
        guard let url = devicesURL else {return}
        do {
            // 2. Load the raw data from the url
            let data = try Data(contentsOf: url)
            // 3. Convert the raw data into our Swift class
            let devices = try JSONDecoder().decode([Device].self, from: data)
            self.devices = devices
        } catch let error {
            print(error)
        }
    } // End of Load Persistence
    
} // End of Class
