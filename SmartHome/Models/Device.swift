//
//  Device.swift
//  SmartHome
//
//  Created by Esther on 9/28/22.
//

import Foundation
class Device: Codable {
    var name: String
    var isOn: Bool
    let id: UUID
    
    init(name: String, isOn: Bool = false, id: UUID = UUID()){
        self.name = name
        self.isOn = isOn
        self.id = id
    }
} // End of Class

extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id
    }
} // End of Extension
