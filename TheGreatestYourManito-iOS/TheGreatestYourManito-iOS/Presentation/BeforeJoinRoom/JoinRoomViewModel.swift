//
//  BeforeJoinRoomViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import SwiftUI

final class JoinRoomViewModel: ObservableObject {
    
    @Published var roomType: RoomType
    @Published var roomName: String = ""
    @Published var memberCount: Int = 0
    @Published var memberListModel: [JoinMemberModel] = []
    @Published var isLoading: Bool = false
    
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
    
}
