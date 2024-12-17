//
//  UserCodeResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import Foundation

struct MakeUserResponse: Decodable {
    let userCode: String
}

struct UserResponse: Decodable {
    let userCode: String
    let userId: Int
}
