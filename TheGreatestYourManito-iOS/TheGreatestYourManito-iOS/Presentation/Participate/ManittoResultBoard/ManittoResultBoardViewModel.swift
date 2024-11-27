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
    
    func tapDeleteButton() {
        print("삭제 빵야")
    }
}
