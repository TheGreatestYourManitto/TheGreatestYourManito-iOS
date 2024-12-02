//
//  ManittoResultBoardViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import Foundation

final class ManittoResultBoardViewModel: ObservableObject {
    
    let manittoName: String
    let manittoRoomName: String
    let cheerCounts: [CheerType: Int]
    var totalCheerCount: Int { cheerCounts.values.reduce(0, +) }
    let manittoRankList: ManittoRankList
    
    init(
        manittoName: String,
        manittoRoomName: String,
        cheerCounts: [CheerType : Int],
        manittoRankList: ManittoRankList
    ) {
        self.manittoName = manittoName
        self.manittoRoomName = manittoRoomName
        self.cheerCounts = cheerCounts
        self.manittoRankList = manittoRankList
    }
    
    //TODO: roomId 필요
    // 마니또 결과 받기
    func getManittoResult(roomId: Int) {
        NetworkService.shared.roomService.getManittoResult(roomId: 21) {result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            default:
                print("Failed to another reason")
                return
            }
        }
    }
    
    //TODO: roomId 필요
    // 마니또 방 목록에서 삭제하기
    func delRemoveRoomFromList(roomId: Int) {
        NetworkService.shared.roomService.delRemoveRoomFromList(roomId: 21) {result in
            switch result {
            case .success(let response):
                print("Success: \(response)")
            default:
                print("Failed to another reason")
                return
            }
        }
    }
}
