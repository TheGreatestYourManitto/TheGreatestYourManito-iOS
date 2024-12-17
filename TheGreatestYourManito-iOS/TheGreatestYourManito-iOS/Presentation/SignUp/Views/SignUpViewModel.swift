//
//  SignUpViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    @Published var nickname: String = ""
    @Published var isSuccess: Bool = false
    @Published var showToast: Bool = false
    @Published var toastText: String = ""
    
    func confirmButtonTapped() {
        guard UserInputPolicy.userNickNameIsValid(nickname) else {
            toastPost("닉네임은 한글, 영문 7자 이하여야 합니다.")
            return
        }
        
        postMakeUser(nickname: nickname)
    }
    
    func postMakeUser(nickname: String) {
        guard let deviceId = UserDefaults.standard.string(forKey: "deviceId") else {return}
        let requestBody = MakeUserRequestBody(nickname: nickname, deviceId: deviceId)
        
        NetworkService.shared.userService.postMakeUser(requestBody: requestBody, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                UserDefaults.standard.set(response.result?.userCode, forKey: "userCode")
                print(UserDefaults.standard.string(forKey: "userCode") ?? "")
                self.isSuccess = true
            default:
                self.toastPost("네트워크 에러가 발생했습니다./n다시 시도해주세요.")
                // TODO: Error 가져올 수 있게 해주세요 ㅠㅠ
                // TODO: 409 에러 시 중복된 ID 토스트 필요
                return
            }
        })
    }
    
    private func toastPost(_ message: String) {
        self.toastText = message
        self.showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.toastDelay) { [weak self] in
            self?.showToast = false
        }
    }
}

