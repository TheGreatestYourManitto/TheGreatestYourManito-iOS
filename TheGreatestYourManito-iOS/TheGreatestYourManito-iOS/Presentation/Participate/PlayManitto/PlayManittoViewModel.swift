//
//  PlayManittoViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

final class PlayManittoViewModel: ObservableObject {
    
    @Published var cheerType: CheerType?
    @Published var cheerText: String = ""
    @Published var isNextScreenActive: Bool = false
    @Published var showToast: Bool = false
    @Published var toastText: String = ""
    
    let receiverUserName: String
    let receiverUserId: Int
    let manittoRoomName: String
    let manittoRoomId: Int
    let manittoEndDate: String
    var todaysCheeringCount: Int = 0
    
    init(
        receiverUserName: String,
        receiverUserId: Int,
        manittoRoomName: String,
        manittoRoomId: Int,
        manittoEndDate: String
    ) {
        self.receiverUserName = receiverUserName
        self.receiverUserId = receiverUserId
        self.manittoRoomName = manittoRoomName
        self.manittoRoomId = manittoRoomId
        self.manittoEndDate = manittoEndDate
    }
    
    func selectCheerType(_ cheerType: CheerType) {
        self.cheerType = cheerType
        getCheerText(with: cheerType)
    }
    
    func tapSendButton() {
        guard let cheerType else {
            toastPost("응원 타입을 선택해주세요.")
            return
        }
        postCheer(with: cheerType, text: cheerText)
    }
    
    private func toastPost(_ message: String) {
        self.toastText = message
        self.showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + UXPolicy.toastDelay) { [weak self] in
            self?.showToast = false
        }
    }
}

// MARK: API
private extension PlayManittoViewModel {
    func getCheerText(with type: CheerType) {
        NetworkService.shared.cheerService.getCheerMassage(type: type.name) { [weak self] result in
            switch result {
                
            case .success(let response):
#if DEBUG
                print(print("Success: \(response)"))
#endif
                guard let result = response.result else {return}
                self?.cheerText = result.message.cheerMessage
                
            default:
                self?.toastPost("네트워크 에러가 발생했습니다.\n다시 시도해주세요.")
                break
            }
        }
    }
    
    func postCheer(with type: CheerType, text: String) {
        NetworkService.shared.cheerService.postSendCheer(
            requestBody: .init(
                roomId: manittoRoomId,
                cheerType: type.name,
                message: text
            )
        ) { [weak self] result in
            switch result {
                
            case .success(let response):
                #if DEBUG
                print(print("Success: \(response)"))
                #endif
                guard let result = response.result else {return}
                self?.todaysCheeringCount = result.todaysCheeringCount
                self?.isNextScreenActive = true
                
            default:
                self?.toastPost("네트워크 에러가 발생했습니다.\n다시 시도해주세요.")
                break
            }
        }
    }
}
