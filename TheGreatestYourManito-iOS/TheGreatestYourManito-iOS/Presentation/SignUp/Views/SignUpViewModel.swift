//
//  SignUpViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import SwiftUI

final class SignUpViewModel: ObservableObject {
    
    @Published var nickname: String = "" {
        didSet {
            validateNickname()
        }
    }
    @Published var isEnabled: Bool = false
    @Published var isSuccess: Bool = false
    @Published var showToast: Bool = false
    @Published var toastText: String = ""
    
    func postMakeUser(nickname: String) {
        guard let deviceId = UserDefaults.standard.string(forKey: UserDefaultsLiterals.deviceId) else {return}
        let requestBody = MakeUserRequestBody(nickname: nickname, deviceId: deviceId)
        
        NetworkService.shared.userService.postMakeUser(requestBody: requestBody, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                UserDefaults.standard.set(response.result?.userCode, forKey: UserDefaultsLiterals.userCode)
                UserDefaults.standard.set(response.result?.userId, forKey: UserDefaultsLiterals.userId)
                print(UserDefaults.standard.string(forKey: UserDefaultsLiterals.userCode) ?? "")
                print(UserDefaults.standard.string(forKey: UserDefaultsLiterals.userId) ?? "")
                self.isSuccess = true
            default:
                self.toastPost("네트워크 에러가 발생했습니다./n다시 시도해주세요.")
                // TODO: Error 가져올 수 있게 해주세요 ㅠㅠ
                // TODO: 409 에러 시 중복된 ID 토스트 필요
                return
            }
        })
    }
    
    private func validateNickname() {
        if containsCombinedHangul(nickname) {
            showToast = true
            toastText = "조합형 한글은 닉네임에 사용할 수 없습니다."
        } else {
            showToast = false
        }
        isEnabled = !nickname.isEmpty &&
        nickname.count <= 7 &&
        !containsCombinedHangul(nickname)
    }
    
    private func containsCombinedHangul(_ text: String) -> Bool {
        let regex = "[ㄱ-ㅎㅏ-ㅣ]"
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let range = NSRange(location: 0, length: text.utf16.count)
            // 문자열 내에 조합형 한글이 하나라도 있으면 true 반환 ex)ㅋㅔㅂㅏㅂ
            return regex.firstMatch(in: text, options: [], range: range) != nil
        } catch {
            print("Invalid regex: \(error.localizedDescription)")
            return false
        }
    }
    
    func confirmButtonTapped() {
        guard UserInputPolicy.userNickNameIsValid(nickname) else {
            toastPost("닉네임은 한글, 영문 7자 이하여야 합니다.")
            return
        }
        
        postMakeUser(nickname: nickname)
    }
    
    private func toastPost(_ message: String) {
        self.toastText = message
        self.showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.toastDelay) { [weak self] in
            self?.showToast = false
        }
    }
    
}
