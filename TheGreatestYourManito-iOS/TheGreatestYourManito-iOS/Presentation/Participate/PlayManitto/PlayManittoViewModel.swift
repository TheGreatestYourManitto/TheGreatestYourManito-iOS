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
    
    let receiverUserName: String
    let receiverUserId: Int
    let manittoRoomName: String
    let manittoRoomId: Int
    let manittoEndDate: Date
    var todaysCheeringCount: Int = 0
    
    init(
        receiverUserName: String,
        receiverUserId: Int,
        manittoRoomName: String,
        manittoRoomId: Int,
        manittoEndDate: Date
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
        guard let cheerType else { return }
        postCheer(with: cheerType, text: cheerText)
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
                #if DEBUG
                print("error: \(result)")
                #endif
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
                self?.isNextScreenActive = true
                
            default:
                #if DEBUG
                print("error: \(result)")
                #endif
                break
            }
        }
    }
}
