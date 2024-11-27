//
//  SignUpViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    @Published var nickname: String = ""
    
    func postMakeUser(nickname: String) {
        guard let deviceId = UserDefaults.standard.string(forKey: "deviceId") else {return}
        let requestBody = MakeUserRequestBody(nickname: nickname, deviceId: deviceId)
        
        NetworkService.shared.userService.postMakeUser(requestBody: requestBody, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                UserDefaults.standard.set(response.result?.userCode, forKey: "userCode")
                print(UserDefaults.standard.string(forKey: "userCode") ?? "")
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}

