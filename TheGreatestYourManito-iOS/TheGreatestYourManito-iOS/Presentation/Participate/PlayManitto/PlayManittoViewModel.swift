//
//  PlayManittoViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

class PlayManittoViewModel: ObservableObject {
    
    @Published var cheerType: CheerType?
    @Published var cheerText: String = ""
    
    let receiverUserName: String
    let receiverUserId: Int
    
    init(receiverUserName: String, receiverUserId: Int) {
        self.receiverUserName = receiverUserName
        self.receiverUserId = receiverUserId
    }
}
