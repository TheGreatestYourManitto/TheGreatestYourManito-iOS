//
//  BaseHeader.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/28/24.
//

import Foundation

struct BaseHeader {
    
    static func headerWithUserCode() -> [String: String] {
        guard let userCode = UserDefaults.standard.string(forKey: UserDefaultsLiterals.userCode) else {return ["": ""]}
        return ["userCode": userCode]
    }
    
}
