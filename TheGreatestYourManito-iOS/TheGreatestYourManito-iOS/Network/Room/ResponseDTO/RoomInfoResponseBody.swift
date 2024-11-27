//
//  RoomInfoResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import Foundation

struct RoomInfoResponseBody: Codable {
    let isAdmin: Bool
    let invitationCode: String
    let member: [Member]
    let roomName: String
}

struct Member: Codable {
    let userId: Int
    let userName: String
}
