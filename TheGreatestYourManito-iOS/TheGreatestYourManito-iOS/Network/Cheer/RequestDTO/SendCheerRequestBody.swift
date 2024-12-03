//
//  SendCheerRequestBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 12/3/24.
//

import Foundation

struct SendCheerRequestBody: Encodable {
    let roomId: Int
    let cheerType, message: String
}
