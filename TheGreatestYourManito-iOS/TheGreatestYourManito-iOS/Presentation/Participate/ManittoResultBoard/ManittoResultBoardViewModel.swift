//
//  ManittoResultBoardViewModel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import Foundation

final class ManittoResultBoardViewModel: ObservableObject {
    
    @Published var deleteCompleted: Bool = false
    @Published var manittoName: String = ""
    @Published var cheerCounts: [CheerType: Int] = [:]
    @Published var manittoRankList: ManittoRankList = []
    
    let manittoRoomName: String
    let manittoRoomId: Int
    
    var totalCheerCount: Int { cheerCounts.values.reduce(0, +) }
    
    init (manittoRoomName: String, manittoRoomId: Int) {
        self.manittoRoomName = manittoRoomName
        self.manittoRoomId = manittoRoomId
    }
    
    func onAppear() {
        getManittoResult(roomId: self.manittoRoomId)
    }
    
    func tapDeleteButton() {
        delRemoveRoomFromList(roomId: self.manittoRoomId)
    }
}

// MARK: API
private extension ManittoResultBoardViewModel {
    
    // 마니또 결과 받기
    func getManittoResult(roomId: Int) {
        NetworkService.shared.roomService.getManittoResult(roomId: roomId) { [weak self] result in
            switch result {
            case .success(let response):
#if DEBUG
                print(print("Success: \(response)"))
#endif
                guard let result = response.result else {return}
                self?.manittoName = result.manitto.userName
                self?.cheerCounts = result.cheerCounts.toCheerCountDic()
                self?.manittoRankList =  result.manittoRank.toManittoRankList()
                
            default:
#if DEBUG
                print("error: \(result)")
#endif
                break
            }
        }
    }
    
    // 마니또 방 목록에서 삭제하기
    func delRemoveRoomFromList(roomId: Int) {
        NetworkService.shared.roomService.delRemoveRoomFromList(roomId: roomId) { [weak self] result in
            switch result {
            case .success(let response):
#if DEBUG
                print(print("Success: \(response)"))
#endif
                self?.deleteCompleted = true
                
            default:
#if DEBUG
                print("error: \(result)")
#endif
                break
            }
        }
    }
}
