//
//  MainViewmodel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import SwiftUI

final class MainViewmodel: ObservableObject {
    @Published var rooms: [Room] = []
    
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
    
    func getManittoReceiver(roomId: Int) {
        NetworkService.shared.roomService.getRoomInfo(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                guard let result = response.result else {return}
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
