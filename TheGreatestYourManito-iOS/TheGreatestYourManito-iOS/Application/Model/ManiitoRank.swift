//
//  ManiitoRank.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 11/9/24.
//

import SwiftUI

enum ManiitoRank {
    case first
    case second
    case third
    case other(num: Int)
    
    var rankNum: Int {
        switch self {
            
        case .first: return 1
        case .second: return 2
        case .third: return 3
        case .other(num: let num): return num
        }
    }
    
    var medalColor: (main: Color, sub: Color) {
        switch self {
            
        case .first:
            return (Color(hex: "FFC225"), Color(hex: "FFDC22"))
        case .second:
            return (Color(hex: "D6D8E2"), Color.gray3)
        case .third:
            return (Color(hex: "E5B491"), Color(hex: "F8D4B2"))
        case .other:
            return (Color.gray4, Color.gray3)
        }
    }
}

extension ManiitoRank {
    var MedalView: some View {
        return ZStack {
            Circle()
                .fill(self.medalColor.main)
                .frame(width: 40, height: 40)
            
            Circle()
                .fill(self.medalColor.sub)
                .frame(width: 28, height: 28)
            
            Text("\(self.rankNum)")
                .font(.pretendardFont(for: .heading4))
        }
    }
}

typealias ManittoRankList = [ManittoRankItem]

struct ManittoRankItem {
    let rank: ManiitoRank
    let fromPerson: User
    let toPerson: User
    let cheerCount: Int
}

struct User {
    let id: Int
    let name: String
}
