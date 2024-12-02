//
//  MainViewmodel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import SwiftUI

final class MainViewmodel: ObservableObject {
    
    func getFindRoomList() {
        NetworkService.shared.roomService.getFindRoomList(completion: { result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            default:
                print("Failed to another reason")
                return
            }
        })
    }
    
}
