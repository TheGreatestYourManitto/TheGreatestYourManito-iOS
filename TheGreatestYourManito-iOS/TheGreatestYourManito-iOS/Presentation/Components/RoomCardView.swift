//
//  RoomCardView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/27/24.
//

import SwiftUI

struct RoomCardView: View {
    var roomName: String    
    var dDay: Int
    let onTap: () -> Void
    
    
    var body: some View {
        HStack(spacing: 24) {
            
            Text(roomName)
                .font(.pretendardFont(for: .heading5))
                .foregroundStyle(.ymBlack)
            Spacer()
            YMDDayLabel(status: .ongoing(dDay: dDay))
            Image(.icnRightarrow)
        }
        .padding(24)
        .background(.ymWhite)
        .clipShape(.rect(cornerRadius: 10))
        .frame(height: 96)
        .onTapGesture {
            onTap() // 클릭 이벤트 실행
        }
    }
    
}
