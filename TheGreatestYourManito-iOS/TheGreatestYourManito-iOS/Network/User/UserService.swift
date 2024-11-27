//
//  UserService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol UserServiceProtocol {
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody>) -> ())
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody>) -> ())
    
}

final class UserService: BaseService, UserServiceProtocol {
    
    override private init() {}
    
    static let shared = UserService()
    
    let provider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func postUserIdentify(requestBody: UserIdentifyRequestBody, completion: @escaping (NetworkResult<BaseResponseBody>) -> ()) {
        provider.request(.postUserIdentify(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func postMakeUser(requestBody: MakeUserRequestBody, completion: @escaping (NetworkResult<BaseResponseBody>) -> ()) {
        provider.request(.postMakeUser(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
