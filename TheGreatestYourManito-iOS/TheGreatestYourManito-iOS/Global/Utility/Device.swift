//
//  Device.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import SwiftUI

struct Device {
    
    func getDeviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
}
