//
//  CheerMessageResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

// MARK: - CheerMessageResponseBody
struct CheerMessageResponseBody: Codable {
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let cheerMessage: String

    enum CodingKeys: String, CodingKey {
        case cheerMessage = "cheer_message"
    }
}
