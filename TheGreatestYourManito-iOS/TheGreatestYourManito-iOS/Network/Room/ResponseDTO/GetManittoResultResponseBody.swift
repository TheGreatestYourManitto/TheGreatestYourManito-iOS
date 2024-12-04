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
    let cheerCounts: [CheerCount]
    let manittoRank: [ManittoRank]
}

// MARK: - CheerCount
struct CheerCount: Codable {
    let type: String
    let count: Int
}

typealias CheerCounts = [CheerCount]

extension CheerCounts {
    func toCheerCountDic() -> [CheerType: Int] {
        self.compactMap { cheerCount -> (CheerType, Int)? in
            if let cheerType = CheerType(name: cheerCount.type) {
                return (cheerType, cheerCount.count)
            } else {
                return nil
            }
        }.reduce(into: [CheerType: Int]()) { result, pair in
            result[pair.0] = pair.1
        }
    }
}

// MARK: - Manitto
struct Manitto: Codable {
    let userName: String
    let userId: Int
}

// MARK: - ManittoRank
struct ManittoRank: Codable {
    let rank, userId: Int
    let userName: String
    let manittoUserId: Int
    let manittoUserName: String
    let cheerCount: Int
}

typealias ManittoRanks = [ManittoRank]

extension ManittoRanks {
    func toManittoRankList() -> ManittoRankList {
        self.compactMap { item in
            guard let rank = ManiitoRank(rank: item.rank) else { return nil }
            return ManittoRankItem(
                rank: rank,
                fromPerson: User(id: item.manittoUserId, name: item.manittoUserName),
                toPerson: User(id: item.userId, name: item.userName),
                cheerCount: item.cheerCount
            )
        }
    }
}

