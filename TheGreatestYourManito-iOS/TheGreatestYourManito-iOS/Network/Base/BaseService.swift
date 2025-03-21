//
//  BaseService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/14/24.
//

import Foundation

class BaseService {
    func judgeStatus<T: Decodable>(statusCode: Int, data: Data) -> NetworkResult<T> {
        switch statusCode {
        case 200..<205:
            return isValidData(data: data, responseType: T.self)
        case 400..<500:
            let decoder = JSONDecoder()
            let errorResponse = try? decoder.decode(T.self, from: data)
            return .requestErr(errorResponse as T?)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
   
    func isValidData<T: Decodable>(data: Data, responseType: T.Type) -> NetworkResult<T> {
      let decoder = JSONDecoder()
      guard let decodedData = try? decoder.decode(T.self, from: data) else {
         print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
         return .decodedErr
      }
      
      return .success(decodedData)
   }
}
