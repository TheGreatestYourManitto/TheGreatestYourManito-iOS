//
//  GetManittoResultResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

// MARK: - GetManittoResultResponseBody
struct GetManittoResultResponseBody: Codable {
    let manitto: Manitto
    let cheerCounts: CheerCounts // CheerCounts의 타입을 맞추기 위해 수정
    let manittoRank: [ManittoRank]
}

// MARK: - CheerCounts
struct CheerCounts: Codable {
    let luck, love, fire, present: Int
}

extension CheerCounts {
    func toCheerCountDic() -> [CheerType: Int] {
        [
            .luck: luck,
            .love: love,
            .fire: fire,
            .gift: present
        ]
    }
}

// MARK: - Manitto
struct Manitto: Codable {
    let userName: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
    }
}

// MARK: - ManittoRank
struct ManittoRank: Codable {
    let rank, userID: Int
    let userName: String
    let manittoUserID: Int
    let manittoUserName: String
    let cheerCount: Int

    enum CodingKeys: String, CodingKey {
        case rank
        case userID = "userId"
        case userName
        case manittoUserID = "manittoUserId"
        case manittoUserName, cheerCount
    }
}


typealias ManittoRanks = [ManittoRank]

extension ManittoRanks {
    func toManittoRankList() -> ManittoRankList {
        return self
            .map { item -> ManittoRankItem? in
                // rank 변환 실패 시 nil 반환
                guard let rank = ManiitoRank(rank: item.rank) else {
                    return nil
                }
                
                // rank 변환 성공 시 ManittoRankItem 반환
                return ManittoRankItem(
                    rank: rank,
                    fromPerson: User(id: item.userID, name: item.userName),
                    toPerson: User(id: item.manittoUserID, name: item.manittoUserName),
                    cheerCount: item.cheerCount
                )
            }
            .compactMap { $0 }  // nil을 필터링하여 제거
    }
}



