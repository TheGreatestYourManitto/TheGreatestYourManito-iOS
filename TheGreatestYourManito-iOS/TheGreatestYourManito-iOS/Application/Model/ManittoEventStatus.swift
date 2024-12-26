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
    
    // 버튼 제목
    var buttonTitle: String {
        switch self {
        case .ongoing:
            return "보내기" // 이벤트가 진행 중일 때의 버튼 제목
        case .ended:
            return "결과보기" // 이벤트가 종료되었을 때의 버튼 제목
        }
    }
    
    // 버튼 액션
    var buttonAction: () -> Void {
        switch self {
        case .ongoing:
            return {
                // 진행 중인 이벤트의 버튼 액션
                print("진행 중 이벤트")
            }
        case .ended:
            return {
                // 종료된 이벤트의 버튼 액션
                print("종료된 이벤트")
            }
        }
    }
    
    static func getStatus(from isoDateString: String) -> Self {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // ISO8601의 YYYY-MM-DDTHH:mm:ssZ 형식
        
        guard let utcDate = isoFormatter.date(from: isoDateString) else {
            return .ended // 유효하지 않은 날짜일 경우 종료 상태 반환
        }
        
        // 로컬 타임존으로 변환
        let localCalendar = Calendar.current
        let localEventDate = localCalendar.startOfDay(for: utcDate) // UTC를 로컬 타임존 기준으로 변환
        let localToday = localCalendar.startOfDay(for: Date()) // 로컬 타임존의 오늘
        
        if let dDay = localCalendar.dateComponents([.day], from: localToday, to: localEventDate).day {
            if dDay < 0 {
                return .ended
            } else if dDay == 0 {
                // 오늘 날짜이고, 시간이 지나면 종료 상태로 설정
                let localEventHour = localCalendar.component(.hour, from: utcDate)
                let localEventMinute = localCalendar.component(.minute, from: utcDate)
                
                let localNow = Date()
                let currentHour = localCalendar.component(.hour, from: localNow)
                let currentMinute = localCalendar.component(.minute, from: localNow)
                
                if currentHour > localEventHour || (currentHour == localEventHour && currentMinute > localEventMinute) {
                    return .ended
                } else {
                    return .ongoing(dDay: 0)
                }
            } else {
                return .ongoing(dDay: dDay)
            }
        }
        
        return .ended
    }
}
