//
//  CheerType.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

enum CheerType: CaseIterable {
    case luck
    case love
    case fire
    case gift
    
    init?(name: String) {
        switch name.lowercased() {
        case "luck":
            self = .luck
        case "love":
            self = .love
        case "fire":
            self = .fire
        case "present":
            self = .gift
        default:
            return nil
        }
    }
    
    var defaultImage: ImageResource {
        switch self {
            
        case .luck:
            return .clover
        case .love:
            return .heart
        case .fire:
            return .fire
        case .gift:
            return .gift
        }
    }
    
    var clickedImage: ImageResource {
        switch self {
            
        case .luck:
            return .cloverClicked
        case .love:
            return .heartClicked
        case .fire:
            return .fireClicked
        case .gift:
            return .giftClicked
        }
    }
    
    var name: String {
        switch self {
            
        case .luck:
            return "luck"
        case .love:
            return "love"
        case .fire:
            return "fire"
        case .gift:
            return "present"
        }
    }
}
