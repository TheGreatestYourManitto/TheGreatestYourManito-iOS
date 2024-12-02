//
//  ManittoReceiverResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

// MARK: - ManittoReceiverResponseBody
struct ManittoReceiverResponseBody: Codable {
    let receiver: Receiver
    let endDate: String
}

// MARK: - Receiver
struct Receiver: Codable {
    let userName: String
    let userId: Int
}
