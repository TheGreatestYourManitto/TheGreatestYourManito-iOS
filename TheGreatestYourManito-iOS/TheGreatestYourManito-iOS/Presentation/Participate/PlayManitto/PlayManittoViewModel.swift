//
//  PlayManittoViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

class PlayManittoViewModel: ObservableObject {
    
    @Published private(set) var cheerType: CheerType?
    @Published private(set) var cheerText: String = ""
    
    let receiverUserName: String
    let receiverUserId: Int
    
    init(receiverUserName: String, receiverUserId: Int) {
        self.receiverUserName = receiverUserName
        self.receiverUserId = receiverUserId
    }
    
    enum Action {
        case tapCheerItem(CheerType?)
        case typeCheerText(String)
        case tapSendButton
    }
    
    func performAction(_ action: Action) {
        switch action {
        case .tapCheerItem(let item):
            print("api 결과 get")
            cheerText = "thisistest item : \(item!.name)"
        case .typeCheerText(let text):
            cheerText = text
        case .tapSendButton:
            print("보내기")
        }
    }
}
