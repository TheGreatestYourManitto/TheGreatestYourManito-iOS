//
//  CheerTargetType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

enum CheerTargetType {
    case getCheerMessage(type: String)
    case postSendCheer(requestBody: SendCheerRequestBody)
}

extension CheerTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .getCheerMessage:
            return .get
        case .postSendCheer:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getCheerMessage(let type):
            return "/room/\(type)/message"
        case .postSendCheer:
            return "/cheer"
        }
    }
    
    var task: Task {
        switch self {
        case .getCheerMessage:
            return .requestPlain
        case .postSendCheer(let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postSendCheer:
            return BaseHeader.headerWithUserCode()
        default:
            return nil
        }
        
    }
    
}


