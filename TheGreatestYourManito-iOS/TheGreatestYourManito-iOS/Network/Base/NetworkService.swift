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
    
    let userService: UserServiceProtocol = UserService.shared
    
    let roomService: RoomServiceProtocol = RoomService.shared
    
    let cheerService: CheerServiceProtocol = CheerService.shared
    
}
