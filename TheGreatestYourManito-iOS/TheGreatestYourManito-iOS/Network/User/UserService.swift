//
//  UserService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol UserServiceProtocol {
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ())
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<MakeUserResponse>>) -> ())
    
}

final class UserService: BaseService, UserServiceProtocol {
    
    override private init() {}
    
    static let shared = UserService()

    var provider = MoyaProvider<UserTargetType>(plugins: [NetworkActivityPlugin(), MoyaLoggingPlugin()])
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<emptyResponse>>) -> ()) {
        provider.request(.postUserIdentify(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<emptyResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<MakeUserResponse>>) -> ()) {
        provider.request(.postMakeUser(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<MakeUserResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
