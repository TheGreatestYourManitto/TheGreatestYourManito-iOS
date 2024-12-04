//
//  IntroViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import SwiftUI

final class IntroViewModel: ObservableObject {
    
    @Published var isIdentified: Bool = false
    
    func postUserIdentify() {
        let device = Device()
        _ = device.getDeviceUUID()
        guard let deviceId = UserDefaults.standard.string(forKey: "deviceId") else {return}
        let requestBody = UserIdentifyRequestBody(deviceId: deviceId)
        
        NetworkService.shared.userService.postUserIdentify(
            requestBody: requestBody,
            completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                self.isIdentified = true
                print("isIdentified : \(self.isIdentified)")
            case .requestErr:
                self.isIdentified = false
                print("isIdentified : \(self.isIdentified)")
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
