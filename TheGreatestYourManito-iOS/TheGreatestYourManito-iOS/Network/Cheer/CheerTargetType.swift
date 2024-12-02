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
}

extension CheerTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .getCheerMessage:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCheerMessage(let type):
            return "/room/\(type)/message"
        }
    }
    
    var task: Task {
        switch self {
        case .getCheerMessage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCheerMessage:
            return nil
        default:
            return BaseHeader.headerWithUserCode()
        }
        
    }
    
}


