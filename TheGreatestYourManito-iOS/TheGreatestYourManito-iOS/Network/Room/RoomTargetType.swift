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
    case deleteRoomMember(roomId: Int, userId: Int)
    case patchConfirmRoomStatus(roomId: Int)
//    /room/:roomId/member/:userId
}

extension RoomTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .postParticipateRoom:
            return .post
        case .getRoomInfo:
            return .get
        case .deleteRoomMember:
            return .delete
        case .patchConfirmRoomStatus:
            return .patch
        }
    }
    
    var path: String {
        switch self {
        case .postParticipateRoom:
            return "/room/participate"
        case .getRoomInfo(let roomId), .patchConfirmRoomStatus(let roomId):
            return "/room/\(roomId)"
        case .deleteRoomMember(let roomId, let userId):
            return "/room/\(roomId)/member/\(userId)"
        }
    }
    
    var task: Task {
        switch self {
        case .postParticipateRoom(let requestBody):
            return .requestJSONEncodable(requestBody)
        case .getRoomInfo, .deleteRoomMember, .patchConfirmRoomStatus:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return BaseHeader.headerWithUserCode()
    }
    
}

