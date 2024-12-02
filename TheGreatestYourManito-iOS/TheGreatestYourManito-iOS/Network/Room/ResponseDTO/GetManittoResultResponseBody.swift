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

