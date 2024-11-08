//
//  ManittoEventStatus.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

enum ManittoEventStatus {
    /// 이벤트 진행 중
    case ongoing(dDay: Int)
    /// 이벤트 종료됨
    case ended
    
    var foregroundColor: Color {
        switch self {
        case .ongoing: return .ymPrimary
        case .ended: return .gray3
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .ongoing: return .sub2
        case .ended: return .gray1
        }
    }
    
    var labelString: String {
        switch self {
            
        case .ongoing(dDay: let dDay):
            return dDay == 0 ? "D-Day" : "D-\(dDay)"
        case .ended:
            return "종료"
        }
    }
    
    /// 날짜를 비교하여 EventStatus 반환
    static func getStatus(from eventDate: Date) -> Self {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let eventDay = calendar.startOfDay(for: eventDate)
        
        if let dDay = calendar.dateComponents([.day], from: today, to: eventDay).day {
            if dDay < 0 {
                return .ended
            } else {
                return .ongoing(dDay: dDay)
            }
        }
        
        return .ended
    }
}
