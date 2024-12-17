//
//  OpenMaintoViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/4/24.
//

import SwiftUI

class OpenMaintoViewModel: ObservableObject {
    @Published var room: Room
    @Published var receiverName: String = ""
    @Published var receiverID: Int = 0
    @Published var isOpenType: Bool = false
    
    init(room: Room) {
        self.room = room
    }
    
    func onAppear() {
        LocalStorageManager.saveRoomId(room.roomId)
        getManittoReceiver(roomId: room.roomId)
    }
    
    func getManittoReceiver(roomId: Int) {
        NetworkService.shared.roomService.getManittoReceiver(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                guard let result = response.result else {return}
                self.receiverName = result.receiver.userName
                self.receiverID = result.receiver.userId
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}

