//
//  Date+.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 11/28/24.
//

import SwiftUI

extension Date {
    
    func toISO8601String() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return isoFormatter.string(from: self)
    }
    
    static func calculateDDay(from dateString: String) -> Int? {        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let targetDate = dateFormatter.date(from: dateString) {
            // 현재 날짜 계산
            let today = Calendar.current.startOfDay(for: Date())
            
            // 종료 날짜 계산
            let targetDay = Calendar.current.startOfDay(for: targetDate)
            
            let components = Calendar.current.dateComponents([.day], from: today, to: targetDay)
            return components.day
        } else {
            print("Failed to parse date.")
            return nil
        }
    }
    
}
