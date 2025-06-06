//
//  UXPolicy.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 12/17/24.
//

import Foundation

struct UXPolicy {
    static let apiDelay: TimeInterval = 1
    static let toastDelay: TimeInterval = 2
}

struct UserInputPolicy {
    static let userNickNameRegex = "^[a-zA-Z가-힣]{1,7}$"
    static let roomNameMaxLength = 20
    
    static func userNickNameIsValid(_ userNickName: String) -> Bool {
        return userNickName.range(of: userNickNameRegex, options: .regularExpression) != nil
    }
}
