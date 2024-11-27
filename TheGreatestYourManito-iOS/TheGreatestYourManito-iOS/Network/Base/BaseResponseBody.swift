//
//  BaseResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

struct BaseResponseBody: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: BaseResponseResult?
}

struct BaseResponseResult: Codable {
    let userCode: String
}
