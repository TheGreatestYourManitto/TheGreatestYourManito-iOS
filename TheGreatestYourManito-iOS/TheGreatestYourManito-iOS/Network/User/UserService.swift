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

//MARK: - PostMakeUser
/// 1. postMakeUser 사용할 때에 아래 함수 해당 뷰 ViewModel에 추가
/// 2. 위 ViewModel의 View에 .onappear 코드 사용

/*
//PostMakeUser

 
...
 
.onAppear(perform: {
   (뷰 모델 변수명).postMakeUser()
})
*/


//MARK: - PostUserIdentify
/**

 */
