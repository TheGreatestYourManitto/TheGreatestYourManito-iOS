//
//  UIFont+.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박신영 on 10/22/24.
//

import SwiftUI

extension UIFont {
    
    static func pretendardFont(for type: PretendardFont) -> UIFont {
        return UIFont(name: type.weight, size: type.size) ?? .systemFont(ofSize: type.size)
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
    
    static func customFont(for style: PretendardFont) -> UIFont {
        switch style {
        case .heading1:
            return UIFont.systemFont(ofSize: 38, weight: .bold)
        case .heading2:
            return UIFont.systemFont(ofSize: 32, weight: .bold)
        case .heading3:
            return UIFont.systemFont(ofSize: 24, weight: .bold)
        case .heading4:
            return UIFont.systemFont(ofSize: 20, weight: .bold)
        case .heading5:
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .heading6:
            return UIFont.systemFont(ofSize: 16, weight: .medium)
        case .subtitle1:
            return UIFont.systemFont(ofSize: 14, weight: .medium)
        case .subtitle2:
            return UIFont.systemFont(ofSize: 12, weight: .medium)
        }
    }
    
}

