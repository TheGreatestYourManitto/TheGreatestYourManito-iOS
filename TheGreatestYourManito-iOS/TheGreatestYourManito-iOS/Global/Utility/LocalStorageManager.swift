//
//  LocalStorageManager.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 12/18/24.
//

import Foundation

struct LocalStorageManager {
    private static let roomIdsKey = "EnteredRoomIds"
    private static let userIdKey = "CurrentUserId"
    
    private init() {}
    
    // MARK: - Room ID 기능
    static func saveRoomId(_ roomId: Int) {
        var roomIds = fetchRoomIds()
        if !roomIds.contains(roomId) {
            roomIds.append(roomId)
            UserDefaults.standard.set(roomIds, forKey: roomIdsKey)
        }
    }
    
    static func containsRoomId(_ roomId: Int) -> Bool {
        let roomIds = fetchRoomIds()
        return roomIds.contains(roomId)
    }
    
    static func fetchRoomIds() -> [Int] {
        return UserDefaults.standard.array(forKey: roomIdsKey) as? [Int] ?? []
    }
    
    static func deleteRoomId(_ roomId: Int) {
        var roomIds = fetchRoomIds()
        roomIds.removeAll { $0 == roomId }
        UserDefaults.standard.set(roomIds, forKey: roomIdsKey)
    }
    
    static func clearAllRoomIds() {
        UserDefaults.standard.removeObject(forKey: roomIdsKey)
    }
    
    // MARK: - User ID 기능
    static func saveUserId(_ userId: Int) {
        UserDefaults.standard.set(userId, forKey: userIdKey)
    }
    
    static func fetchUserId() -> Int? {
        return UserDefaults.standard.integer(forKey: userIdKey) != 0
        ? UserDefaults.standard.integer(forKey: userIdKey)
        : nil
    }
    
    static func clearUserId() {
        UserDefaults.standard.removeObject(forKey: userIdKey)
    }
}
