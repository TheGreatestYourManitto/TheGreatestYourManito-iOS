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
        case .ongoing: return .sub2
        case .ended: return .gray3
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .ongoing: return .gray1
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
}
