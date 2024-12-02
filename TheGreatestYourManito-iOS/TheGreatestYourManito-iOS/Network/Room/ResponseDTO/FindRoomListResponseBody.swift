//
//  FindRoomListResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

// MARK: - FindRoomListResponseBody
struct FindRoomListResponseBody: Codable {
    let rooms: [Room]
}

// MARK: - Room
struct Room: Codable {
    let roomId: Int
    let roomName, endDate: String
}
