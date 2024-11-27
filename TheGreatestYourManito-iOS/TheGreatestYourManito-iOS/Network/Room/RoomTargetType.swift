//
//  RoomTargetType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

enum RoomTargetType {
    
    case postParticipateRoom(requestBody: ParticipateRoomRequestBody)
//    case postMakeUser(requestBody: MakeUserRequestBody)
    
}

extension RoomTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .postParticipateRoom:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .postParticipateRoom:
            return "/room/participate"
        }
    }
    
    var task: Task {
        switch self {
        case .postParticipateRoom(let requestBody):
            return .requestJSONEncodable(requestBody)
        }
    }
    
    var headers: [String : String]? {
        guard let userCode = UserDefaults.standard.string(forKey: "userCode") else {return nil}
                
        return ["userCode": userCode]
    }
    
}

