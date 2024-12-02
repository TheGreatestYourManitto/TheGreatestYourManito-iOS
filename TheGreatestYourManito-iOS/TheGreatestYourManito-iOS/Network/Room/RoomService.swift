//
//  RoomService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol RoomServiceProtocol {
    
    func getFindRoomList(completion: @escaping (NetworkResult<BaseResponseBody<FindRoomListResponseBody>>) -> ())
    
    func postParticipateRoom(requestBody: ParticipateRoomRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<ParticipateRoomResponseBody>>) -> ())
    
    func getRoomInfo(roomId: Int, completion: @escaping (NetworkResult<BaseResponseBody<RoomInfoResponseBody>>) -> ())
    
    func deleteRoomMember(roomId: Int, userId: Int, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ())
    
    func patchConfirmRoomStatus(roomId: Int, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ())
    
}

final class RoomService: BaseService, RoomServiceProtocol {
    
    override private init() {}
    
    static let shared = RoomService()
    
    let provider = MoyaProvider<RoomTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getFindRoomList(completion: @escaping (NetworkResult<BaseResponseBody<FindRoomListResponseBody>>) -> ()) {
        provider.request(.getFindRoomList)  { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<FindRoomListResponseBody>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
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
    
    func deleteRoomMember(roomId: Int, userId: Int, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ()) {
        provider.request(.deleteRoomMember(roomId: roomId, userId: userId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<emptyResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func patchConfirmRoomStatus(roomId: Int, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ()) {
        provider.request(.getRoomInfo(roomId: roomId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<emptyResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

