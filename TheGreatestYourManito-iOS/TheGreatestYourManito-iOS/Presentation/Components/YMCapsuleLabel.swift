//
//  YMCapsuleLabel.swift
//  TheGreatestYourManito-iOS
//
//  Created by 박민서 on 10/28/24.
//

import SwiftUI

struct YMCapsuleLabel: View {
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Text(text)
            .font(.pretendardFont(for: .heading6))
            .foregroundStyle(foregroundColor)
            .padding(.horizontal, 19)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

struct YMDDayLabel: View {
    let status: ManittoEventStatus
    
    var body: some View {
        YMCapsuleLabel(
            text: status.labelString,
            backgroundColor: status.backgroundColor,
            foregroundColor: status.foregroundColor
        )
    }
}
