//
//  UserTargetType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

enum UserTargetType {
    
    case postUserIdentify(requestBody: UserIdentifyRequestBody)
    case postMakeUser(requestBody: MakeUserRequestBody)
    
}

extension UserTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .postUserIdentify, .postMakeUser:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postUserIdentify:
            return "/user/identify"
        case .postMakeUser:
            return "/user"
        }
    }
    
    var task: Task {
        switch self {
        case .postUserIdentify(let requestBody):
            return .requestJSONEncodable(requestBody)
        case .postMakeUser(let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
    
}
