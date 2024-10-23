//
//  UIFont+.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/22/24.
//

import SwiftUI

extension Font {
    
    static func pretendardFont(for type: PretendardFont) -> Font {
           return .custom(type.weight, size: type.size)
       }
    
    enum PretendardFont {
        case heading1, heading2, heading3, heading4, heading5
        case heading6, subtitle1, subtitle2
        
        var size: CGFloat {
            switch self {
            case .heading1:
                38
            case .heading2:
                32
            case .heading3:
                24
            case .heading4:
                20
            case .heading5:
                18
            case .heading6:
                16
            case .subtitle1:
                14
            case .subtitle2:
                12
            }
        }
        
        var weight: String {
            switch self {
            case .heading1, .heading2, .heading3, .heading4, .heading5:
                "Pretendard-Bold"
            case .heading6, .subtitle1, .subtitle2:
                "Pretendard-Medium"
            }
        }
        
        var lineHeight: CGFloat {
            switch self {
            case .heading6, .subtitle1, .subtitle2:
                1.5
            default: 0
            }
        }
    }
    
}

