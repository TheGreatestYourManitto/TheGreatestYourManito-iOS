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
    
}

extension UserTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .postUserIdentify:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postUserIdentify:
            return "/user/identify"
        }
    }
    
    var task: Task {
        switch self {
        case .postUserIdentify(let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        default:
            return nil
        }
    }
    
}
