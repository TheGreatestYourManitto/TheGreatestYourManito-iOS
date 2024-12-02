//
//  FindRoomListResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

struct FindRoomListResponseBody: Codable {
    let rooms: [Room]
}

struct Room: Codable {
    let roomID: Int
    let roomName, endDate: String
}
