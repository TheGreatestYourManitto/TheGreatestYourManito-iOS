//
//  UserService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol UserServiceProtocol {
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<UserResponse>>) -> ())
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<UserResponse>>) -> ())
    
}

final class UserService: BaseService, UserServiceProtocol {
    
    override private init() {}
    
    static let shared = UserService()
    
    let provider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<UserResponse>>) -> ()) {
        provider.request(.postUserIdentify(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<UserResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<UserResponse>>) -> ()) {
        provider.request(.postMakeUser(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<UserResponse>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
