//
//  RoomHistoryManager.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 12/18/24.
//

import Foundation

struct RoomHistoryManager {
    private static let key = "EnteredRoomIds"
    
    private init() {}
    
    static func saveRoomId(_ roomId: Int) {
        var roomIds = fetchRoomIds()
        if !roomIds.contains(roomId) {
            roomIds.append(roomId)
            UserDefaults.standard.set(roomIds, forKey: key)
        }
    }
    
    static func containsRoomId(_ roomId: Int) -> Bool {
        let roomIds = fetchRoomIds()
        print("왜 안나와@@@: \(roomIds)")
        return roomIds.contains(roomId)
    }
    
    static func fetchRoomIds() -> [Int] {
        return UserDefaults.standard.array(forKey: key) as? [Int] ?? []
    }
    
    static func deleteRoomId(_ roomId: Int) {
        var roomIds = fetchRoomIds()
        roomIds.removeAll { $0 == roomId }
        UserDefaults.standard.set(roomIds, forKey: key)
    }
    
    static func clearAllRoomIds() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
