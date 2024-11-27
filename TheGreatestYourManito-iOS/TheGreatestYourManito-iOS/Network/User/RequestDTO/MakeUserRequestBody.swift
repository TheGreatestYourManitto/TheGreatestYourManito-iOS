//
//  MakeUserRequestBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

struct MakeUserRequestBody: Encodable {
    let nickname: String
    let deviceId: String
}
