//
//  BaseResponseBody.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

struct BaseResponseBody<T: Decodable>: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: T?
}

struct EmptyResponse: Decodable {}
