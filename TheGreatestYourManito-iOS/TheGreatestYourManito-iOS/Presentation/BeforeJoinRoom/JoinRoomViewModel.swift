//
//  BeforeJoinRoomViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import SwiftUI

final class JoinRoomViewModel: ObservableObject {
    
//    @Published var cheerType: CheerType?
//    @Published var cheerText: String = ""
//    @Published var isNextScreenActive: Bool = false
    
    @Published var roomType: RoomType
    @Published var roomName: String = ""
//    @Published var joinCode: String
    @Published var memberCount: Int = 0
    @Published var memberListModel: [JoinMemberModel] = []
    @Published var isLoading: Bool = false
    
//    let receiverUserName: String
//    let receiverUserId: Int
//    let manittoRoomName: String
//    let manittoEndDate: Date
//    var todaysCheeringCount: Int = 0
    
    init(roomType: RoomType) {
        self.roomType = roomType
    }
    
    init(roomType: RoomType, roomName: String, memberCount: Int, memberListModel: [JoinMemberModel], isLoading: Bool) {
        self.roomType = roomType
        self.roomName = roomName
        self.memberCount = memberCount
        self.memberListModel = memberListModel
        self.isLoading = isLoading
    }
    
//    func selectCheerType(_ cheerType: CheerType) {
//        self.cheerType = cheerType
//        let result = getCheerText(with: cheerType)
//        self.cheerText = result
//    }
//    
//    func tapSendButton() {
//        guard let cheerType else { return }
//        let result = postCheer(with: cheerType, text: cheerText)
//        if result { isNextScreenActive = true }
//    }
}
