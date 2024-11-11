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
    let manittoEndDate: Date
    var todaysCheeringCount: Int = 0
    
    init(receiverUserName: String, receiverUserId: Int, manittoRoomName: String, manittoEndDate: Date) {
        self.receiverUserName = receiverUserName
        self.receiverUserId = receiverUserId
        self.manittoRoomName = manittoRoomName
        self.manittoEndDate = manittoEndDate
    }
    
    func selectCheerType(_ cheerType: CheerType) {
        self.cheerType = cheerType
        let result = getCheerText(with: cheerType)
        self.cheerText = result
    }
    
    func tapSendButton() {
        guard let cheerType else { return }
        let result = postCheer(with: cheerType, text: cheerText)
        if result { isNextScreenActive = true }
    }
}

// MARK: API
private extension PlayManittoViewModel {
    func getCheerText(with type: CheerType) -> String {
        return "\(type.name) API 결과 데이터"
    }
    
    func postCheer(with type: CheerType, text: String) -> Bool {
        print("type: \(type) + text: \(text) 전송 API 요청")
        return true
    }
}
