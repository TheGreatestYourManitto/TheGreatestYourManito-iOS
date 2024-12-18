//
//  IntroViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import SwiftUI

final class IntroViewModel: ObservableObject {
    
    @Published var isIdentified: Bool? = nil
    @Published var isLoading: Bool = false
    @Published var toastOccurred: Bool = false
    @Published var toastText: String = ""
    
    func postUserIdentify() {

        showLoadingIfNeeded()
        
        let device = Device()
        _ = device.getDeviceUUID()
        guard let deviceId = UserDefaults.standard.string(forKey: "deviceId") else {return}
        let requestBody = UserIdentifyRequestBody(deviceId: deviceId)
        
        NetworkService.shared.userService.postUserIdentify(
            requestBody: requestBody,
            completion: { [weak self] result in
                guard let self else { return }
                // 로딩 해제
                self.isLoading = false
                
                switch result {
                                    
                case .success(let response):
                    self.isIdentified = true
                    if let userId = response.result?.userId {
                        LocalStorageManager.saveUserId(userId)
                    }
                    toastPost("로그인에 성공했습니다.")
                case .requestErr:
                    self.isIdentified = false
                    toastPost("서버 에러가 발생했습니다.\n다시 시도해주세요.")
                default:
                    toastPost("알 수 없는 오류가 발생했습니다.\n다시 시도해주세요.")
                    return
                }
            })
    }
    
    private func toastPost(_ message: String) {
        self.toastText = message
        self.toastOccurred = true
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.toastDelay) { [weak self] in
            self?.toastOccurred = false
        }
    }
    
    private func showLoadingIfNeeded() {
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.apiDelay) { [weak self] in
            if self?.isIdentified == nil {
                self?.isLoading = true
            }
        }
    }
}
