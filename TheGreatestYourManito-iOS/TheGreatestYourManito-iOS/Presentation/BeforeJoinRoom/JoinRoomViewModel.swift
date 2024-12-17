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
    @Published var roomId: Int = 0
    @Published var joinCode: String = ""
    @Published var nickName: String = ""
    @Published var isVaildRoom: Bool = false
    @Published var showSheet = false
    
    init(roomType: RoomType) {
        self.roomType = roomType
    }
    
    init(roomType: RoomType, joinCode: String, roomName: String, memberCount: Int, memberListModel: [JoinMemberModel], roomId: Int) {
        self.roomType = roomType
        self.joinCode = joinCode
        self.roomName = roomName
        self.memberCount = memberCount
        self.memberListModel = memberListModel
        self.roomId = roomId
    }
    
    func postParticipateRoom(invitationCode: String) {
        NetworkService.shared.roomService.postParticipateRoom(requestBody: ParticipateRoomRequestBody(invitationCode: invitationCode), completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                self.isVaildRoom = true
                guard let roomId = response.result?.roomId else {return}
                self.roomId = roomId
                print("self.roomId : \(self.roomId)")
            case .requestErr:
                print("에러 출동")
                self.isVaildRoom = false
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
    func getRoomInfo(roomId: Int) {
        NetworkService.shared.roomService.getRoomInfo(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                guard let result = response.result else {return}
                self.roomType = result.isAdmin ? .owner : .notOwner
                self.memberListModel = result.member.map { member in
                    JoinMemberModel(userId: member.userId, memberName: member.userName)
                }
                self.roomName = result.roomName
                self.memberCount = self.memberListModel.count
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
    func deleteRoomMember(roomId: Int, userId: Int) {
        NetworkService.shared.roomService.deleteRoomMember(roomId: roomId, userId: userId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
    func patchConfirmRoomStatus(roomId: Int) {
        NetworkService.shared.roomService.patchConfirmRoomStatus(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                print("🔥")
                self.showSheet = false
                
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
