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
    
    // Parameters and Methods
    func create() {
        saveDevices()
    }
    
    func delete() {
        saveDevices()
    }
    
    func toggleIsOn(device: Device) {
        device.isOn.toggle()
        saveDevices()
    }
    
    // Persistance
    func saveDevices() {
        
    }
    func loadDevices() {
        
    }
} // End of Class
