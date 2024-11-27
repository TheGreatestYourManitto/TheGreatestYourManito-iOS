//
//  RoomCardView.swift
//  TheGreatestYourManito-iOS
//
//  Created by 이자민 on 10/27/24.
//

import SwiftUI

struct DdayTag: View {
    var dayCount: String
    var isExpired: Bool
    
    var body: some View {
        Text(dayCount)
            .frame(width: 72, height: 32)
            .background(isExpired ? .gray3 : .sub2)
            .foregroundStyle(isExpired ? .gray1 : .ymPrimary)
            .clipShape(.rect(cornerRadius: 16))
            
    }
    
}

struct RoomCardView: View {
    var title: String
    var subtitle: String
    var endDate: Date

    private var dayDisplay: (text: String, isExpired: Bool) {
        let currentDate = Calendar.current.startOfDay(for: Date())
        let targetDate = Calendar.current.startOfDay(for: endDate)
        let daysRemaining = Calendar.current.dateComponents([.day], from: currentDate, to: targetDate).day ?? 0

        if daysRemaining > 0 {
            return ("D-\(daysRemaining)", false)
        } else if daysRemaining == 0 {
            return ("D-day", false)
        } else {
            return ("종료", true)
        }
    }


    var body: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.pretendardFont(for: .heading5))
                    .foregroundStyle(.ymBlack)
                Text(subtitle)
                    .font(.pretendardFont(for: .heading6))
                    .foregroundStyle(.gray1)
            }
            Spacer()
            DdayTag(dayCount: dayDisplay.text, isExpired: dayDisplay.isExpired)
            Image(.icnRightarrow)
        }
        .padding(24)
        .background(.ymWhite)
        .clipShape(.rect(cornerRadius: 10))
        .frame(height: 96)
        
    }
}

#Preview {
    RoomCardView(
        title: "RoomTitle",
        subtitle: "Manito",
        endDate: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 27))!)
}
