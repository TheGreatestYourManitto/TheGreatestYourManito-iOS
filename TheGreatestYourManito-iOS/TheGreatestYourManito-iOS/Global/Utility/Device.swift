//
//  Device.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import SwiftUI

struct Device {
    
    func getDeviceUUID() -> String {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        UserDefaults.standard.set(deviceId, forKey: UserDefaultsLiterals.deviceId)
        return deviceId
    }
    
}
