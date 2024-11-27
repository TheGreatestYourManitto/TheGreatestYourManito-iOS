//
//  RoomService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol RoomServiceProtocol {
    
    func postParticipateRoom(requestBody: ParticipateRoomRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<ParticipateRoomResponseBody>>) -> ())
    
    func getRoomInfo(roomId: Int, completion: @escaping (NetworkResult<BaseResponseBody<RoomInfoResponseBody>>) -> ())
    
}

final class RoomService: BaseService, RoomServiceProtocol {
    
    override private init() {}
    
    static let shared = RoomService()
    
    let provider = MoyaProvider<RoomTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postParticipateRoom(requestBody: ParticipateRoomRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<ParticipateRoomResponseBody>>) -> ()) {
        provider.request(.postParticipateRoom(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<ParticipateRoomResponseBody>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func getRoomInfo(roomId: Int, completion: @escaping (NetworkResult<BaseResponseBody<RoomInfoResponseBody>>) -> ()) {
        provider.request(.getRoomInfo(roomId: roomId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<RoomInfoResponseBody>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

