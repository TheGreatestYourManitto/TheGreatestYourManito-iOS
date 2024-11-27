//
//  NetworkService.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 11/14/24.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    let userService: UserService = UserService()
    // ex
    // let openManitoService: OpenManitoService = OpenManitoService()
    
}

