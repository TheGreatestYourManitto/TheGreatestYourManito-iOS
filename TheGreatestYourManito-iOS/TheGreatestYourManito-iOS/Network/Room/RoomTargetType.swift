//
//  RoomTargetType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

enum RoomTargetType {
    case getFindRoomList
    case postMakeRoom(requestBody: MakeRoomRequestBody)
    case postParticipateRoom(requestBody: ParticipateRoomRequestBody)
    case getRoomInfo(roomId: Int)
    case deleteRoomMember(roomId: Int, userId: Int)
    case patchConfirmRoomStatus(roomId: Int)
    case getManittoReceiver(roomId: Int)
    case delRemoveRoomFromList(roomId: Int)
    case getManittoResult(roomId: Int)
//    /room/:roomId/member/:userId
}

extension RoomTargetType: BaseTargetType {
    
    var method: Moya.Method {
        switch self {
        case .getFindRoomList, .getRoomInfo, .getManittoReceiver, .getManittoResult:
            return .get
        case .postMakeRoom, .postParticipateRoom:
            return .post
        case .deleteRoomMember, .delRemoveRoomFromList:
            return .delete
        case .patchConfirmRoomStatus:
            return .patch
        }
    }
    
    var path: String {
        switch self {
        case .getFindRoomList, .postMakeRoom:
            return "/room"
        case .postParticipateRoom:
            return "/room/participate"
        case .getRoomInfo(let roomId), .patchConfirmRoomStatus(let roomId):
            return "/room/\(roomId)"
        case .deleteRoomMember(let roomId, let userId):
            return "/room/\(roomId)/member/\(userId)"
        case .getManittoReceiver(let roomId):
            return "/room/\(roomId)/receiver"
        case .delRemoveRoomFromList(let roomId):
            return "/room/\(roomId)/withdraw"
        case .getManittoResult(let roomId):
            return "/room/\(roomId)/result"
        }
    }
    
    var task: Task {
        switch self {
        case .postMakeRoom(let requestBody):
            return .requestJSONEncodable(requestBody)
        case .postParticipateRoom(let requestBody):
            return .requestJSONEncodable(requestBody)
        case .getFindRoomList, .getRoomInfo, .deleteRoomMember,
                .patchConfirmRoomStatus, .getManittoReceiver, .delRemoveRoomFromList, .getManittoResult:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return BaseHeader.headerWithUserCode()
    }
    
}

