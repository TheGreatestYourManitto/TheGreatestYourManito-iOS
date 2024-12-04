//
//  MainViewmodel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import SwiftUI

final class MainViewmodel: ObservableObject {
    @Published var rooms: [Room] = []
    @Published var isConfirmed: Int = 0
    
    @Published var roomType: RoomType = .notOwner
    @Published var roomName: String = ""
    @Published var memberCount: Int = 0
    @Published var memberListModel: [JoinMemberModel] = []
    @Published var roomId: Int = 0
    @Published var joinCode: String = ""
    @Published var isTapRoom: Bool = false // 비밀
    @Published var isPresented: Bool = false
    
    func getFindRoomList() {
        NetworkService.shared.roomService.getFindRoomList(completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                self.rooms = response.result?.rooms.compactMap { roomData -> Room? in
                    Room(
                        roomId: roomData.roomId,
                        roomName: roomData.roomName,
                        endDate: roomData.endDate,
                        isConfirmed: roomData.isConfirmed
                    )
                } ?? []
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
    func getRoomInfoInMainView(roomId: Int) {
        NetworkService.shared.roomService.getRoomInfo(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                guard let result = response.result else {return}
                self.memberListModel = result.member.map { member in
                    JoinMemberModel(userId: member.userId, memberName: member.userName)
                }
                self.roomType = result.isAdmin ? .owner : .notOwner
                self.roomName = result.roomName
                self.memberCount = result.member.count
                self.joinCode = result.invitationCode
                
                self.isTapRoom = true // 트리거
                self.isPresented = true
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
