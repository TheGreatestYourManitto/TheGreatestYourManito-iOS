//
//  OpenMaintoViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/4/24.
//

import SwiftUI

class OpenMaintoViewModel: ObservableObject {
    
    @Published var receiverName: String = ""
    let roomId: Int
    
    init(roomId: Int) {
        self.roomId = roomId
    }
    
    func getManittoReceiver(roomId: Int) {
        NetworkService.shared.roomService.getManittoReceiver(roomId: roomId, completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
                guard let result = response.result else {return}
                self.receiverName = result.receiver.userName
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}

