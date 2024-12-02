//
//  CheerService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/27/24.
//

import Foundation

import Moya

protocol CheerServiceProtocol {
    
    func getCheerMassage(type: String, completion: @escaping (NetworkResult<BaseResponseBody<CheerMessageResponseBody>>) -> ())
    
    func postSendCheer(requestBody: SendCheerRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<SendCheerResponseBody>>) -> ())
    
}

final class CheerService: BaseService, CheerServiceProtocol {
    
    override private init() {}
    
    static let shared = CheerService()
    
    let provider = MoyaProvider<CheerTargetType>(plugins: [MoyaLoggingPlugin()])
    
    func getCheerMassage(type: String, completion: @escaping (NetworkResult<BaseResponseBody<CheerMessageResponseBody>>) -> ()) {
        provider.request(.getCheerMessage(type: type)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<CheerMessageResponseBody>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func postSendCheer(requestBody: SendCheerRequestBody, completion: @escaping (NetworkResult<BaseResponseBody<SendCheerResponseBody>>) -> ()) {
        provider.request(.postSendCheer(requestBody: requestBody)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<BaseResponseBody<SendCheerResponseBody>> = self.judgeStatus(statusCode: response.statusCode, data: response.data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

