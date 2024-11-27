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
    case getRoomInfo(roomId: Int)
}

extension RoomTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .postParticipateRoom:
            return .post
        case .getRoomInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .postParticipateRoom:
            return "/room/participate"
        case .getRoomInfo(let roomId):
            return "/room/\(roomId)"
        }
    }
    
    var task: Task {
        switch self {
        case .postParticipateRoom(let requestBody):
            return .requestJSONEncodable(requestBody)
        case .getRoomInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return BaseHeader.headerWithUserCode()
    }
    
}

